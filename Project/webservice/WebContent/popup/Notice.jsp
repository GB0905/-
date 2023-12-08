<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>공지사항</title>
	<link rel="stylesheet" type="text/css" href="../css/Notice.css" />
</head>
<body>
<script type="text/javascript">
function noRefresh()
{
    /* CTRL + N키 막음. */
    if ((event.keyCode == 78) && (event.ctrlKey == true))
    {
        event.keyCode = 0;
        return false;
    }
    /* F5 번키 막음. */
    if(event.keyCode == 116)
    {
        event.keyCode = 0;
        return false;
    }
}

document.onkeydown = noRefresh ;

</script>
<div id="top_line"></div>
 <div id="notice_write">
        
            <div id="Toparea">
            <h2>공지사항</h2>
            
            </div>
            <%
            	String noti_num = request.getParameter("noti_num");
            	try{
            		Class.forName("com.mysql.jdbc.Driver");
            		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234");
            		Statement stmt = conn.createStatement();
            		ResultSet rs = stmt.executeQuery("select * from server.notice where noti_num="+noti_num+"");
            		if(rs.next()){
            		//조회수 증가
            		int noti_views = rs.getInt("noti_views");
         
            		//공지사항 제목과 내용 가져오기
            		String title = rs.getString("noti_title");
            		String content = rs.getString("noti_content");
            	%>
                <form method="get">
                
                    <div id="notice_title">
                    	
                    <h2><%=title %></h2>	
      
                    </div>
 
                    <div id="notice_content">
                    <textarea id="ncontent" readonly><%=content %></textarea>
             	
                    </div>
                    
 					<div class="Bottomarea">
 					<hr>
 					첨부파일
                    </div>
                    
                    
                    
                </form><%
                String s_id = (String) session.getAttribute("sessionID");
                if(s_id==null){
                	
                }else {
                stmt.executeUpdate("update server.notice set noti_views = "+(noti_views+1)+" where noti_num="+noti_num+"");
                }
            		} else 
            			out.println("<script> alert('비정상적인 접근입니다.'); window.close(); </script>");
                } catch(Exception e){
            		e.printStackTrace();
            	}
            %>
   </div>
   

</body>
</html>
