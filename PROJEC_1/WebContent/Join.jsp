<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
		<title>회원가입</title>
		<style>
			body {
				background-color: #F7F7F7;
				font-family: '맑은 고딕';
			}
			p {
				text-align: center;
				margin-top: 2%;
			}
			a {
				text-decoration: none;
				color: #3F84F5;
				font: 80% '맑은 고딕';
				margin-top: 2%;
			}
			a:hover {
				color: darkblue;
			}
			#title {
				background-color: #9DC3E6;
				margin: 0%;
				padding: 2%;
				font: 90% bold '맑은 고딕';
				border-bottom: 1px solid gray;
			}
			#contents {
				background-color: white;
				margin-left: 15%;
				margin-bottom: 5%;
				width: 70%;
				border: 1px solid gray;
			}
			#button {
				background-color: #3F84F5;
				border: none;
				color: white;
				padding: 1% 1.5%;
				font: normal normal '맑은 고딕';
			}
			#join_button {
				background-color: #ED4435;
				border: none;
				color: white;
				padding: 1% 2%;
				font: '맑은 고딕';
			}
			#cancel_button {
				background-color: #3B3838;
				border: none;
				color: white;
				padding: 1% 1.5%;
				font: '맑은 고딕'
			}
			#box_style{
				border:none;
				padding:5%;
				font:bold 80% '맑은 고딕';
				width:90%;
				margin-left:0%;
				margin-bottom:0%;
			}
		</style>
		<script type="text/javascript">
		function checkValue() {
            if(!document.input.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(document.input.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            
            if(!document.input.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            if(document.input.password.value != document.input.password2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }
            
            if(!document.input.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            if(document.input.major.value == "00"){
                alert("학부를 선택하세요.");
                return false;
            }
            
            if(!document.input.majorNum.value){
                alert("학번을 입력하세요.");
                return false;
            }
        }
    	function openIdChk(){
            window.name = "parentForm";
            window.open("IdCheck.jsp",
                    "chkForm", "width=500, height=200, resizable = no, scrollbars = no");
        }
    	function inputIdChk() {
            document.input.idDuplication.value ="idUncheck";
        }
    	function goFirstForm() {
    		alert("회원가입을 취소하셨습니다.");
    		location.href="Login_Join.html";
        }
    	</script>
    	<link type="text/css" rel="stylesheet" href="copyright_css.css" />
	</head>
	<body>
		<div style="min-width:1000px;">
			<a href="Login.html" style="margin-left:90%">로그인</a>

       	 <p>
            <a href="Login_Join.html"><img src="Logo.png" style="max-width:35%" /></a>
       	 </p>

       	 <BR><BR><BR>
			<form name="input" action="join" method="post" onSubmit="return checkValue()">
				<div id="contents">
					<h5 id="title">필수입력 사항</h5>
					<div id="box_style">
						아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" maxlength="20" placeholder="아이디" required pattern="[a-z0-9]{6,10}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="중복확인" onclick="openIdChk()">    
                        <input type="hidden" name="idDuplication" value="idUncheck"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '맑은 고딕'; color:gray; margin-left:8%;">영문 소문자, 숫자를 포함해 6 ~ 10자로 입력하세요.</b><BR><BR>
						비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="20" placeholder="비밀번호" required pattern="[a-z0-9]{8,12}">&nbsp;&nbsp;&nbsp;&nbsp;											
						비밀번호 재확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password2" maxlength="20" placeholder="비밀번호 재확인" required pattern="[a-z0-9]{8,12}"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '맑은 고딕'; color:gray; margin-left:8%;">영문 소문자, 숫자를 포함해 8 ~ 12자로 입력하세요.</b><BR><BR>
						이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" maxlength="20" placeholder="이름" required><BR><BR>
						학부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SELECT id="major" name="major">
						  <OPTION value="00">학부</OPTION>
						  <OPTION>자연과학부</OPTION>
						  <OPTION>생명환경학부</OPTION>
						  <OPTION>컴퓨터정보공학부</OPTION>
						  <OPTION>정보통신전자공학부</OPTION>
						  <OPTION>미디어기술콘텐츠학과</OPTION>
					  	</SELECT><BR><BR>
						학번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="majorNum" maxlength="20" placeholder="학번" required pattern="[0-9]{9}"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '맑은 고딕'; color:gray; margin-left:8%;">학번 9자리를 정확히 입력하세요.</b><BR><BR>
					</div>
				</div>
				<input type="submit" value="회원가입" id="join_button" style="margin-left:42%">
    	        <input type="button" value="취소" id="cancel_button" onclick="goFirstForm()" style="margin-left:1.5%">
			</form>
		</div>
	</body>
</html>