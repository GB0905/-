<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<link href="${cp}/css/Post2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="mother">
	<form action="Main.jsp" name="PostName" method="get">
		<div class="recipe">

			<div class="between"></div>
			<div class="regis_tit">������ ���</div>

			<!-- regis_tit -->
			<div class="regis-cont1">
				<div class="contImg">
					<input type="file" name="file1" id="file1" style="display: none">
					<a href="javascript:upload('file1')"><img src="${cp}/Img/Camera.png" id="thumbImg"></a>
				</div>
				<div class="cont_tit1">
					<p class="reci_tit">������ ����</p>
					<input type="text" class="reci_titBox1" name="reci_titBox1" placeholder="��)ġ���� �����">
				</div>
				<div class="cont_tit2">
					<p class="reci_tit1">�丮�Ұ�</p>
					<textarea class="reci_titBox2" name="reci_titBox2" placeholder="ġ��� ���� ȯ����ȭ!"></textarea>
				</div>
				<div class="cont_tit3">
					<p class="reci_tit2">ī�װ�</p>
					<div class="reci_cat">
						<select name="cok_category_1" id="cok_sq_category4"
							style="width: 25%; height: 30px;">
							<option value>�з�</option>
							<option value="rice">���</option>
							<option value="soup">������</option>
							<option value="side">������</option>
							<option value="noodle">���</option>
							<option value="dessert">����Ʈ��</option>
						</select>
						<select name="cok_time" id="cok_time">
							<option value>�ð�</option>
							<option value="10">10���̳�</option>
							<option value="20">20���̳�</option>
							<option value="30">30���̳�</option>
							<option value="40">40���̳�</option>
							<option value="50">50���̳�</option>
							<option value="999">60���̻�</option>
						</select>
						<select name="cok_degree" id="cod_degree">
							<option value>���̵�</option>
							<option value="1">��</option>
							<option value="2">��</option>
							<option value="3">��</option>
						</select>
					</div>
				</div>
			</div>

			<div class="between" style="width: 1200px; height: 20px; background-color: #f1f1f2;"></div>
			<div class="regis_tit2">
				���<span class="post-meta">Ingredients</span>
			</div>

			<!-- regis_tit -->
			<div class="regis-cont2">
				<div class="material_cont">
					<input type="text" value="���/���" class="form-control" readonly>
				</div>
				<div class="materialBox">
					<ul id="divMaterialArea_1" class="ui-sortable">
						<li id="liMaterial_1_1">
							<input type="text" class="form_control1" name="form_control1" placeholder="��) ��">
							<input type="text" class="form_control2" name="form_control2" placeholder="��) 1-2�κ�">
						</li>
						<li id="liMaterial_1_2">
							<input type="text" class="form_control1" name="form_control1" placeholder="��) ��">
							<input type="text" class="form_control2" name="form_control2" placeholder="��) 2-3��">
							<button type="button" onclick="javascript:remove_div(this)" class="btn-default">X</button>
						</li>
						<li id="liMaterial_1_3">
							<input type="text" class="form_control1" name="form_control1" placeholder="��) ġ��">
							<input type="text" class="form_control2" name="form_control2" placeholder="��) 2-3��">
							<button type="button" onclick="javascript:remove_div(this)" class="btn-default">X</button>
							<div id="liMaterial_1_4a"></div>
						</li>
					</ul>
					<div class="btn-add">
						<button type="button" onclick="javascript:createDIV()" class="btn-default">�߰�</button>
					</div>
				</div>
			</div>


			<!-- regis-cont2 -->
			<div class="between"
				style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>
			<div class="regis_tit3">
				��������<span class="post-meta">Steps</span>
			</div>

			<!-- regis_tit -->
			<div class="regis-cont3">
				<div class="guide">
					<span class="guide-tit" style="font-size: 18px;"><b>������
							���� �¿� �� �� �ִ� �κ��� �ڼ��� �����ּ���.</b><br> ���θ��� �丮 tip�� �����ֽø� ������ �˴ϴ�.<br>
					</span>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">��Step1</span></div>
					<div class="step_ex">
						<textarea class="ex-write" name="ex-write" placeholder="�� 1-2�κ� ���� �غ����ݴϴ�."></textarea>
					</div>
					<div class="step_pic">
						<input type="file" name="file2" id="file2" style="display: none">
						<a href="javascript:upload('file2')"><img src="${cp}/Img/adbtn.png" id="thumbImg2" style="width: 100%; height: 100%;"></a>
					</div>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">��Step2</span></div>
					<div class="step_ex">
						<textarea class="ex-write" name="ex-write" placeholder="�ܹ���,���,����� ���ʷ� �غ����ݴϴ�."></textarea>
					</div>
					<div class="step_pic">
						<input type="file" name="file3" id="file3" style="display: none">
						<a href="javascript:upload('file3')"><img src="${cp}/Img/adbtn.png" id="thumbImg3" style="width: 100%; height: 100%;"></a>
					</div>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">��Step3</span></div>
					<div class="step_ex">
						<textarea class="ex-write" name="ex-write" placeholder="���ⲯ ��� �ӿ� �� ��Ḧ �� �غ����ݴϴ�."></textarea>
					</div>
					<div class="step_pic">
						<input type="file" name="file4" id="file4" style="display: none">
						<a href="javascript:upload('file4')"><img src="${cp}/Img/adbtn.png" id="thumbImg4" style="width: 100%; height: 100%;"></a>
					</div>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">��Step4</span></div>
					<div class="step_ex">
						<textarea class="ex-write" name="ex-write" placeholder="���� ���� ��� �� ���� �� ���ָ��� �÷� ���� �� ������ �ڸ� ġ�� ������ �÷��ݴϴ�."></textarea>
					</div>
					<div class="step_pic">
						<input type="file" name="file5" id="file5" style="display: none">
						<a href="javascript:upload('file5')"><img src="${cp}/Img/adbtn.png" id="thumbImg5" style="width: 100%; height: 100%;"></a>
					</div>
				</div>
				<div class="stepCont" id="stepcont">
					<div class="stepNum" id="stepNum">   
						<span class="step_num_count">��Step5</span></div>
					<div class="step_ex">
						<textarea class="ex-write" name="ex-write" placeholder="ġ�� ���� �غ��� ������ �ϳ��� �ø��� �� �����ָ� ��!!"></textarea>
					</div>
					<div class="step_pic">
						<input type="file" name="file6" id="file6" style="display: none">
						<a href="javascript:upload('file6')"><img src="${cp}/Img/adbtn.png" id="thumbImg6" style="width: 100%; height: 100%;"></a>
					</div>
				</div>
			</div>
			
			<div class="between"
				style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>

			<div class="regis-cont4">
			<div class="store" style="float: left; width: 49%; text-align:right; height:45px;">
			<input type="submit" onclick="" class="btn-store" style="height:45px; width:35% " value="���">
			</div>
			<div class="cancel" style="float: left; width: 49%; height:45px;">
			<button type="button" onclick="" class="btn-can" style="height:45px; width:35%; margin-left:5px;">���</button>
			</div>
			</div>
			<div class="between" style="width: 1200px; height: 20px; background-color: #f1f1f2;">
			</div>
		</div>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script>
	let cp = "${pageContext.request.contextPath}";
</script>
<script>
	//$(��������������).change(�Լ�) : �ش� �������� ��Ұ� ��ȭ�� �Ͼ�ٸ� �Ѱ��ִ� �Լ� ȣ��
	$("[type='file']").change(function(e) {
		//e : ������ ���ε�� ��Ȳ ��ü�� ����ִ� ��ü
		//e.target : ���ε带 �� input[type='file'] ��ü(�±װ�ü)
		//e.target.files : �����±׿� ���ε带 �� ���� ��ü���� �迭
		//e.target.files[0] : ���ε尡 �� ���ϰ�ü
		let file = e.target.files[0];
		console.log(e.target.files)
		
		//$("#file1name")
		if(e.target.name == 'file1') {
			if (file == undefined) {
				$("#thumbImg").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
		}
		else if(e.target.name == 'file2') {
			if (file == undefined) {
				$("#thumbImg2").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg2").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
			
		}
		else if(e.target.name == 'file3') {
			if (file == undefined) {
				$("#thumbImg3").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg3").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
			
		}
		else if(e.target.name == 'file4') {
			if (file == undefined) {
				$("#thumbImg4").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg4").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
			
		}
		else if(e.target.name == 'file5') {
			if (file == undefined) {
				$("#thumbImg5").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg5").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
			
		}
		else if(e.target.name == 'file6') {
			if (file == undefined) {
				$("#thumbImg6").attr({
					src : "https://cdn-icons-png.flaticon.com/512/3178/3178189.png"
				});
	
			}
	
			let ext = file.name.split(".").pop();
			if (ext == 'jpeg' || ext == 'jpg' || ext == 'png' || ext == 'gif') {
				let reader = new FileReader();
	
				reader.onload = function(ie) {
					$("#thumbImg6").attr({
						src : cp+"/Img/" + file.name
					});
					/* let img = document.createElement('img');//<img>
					img.setAttribute('src',ie.target.result)//<img src="???/apple.png">
					img.setAttribute('class','thumbnail');//<img src="???/apple.png" class="thumbnail">
					//".file1_cont"
					document.querySelector("."+e.target.id+"_cont").appendChild(img); */
				}
	
				reader.readAsDataURL(file);
			}
			
		}

	})

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
</script>
</html>