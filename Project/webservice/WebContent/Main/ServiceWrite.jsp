<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
<title>공지사항 등록</title>
	<link rel="stylesheet" type="text/css" href="css/ServiceWrite.css" />
</head>
<body>

<div id="top_line"></div>
 <div id="notice_write">
        
            <div id="write_area">
            <h3>공지사항 등록</h3>
                <form method="post" enctype="multipart/form-data" >
                    <div id="no_title">
                        <textarea name="title" id="ntitle" rows="1" cols="55" placeholder="제목" maxlength="100" required></textarea>
                    </div>
 
                    <div id="no_content">
                        <textarea name="content" id="ncontent" placeholder="내용" required></textarea>
                    </div>
                    
                    <div id="bottom_line"></div>
                    
 					<div class="input_area">
                        <input type="file" name="Select_File" />
                    </div>
 
                    <div class="write_area">
                        <button id="write_btn" type="submit">문의하기</button>
                    </div>
                </form>
            </div>
        </div>

</body>
</html>