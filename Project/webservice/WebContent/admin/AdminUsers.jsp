<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
	<%@ include file ="./Admin_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>관리자 페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/Admin.css"/>
	<link rel="stylesheet" href="../css/div_type.css?after">
</head>
<body>

<script type="text/javascript">
function delete_ask(){
	if(confirm("아이디를 삭제하시겠습니까?")){
		button.onclick();
		return true;
	}
	else{
		alert("취소하셨습니다.");
		return true;
	}
}
function advan_ask(){
	if(confirm("회원을 관리자로 승급시키겠습니까?")){
		button.onclick();
		return true;
	}
	else{
		alert("취소하셨습니다.");
		return true;
	}
}
	
</script>

<article>

	<div class="area_line"></div>

	<div class="main">
	<div class="area_line"></div>
	<p>회원 관리</p>
	 <div id="searchtable-area">
		<form action="./AdminUsers.jsp" method="post" id="searchtalbe-form">
			<input name="_searchWord"id ="searchtable" type="text" maxlength="100" placeholder="회원 닉네임을 검색하세요"  />
			<button id="searchtablebtn">검색</button>
		</form>
	</div>
	
    <table class="admintb">
        
        <tr>
            <th width=10%>회원번호</th>
            <th width=30%>아이디(이메일)</th>
            <th width=20%>회원이름</th>
            <th width=20%>닉네임</th>
            <th width=10%>권한</th>
            <th width=10%>관리</th>
        </tr>
        </table>
      <table class="admintb" id ="RecipeList">
      <form aciton="" id="setRows">
				<input type="hidden" name="rowPerPage" value="7">
			</form>
        
        <%
        String s_word = request.getParameter("_searchWord");
        try{
        	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
    		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
    		Statement stmt = conn.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from server.user");
    		if(s_word==null){rs = stmt.executeQuery(
					"select * from server.user");
					} else{rs = stmt.executeQuery(
					"select * from server.user where u_nick like '%"+s_word+"%'");
					}
    		int total = 0;
    		while(rs.next()){
    			total++;
    		}
    		rs.beforeFirst();
    		int num = 1;
    		for(int i=0; i<total; i++){
    			rs.next();
    			String email = rs.getString("u_id");
    			String password = rs.getString("u_pw");
    			String nick = rs.getString("u_nick");
    			String name = rs.getString("u_name");
    			String birth = rs.getString("birth");
    			String gender = rs.getString("gender");
    			String phone = rs.getString("phone");
    		
        %><tr>
            <td width=10%><%=num %></td>
            <td width=30%><%=email %></td>
            <td width=20%><%=name %></td>
            <td width=20%><%=nick %></td>
            <td width=10%><form action="userAdvan.jsp" method="post">
            <input type="hidden" name="email" value="<%=email%>"> <input type="hidden" name="password" value="<%=password%>"> 
            <input type="hidden" name="nick" value="<%=nick%>"> <input type="hidden" name="name" value="<%=name%>">
            <input type="hidden" name="birth" value="<%=birth%>"> <input type="hidden" name="gender" value="<%=gender%>"> 
            <input type="hidden" name="phone" value="<%=phone%>">
            <button class="advanbtn" onClick="advan_ask(); return false;">승급</button></form></td>
            <td width=10%><a href="userDelete.jsp?email=<%=email%>"><button class="deletebtn" onClick="delete_ask(); return false;">삭제</button></a></td>
            <!--삭제 누르면 DB삭제, 테이블 행 삭제, 정말 삭제할거냐고 묻기-->
        </tr>
        <%num++;}
    		rs.close();
    		stmt.close();
    		conn.close();
        } catch(Exception e){
        	e.printStackTrace();
        }
        %>
           
    </table>
    
   <div class="area_line"></div>
	
	</div>
	
	<div class="area_line"></div>
	
</article>
<%@ include file ="./Admin_footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="./list_paging.js"></script>

</body>
</html>