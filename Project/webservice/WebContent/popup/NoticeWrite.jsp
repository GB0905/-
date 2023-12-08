<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>공지사항 등록</title>
	<link rel="stylesheet" type="text/css" href="../css/NoticeWrite.css" />
</head>
<body>
<%
int noti_num = 0;
	String a_id = (String) session.getAttribute("adminID");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from server.notice");
		while(rs.next()){
			noti_num = rs.getInt("noti_num");
		}
		noti_num += 1;
		//사용객체 연결해제
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<div id="top_line"></div>
 <div id="notice_write">
        
            <div id="Toparea">
            <h2>공지사항 등록</h2>
            <p>한번 등록된 공지는 수정할 수 없습니다.
            </div>
            
                <form action="Notice_Submit.jsp" method="post">
                
                    <div id="notice_title">
                    	<p>제목</p>
                    	<input type="text" name="noti_title" id="ntitle" maxlength = "50" required >
                    </div>
 
                    <div id="notice_content">
                    	<P>내용</p>
                        <textarea name="noti_content" id="ncontent" maxlength="860" required></textarea>
                    </div>
                    
                    <div id="bottom_line"></div>
                    
 					<div class="Bottomarea">
 					
 						<input type="hidden" name="noti_num" value="<%=noti_num%>">
 						<input type="hidden" name="admin_id" value="<%=a_id%>">
 						<input type="file" name="Select_File" />
 						
                   		<button id="write_btn" type="submit">등록하기</button>
 
                    </div>
                    
                    
                    
                </form>
   </div>
   

</body>
</html>
