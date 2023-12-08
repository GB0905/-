<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>문의하기</title>
	<link rel="stylesheet" type="text/css" href="../css/ServiceWrite.css" />
</head>
<body>
<script type="text/javascript">
function delete_ask(){
	if(confirm("문의하시겠습니까?")){
		button.onclick();
		return true;
	}
	else{
		alert("취소하셨습니다.");
		return true;
	}
}
	
</script>
<%
		String a_id = (String) session.getAttribute("adminID");
		String s_id = (String) session.getAttribute("sessionID");
		if(a_id != null){
			out.println("<script>alert('관리자 아이디는 사용 불가합니다.');</script>");
 			out.println("<script> window.close(); </script>");
		} else if(s_id == null){
			out.println("<script>alert('로그인 후 사용 가능합니다.');</script>");
 			out.println("<script> window.close(); </script>");
		}
	%>

<div id="top_line"></div>
 <div id="service_write">
        
            <div id="Toparea">
            <h2>1:1 문의</h2>
            </div>
            
                <form action="./Service_Submit.jsp"method="post" >
                
                    <div id="service_title">
                    	<p>제목</p>
                    	<input type="text" name="_title" id="stitle" maxlength = "50" required >
                    </div>
 
                    <div id="service_content">
                    	<P>내용</p>
                        <textarea name="_content" id="scontent" required></textarea>
                    </div>
                    
                    <div id="bottom_line"></div>
                    
                    <div class="Bottomarea">
                        	<button id="write_btn" type="submit" onClick="delete_ask(); return false;">SUBMIT</button>
                   		

                    	
                    </div>
                </form>
            </div>

</body>
</html>