<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/Admin.css"/>
</head>
<body>
	<%
		String a_id = (String) session.getAttribute("adminID");
		if(a_id==null){
			out.println("<script>alert('관리자가 아닙니다');</script>");
			out.println("<script> location.replace('../Main/Main.jsp'); </script>");
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
        
        
			<div class="adminarea">
			<button class="admin-btn" onclick="javascript:location.href = '#none';"><img id="adminimg" src="../Img/admin.png"> </button>
			<div class="dropdown-menu_nav">
     			<a href="./Admin.jsp">공지 관리</a>
            	<a href="./AdminPost.jsp">게시물 관리</a>
            	<a href="./AdminComment.jsp">댓글 관리</a>
            	<a href="./AdminUsers.jsp">회원 관리</a>
            	<a href="./AdminAdmins.jsp">관리자 관리</a>
            	<a href="./AdminService.jsp">문의내역</a>
            	<a href="../user/Logout.jsp">로그아웃</a>
        	</div>
        	</div>
        	
        	<div class="noticearea">
			<button class="notice-btn" onclick="window.open('../popup/NoticeWrite.jsp','공지사항 등록'
			,'width=820,height=520,left=500,top=100,location=no,status=no,scrollbars=yes');"><img id="noticeimg" src="../Img/notice.png"> </button>

			</div>
			
       </div>
       
 	</div>      
 	 
</header>
<!-- <div class="area_line"></div> -->
</body>
</html>