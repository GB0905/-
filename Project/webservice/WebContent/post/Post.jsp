<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file ="../hedder_footer/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%
		if(a_id != null){
			out.println("<script>alert('관리자 아이디는 사용 불가합니다.');</script>");
 			out.println("<script> location.replace('../Main/Main.jsp'); </script>");
		} else if(s_id == null){
			out.println("<script>alert('로그인 후 사용 가능합니다.');</script>");
 			out.println("<script> location.replace('../Main/Main.jsp'); </script>");
		}
	%>
<meta charset="utf-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<link href="${cp}/css/Post2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="mother">
		<form action="./post_add.jsp" method='post' enctype='multipart/form-data'>
		<div class="recipe">

			<div class="between"></div>
			<div class="regis_tit">레시피 등록</div>

			<!-- regis_tit -->
			<div class="regis-cont1">
				<div class="contImg">
					<input required type="file" accept="image/*" name="_thumbnail_photo" id="thumbnail_photo" style="display: none" onchange="readURL(this);">
					<a href="javascript:upload('thumbnail_photo')"><img id=thumbImg src="${cp}/Img/Camera.png"></a>
<%-- 					<a href="javascript:upload('file1')"><img src="${cp}/Img/Camera.png" id="thumbImg"></a> --%>
				</div>
				<div class="cont_tit1">
					<p class="reci_tit">레시피 제목</p>
					<input required type="text" name="reci_title" class="reci_titBox1" placeholder="예)치즈김밥 만들기">
				</div>
				<div class="cont_tit2">
					<p class="reci_tit1">요리소개</p>
					<input required type="text" name="reci_explain" class="reci_titBox2" placeholder="치즈와 김의 환상조화!">
				</div>
				<div class="cont_tit3">
					<p class="reci_tit2">카테고리</p>
					<div class="reci_cat">
						<select required name="cok_category_1" id="cok_sq_category4"
							style="width: 25%; height: 30px;">
							<option value>분류</option>
							<option value="rice">밥류</option>
							<option value="soup">국물류</option>
							<option value="side">반찬류</option>
							<option value="noodle">면류</option>
							<option value="dessert">디저트류</option>
						</select>
						<select required name="cok_time" id="cok_time">
							<option value>시간</option>
							<option value="10">10분이내</option>
							<option value="20">20분이내</option>
							<option value="30">30분이내</option>
							<option value="40">40분이내</option>
							<option value="50">50분이내</option>
							<option value="60">60분이상</option>
						</select>
						<select required name="cok_degree" id="cod_degree">
							<option value>난이도</option>
							<option value="1">하</option>
							<option value="2">중</option>
							<option value="3">상</option>
						</select>
					</div>
				</div>
			</div>

			<div class="between" style="width: 1200px; height: 20px; background-color: #f1f1f2;"></div>
			<div class="regis_tit2">
				재료<span class="post-meta">Ingredients</span>
			</div>

			<!-- regis_tit -->
			<div class="regis-cont2">
				<div class="material_cont">
					<input type="text" value="재료/양념" class="form-control" readonly>
				</div>
				<div class="materialBox">
					<ul id="divMaterialArea_1" class="ui-sortable">
						<li id="liMaterial_1_1">
							<input required type="text" name="_metaname" class="form_control1" placeholder="예) 돼지고기">
							<input required type="text" name="_metaamount" class="form_control2" placeholder="예) 300g">
						</li>
						<li id="liMaterial_1_2">
							<input required type="text" name="_metaname" class="form_control1" placeholder="예) 양배추">
							<input required type="text" name="_metaamount" class="form_control2" placeholder="예) 1/2개">
							<button type="button" onclick="javascript:remove_div(this)" class="btn-default">X</button>
						</li>
						<li id="liMaterial_1_3">
							<input required type="text" name="_metaname" class="form_control1" placeholder="예) 참기름">
							<input required type="text" name="_metaamount" class="form_control2" placeholder="예) 1T">
							<button type="button" onclick="javascript:remove_div(this)" class="btn-default">X</button>
							<div id="liMaterial_1_4a"></div>
						</li>
					</ul>
					<div class="btn-add">
						<button type="button" onclick="javascript:createDIV()" class="btn-default">추가</button>
					</div>
				</div>
			</div>


			<!-- regis-cont2 -->
			<div class="between"
				style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>
			<div class="regis_tit3">
				조리순서<span class="post-meta">Steps</span>
			</div>

			<!-- regis_tit -->
			<div class="regis-cont3">
				<div class="guide">
					<span class="guide-tit" style="font-size: 18px;"><b>조리시
							맛이 좌우 될 수 있는 부분을 자세히 적어주세요.</b><br> 본인만의 요리 tip을 적어주시면 도움이 됩니다.<br>
					</span>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">○Step1</span></div>
					<div class="step_ex">
						<textarea name="explains" class="ex-write" placeholder="치즈와 김의 환상조화"></textarea>
					</div>
					<div class="step_pic">
						<input required type="file" accept="image/*" name="_step_photo01" id="step_photo" class="step_photo" style="width: 100%">
					</div>
					<div class="btn_del">
						<button type="button" onclick="javascript:remove_div2(this)" id="calcel2" class="del" style="vertical-align: unset;width: 50%;height: 30%;">X</button>
					</div>
				</div>
				<div id="step2step"></div>
				<div class="sbtn-add">
				<button type="button" onclick="javascript:createDIV2()" class="sbtn-addd">추가</button>
				</div>
			</div>
			
			<div class="between"
				style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>

			<div class="regis-cont4">
			<div class="store" style="float: left; width: 49%; text-align:right; height:45px;">
			<input type="submit" class="btn-store" style="height:45px; width:35% " value="등록">
			</div>
			<div class="cancel" style="float: left; width: 49%; height:45px;">
			<button type="button" onclick="" class="btn-can" style="height:45px; width:35%; margin-left:5px;">취소</button>
			</div>
			</div>
			<div class="between" style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>
		</div>
		</form>
	</div>
	<%@ include file ="../hedder_footer/footer.jsp" %>
<%@ include file ="../hedder_footer/footer2.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	let cp = "${pageContext.request.contextPath}";
</script>
<script>
	//$(제이쿼리선택자).change(함수) : 해당 선택자의 요소가 변화가 일어난다면 넘겨주는 함수 호출
// 	$("[type='file']").change(function(e) {
// 		//e : 파일이 업로드된 상황 자체를 담고있는 객체
// 		//e.target : 업로드를 한 input[type='file'] 객체(태그객체)
// 		//e.target.files : 파일태그에 업로드를 한 파일 객체들의 배열
// 		//e.target.files[0] : 업로드가 된 파일객체
// 		let file = e.target.files[0];
// 		console.log(e.target.files)
		
// 		//$("#file1name")
// 		if(e.target.name == 'file1') {
// 			if (file == undefined) {
// 				$("#thumbImg").attr({
// 					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
// 				});
	
// 			}
	
// 			let ext = file.name.split(".").pop();
// 			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
// 				let reader = new FileReader();
	
// 				reader.onload = function(ie) {
// 					$("#thumbImg").attr({
// 						src : cp+"/Img/" + file.name
// 					});
// 					/* let img = document.createElement('img');//<img>
// 					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
// 					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
// 					//".file1_cont"
// 					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
// 				}
	
// 				reader.readAsDataURL(file);
// 			}
// 		} else if(e.target.name == 'file2') {
// 			if (file == undefined) {
// 				$("#thumbImg2").attr({
// 					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
// 				});
	
// 			}
	
// 			let ext = file.name.split(".").pop();
// 			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
// 				let reader = new FileReader();
	
// 				reader.onload = function(ie) {
// 					$("#thumbImg2").attr({
// 						src : cp+"/Img/" + file.name
// 					});
// 					/* let img = document.createElement('img');//<img>
// 					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
// 					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
// 					//".file1_cont"
// 					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
// 				}
	
// 				reader.readAsDataURL(file);
// 			}
			
// 		}

// 	})

	function upload(name) {
		//$("#file1")
		$("#" + name).click();
	}

	function createDIV() {
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('liMaterial_1_2').innerHTML;
		div.setAttribute("id", "liMaterial_1_4");
		document.getElementById('liMaterial_1_4a').appendChild(div);
	}

	function remove_div(obj) {
		console.log(obj.parentNode);
		document.getElementById('liMaterial_1_4a').removeChild(obj.parentNode);
	}
	
	var count = 1;
	function createDIV2() {
		if(count==15){
			alert("조리과정은 최대 15개입니다.");
			return false;
		}
		count++;
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('stepcont').innerHTML;
		div.querySelector(".step_num_count").innerHTML = "○Step" + count;
		if(count<10){
			div.querySelector(".step_photo").setAttribute("name", "_step_photo0"+count);
		}
		else{
			div.querySelector(".step_photo").setAttribute("name", "_step_photo"+count);
		}
		div.setAttribute("id", "Step"+count);
		var createMainDivStyle = "height: 200px; margin-left: 40px; margin-right: 40px; margin-top: 10px; margin-bottom: 10px; overflow:hidden;";
		div.setAttribute("style", createMainDivStyle);
		document.getElementById('step2step').appendChild(div);
		
		
		/* var prevImg = document.getElementById("prev_" + View_area); */
	}

	function remove_div2(obj) {
		if(count==1){
			alert("조리과정은 최소 1개 이상입니다.");
			return false;
		}
		count--;
		document.getElementById('step2step').removeChild(obj.parentNode.parentNode);
	}
	
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('thumbImg').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('thumbImg').src = "${cp}/Img/Camera.png";
		  }
		}
	
	
</script>
</html>