<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<title>Insert title here</title>
<%// css 파일 읽기를 위한 link%>
<link rel="stylesheet" href="../css/div_type.css?after">
<%@ include file ="../hedder_footer/header.jsp" %>
</head>
<body>

<div class='sdh_div_body'>
	<div class='sdh_body_Background'>
		<div class = 'sdh_Category_Background'>
			<div class='sdh_Category'>
				<ul>
					<li><a id="rice" class="Linked" href="./list.jsp?_cat=rice" >밥류</a></li>
					<li><a id="soup" class="Linked" href="./list.jsp?_cat=soup" >국물류</a></li>
					<li><a id="noodle" class="Linked" href="./list.jsp?_cat=noodle" >면류</a></li>
					<li><a id="side_dish" class="Linked" href="./list.jsp?_cat=side" >반찬</a></li>
					<li><a id="dessert" class="Linked" href="./list.jsp?_cat=dessert" >간식</a></li>
				</ul>
			</div>
		</div>
		<% 
		request.setCharacterEncoding("utf-8");
		String cat = request.getParameter("_cat");
		try {
			Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
			Statement stmt = conn.createStatement();
			ResultSet rs;
			if(search==null && cat==null)
				rs = stmt.executeQuery("select * from server.post where post_state="+1+" order by post_code desc");
			else if(search==null && cat != null)
				rs = stmt.executeQuery("select * from server.post where post_state="+1+" and post_cookcat='"+cat+"' order by post_code desc");
			else if(cat==null && search != null)
				rs = stmt.executeQuery("select * from server.post where post_state="+1+" and post_title like '%"+search+"%' order by post_code desc");
			else
				rs = stmt.executeQuery("select * from server.post where post_state="+1+" and post_title like '%"+search+"%' and post_cookcat='"+cat+"' order by post_code desc");
			int i = 0;
			while(rs.next()){
				i++;
			}
		rs.beforeFirst();
		int total = i;
			
		%>
		<div class = 'sdh_list_Box'>
			<div class = 'sdh_list_Total_Number'>총 게시물 : <%=total %> 개</div>
			<div class='sdh_Recipe_Background' style = "height:300px;">	
				<div class='sdh_Box_Title'>검색 결과</div>
				<div class='sdh_Recipe_Box_Wrapper'>
					<table class='sdh_Recipe_Table' id="RecipeList">
						<form action="" id="setRows">
							<input type="hidden" name="rowPerPage" value="2">
						</form>
<%/*
i = <tr>. 테이블 열을 나타냄.
j = <td>. 테이블 행을 나타냄.

var TotalRow = 총게시물 / 4
TotalRow = Math.ceil(TotalRow)
Math.ceil은 올림값을 구함.
위 연산으로 총 열 구할 수 있을겁니다.

j for문 안쪽에 query문으로 내용 넣어주면 될것같습니다~
*/%>
						<%for(i=0;i<((total/4)+1);++i)
							{%>
						<tr>
						<%for(int j=0;j<4;++j)
							{
							if(!rs.next()) 
								break;
							int post_code = rs.getInt("post_code");
							String title = rs.getString("post_title");
							String u_id = rs.getString("u_nick");
							int view = rs.getInt("views");
							String thumbnail = rs.getString("thumbnail"); %>
						<td>
<%

	%>
							<div class = 'sdh_Recipe_Box'>
								<div class ='sdh_Recipe_Box_Img'><a href = "../post/PostBoard.jsp?post_code=<%=post_code%>"><img class="thumbnail" src="${cp}/example/files/<%=thumbnail%>"></a></div>
								<div class ='sdh_Recipe_Box_Title'><a href = ""><%=title %></a></div>
								<div class ='sdh_Recipe_Box_Author'><%=u_id %></div>
								<div class ='sdh_Recipe_Box_View'>조희수 : <%=view %></div>
							</div>
						</td>
						<%} %>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>
		<% 
		rs.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
	</div>
</div>

<!-- Script -->
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<script src="./list_paging.js"></script>
<%@include file="../hedder_footer/footer.jsp" %>
<%@include file="../hedder_footer/footer2.jsp" %>
</body>
</html>