<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>혼밥! 뚝딱</title>
<link rel="stylesheet" type="text/css" href="../css/header_footer.css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String search = request.getParameter("_search");
	String s_id = (String) session.getAttribute("sessionID");
	String a_id = (String) session.getAttribute("adminID");
	String hidden="hidden";
	String hover="dropdown-menu_nav";
	String login="hidden";
	String login_id="";
	String login_btn="";
	String cursor="pointer";
	if(s_id == null && a_id == null)
		hover="dropdown-menu_nav2";
	else{
		cursor="default";
		login_btn="disabled";
		login="visible";
	}
	if(a_id != null){
		hidden = "visible";
		login_id=a_id;
	}
	if(s_id != null){
		login_id=s_id;
	}
%>
 <header>

   <div class="TopArea">
   
        <div class = "TopArea_left">
             <img id="logoimg" onclick="javascript:location.href = '../Main/Main.jsp';" style="cursor:pointer;" src="../Img/logo.png" >
        </div>

        
        <div class="TopArea_center">
        	<form action="../Main/list.jsp" method="get" id= search-form>
            <div class = "search_area">
                <input name="_search" id ="search" type="text" maxlength="225" placeholder="요리 제목을 입력하세요">
        		<button id ="searchbtn" style="cursor:pointer;" ><img id="searchimg" src="../Img/search.png"></button>
			</div>
			</form>	
        </div>
        
        <div class="TopArea_right">
        	<div class="menu">
			<ul>
				<li><a class="menulink"  href="../admin/Admin.jsp" style="visibility: <%=hidden%>;">관리자 페이지</a></li>
				<li><label style="visibility: <%=login%>; font-family: fantasy;"><%=login_id%>님 환영합니다.</label></li>
			</ul>
			</div>
			<div class="loginarea">
			<button class="login-btn" style="cursor:<%=cursor%>"onclick="javascript:location.href = '../user/Login.jsp';" <%=login_btn %>><img id="loginimg" src="../Img/login.png"> </button>
		
			<div class="<%=hover%>">
            <a href="../mypage/mypage.jsp" >MyPage</a>
            <a href="../user/Logout.jsp">로그아웃</a>
        </div>
			</div>
			<img id="writeimg" onclick="javascript:location.href = '../post/Post.jsp';" style="cursor:pointer;" src="../Img/write.png" >
        </div>
        
   </div>
   
</header>
<body>

</body>
</html>