<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String s_id = (String) session.getAttribute("sessionID");
	String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	request.setCharacterEncoding("UTF-8");
	String path = application.getRealPath("/example/files");
	
	int size = 1024 * 1024 * 100;
	
	String txt = ""; 		// 문자열
	String num = ""; 		// 숫자
	
	String r_title = "";
	String r_title_ex = "";
	String r_cat = "";
	String r_time = "";
	String r_dif = "";
	ArrayList<String> m_nameList = new ArrayList<String>();
	ArrayList<String> m_amountList = new ArrayList<String>();
	ArrayList<String> explainList = new ArrayList<String>();
	String[] m_name;
	String[] m_amount;
	String[] explain;
	
	ArrayList<String> filename = new ArrayList<String>(); 	// 첨부파일명
	ArrayList<String> orgfilename = new ArrayList<String>(); // 첨부파일명
	ArrayList<String> file = new ArrayList<String>(); // 첨부파일명
	
	try {
    
		MultipartRequest multi = new MultipartRequest(request, 	
													  path,		
													  size,		
												 	  "UTF-8",	
												      new DefaultFileRenamePolicy());
		
		r_title = multi.getParameter("reci_title");
		r_title_ex = multi.getParameter("reci_explain");
		r_cat = multi.getParameter("cok_category_1");
		r_time = multi.getParameter("cok_time");
		r_dif = multi.getParameter("cok_degree");
		m_name = multi.getParameterValues("_metaname");
		for(String temp : m_name)
			m_nameList.add(temp);
		m_amount = multi.getParameterValues("_metaamount");
		for(String temp : m_amount)
			m_amountList.add(temp);
		explain = multi.getParameterValues("explains");
		for(String temp : explain)
			explainList.add(temp);
		Enumeration<?> e = multi.getFileNames();
		
		while (e.hasMoreElements()) {
			file.add((String)e.nextElement());

		}
		file.sort(Comparator.naturalOrder());
		int i = 0;
		while(i < file.size()){
			filename.add(multi.getFilesystemName(file.get(i)));			
			orgfilename.add(multi.getOriginalFileName(file.get(i)));
			i++;
		}
		
		} catch(Exception e) {
			System.out.println(e);
		}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
	try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from server.post");
	int postnum=0;
	while(rs.next()){
		postnum = rs.getInt("post_code");
	}
	stmt.executeUpdate("INSERT INTO server.post" +
			"(post_code, post_title, post_comment, thumbnail, post_cooktime, post_cookcat, post_cookdiff, post_day, post_state, views, u_nick)" +
			"VALUES("+(postnum+1)+", '"+r_title+"', '"+r_title_ex+"', '"+filename.get(filename.size()-1)+"', "+r_time+", '"+r_cat+"', '"+r_dif+"', '"+Today+"', 0, 0, '"+s_id+"')");
			
		for (int i=0; i<m_nameList.size(); i++){
		stmt.executeUpdate("INSERT INTO server.stuff" +
				"(stuf_name, stuf_amount, post_code)" +
				"VALUES('"+m_nameList.get(i)+"', '"+m_amountList.get(i)+"', "+(postnum+1)+")");
		}
		
		for (int i=0; i<(explainList.size()); i++){
			stmt.executeUpdate("INSERT INTO server.progress_pic" +
						"(pic_name, pic_content, post_code)" +
						"VALUES('"+filename.get(i)+"', '"+explainList.get(i)+"', "+(postnum+1)+")");
		}
		out.println("<script>alert('글이 등록되었습니다.');</script>");
		out.println("<script> location.replace('./PostBoard.jsp?post_code="+(postnum+1)+"'); </script>");
	rs.close();
	stmt.close();
	conn.close();
	
}
	catch (Exception e){
		out.println("<script>alert('등록중 오류가 발생했습니다.');</script>");
		out.println("<script> location.history.back(); </script>");
		e.printStackTrace();
	}
%>

</body>
</html>