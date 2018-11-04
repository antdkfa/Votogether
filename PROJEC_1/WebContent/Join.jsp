<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
		<title>ȸ������</title>
		<style>
			body {
				background-color: #F7F7F7;
				font-family: '���� ���';
			}
			p {
				text-align: center;
				margin-top: 2%;
			}
			a {
				text-decoration: none;
				color: #3F84F5;
				font: 80% '���� ���';
				margin-top: 2%;
			}
			a:hover {
				color: darkblue;
			}
			#title {
				background-color: #9DC3E6;
				margin: 0%;
				padding: 2%;
				font: 90% bold '���� ���';
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
				font: normal normal '���� ���';
			}
			#join_button {
				background-color: #ED4435;
				border: none;
				color: white;
				padding: 1% 2%;
				font: '���� ���';
			}
			#cancel_button {
				background-color: #3B3838;
				border: none;
				color: white;
				padding: 1% 1.5%;
				font: '���� ���'
			}
			#box_style{
				border:none;
				padding:5%;
				font:bold 80% '���� ���';
				width:90%;
				margin-left:0%;
				margin-bottom:0%;
			}
		</style>
		<script type="text/javascript">
		function checkValue() {
            if(!document.input.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(document.input.idDuplication.value != "idCheck"){
                alert("���̵� �ߺ�üũ�� ���ּ���.");
                return false;
            }
            
            if(!document.input.password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            if(document.input.password.value != document.input.password2.value ){
                alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
                return false;
            }
            
            if(!document.input.name.value){
                alert("�̸��� �Է��ϼ���.");
                return false;
            }
            
            if(document.input.major.value == "00"){
                alert("�кθ� �����ϼ���.");
                return false;
            }
            
            if(!document.input.majorNum.value){
                alert("�й��� �Է��ϼ���.");
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
    		alert("ȸ�������� ����ϼ̽��ϴ�.");
    		location.href="Login_Join.html";
        }
    	</script>
    	<link type="text/css" rel="stylesheet" href="copyright_css.css" />
	</head>
	<body>
		<div style="min-width:1000px;">
			<a href="Login.html" style="margin-left:90%">�α���</a>

       	 <p>
            <a href="Login_Join.html"><img src="Logo.png" style="max-width:35%" /></a>
       	 </p>

       	 <BR><BR><BR>
			<form name="input" action="join" method="post" onSubmit="return checkValue()">
				<div id="contents">
					<h5 id="title">�ʼ��Է� ����</h5>
					<div id="box_style">
						���̵�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" maxlength="20" placeholder="���̵�" required pattern="[a-z0-9]{6,10}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()">    
                        <input type="hidden" name="idDuplication" value="idUncheck"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '���� ���'; color:gray; margin-left:8%;">���� �ҹ���, ���ڸ� ������ 6 ~ 10�ڷ� �Է��ϼ���.</b><BR><BR>
						��й�ȣ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" maxlength="20" placeholder="��й�ȣ" required pattern="[a-z0-9]{8,12}">&nbsp;&nbsp;&nbsp;&nbsp;											
						��й�ȣ ��Ȯ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password2" maxlength="20" placeholder="��й�ȣ ��Ȯ��" required pattern="[a-z0-9]{8,12}"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '���� ���'; color:gray; margin-left:8%;">���� �ҹ���, ���ڸ� ������ 8 ~ 12�ڷ� �Է��ϼ���.</b><BR><BR>
						�̸�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" maxlength="20" placeholder="�̸�" required><BR><BR>
						�к�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SELECT id="major" name="major">
						  <OPTION value="00">�к�</OPTION>
						  <OPTION>�ڿ����к�</OPTION>
						  <OPTION>����ȯ���к�</OPTION>
						  <OPTION>��ǻ���������к�</OPTION>
						  <OPTION>����������ڰ��к�</OPTION>
						  <OPTION>�̵�����������а�</OPTION>
					  	</SELECT><BR><BR>
						�й�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="majorNum" maxlength="20" placeholder="�й�" required pattern="[0-9]{9}"><BR>
						&nbsp;&nbsp;&nbsp;<b style="font:normal 90% '���� ���'; color:gray; margin-left:8%;">�й� 9�ڸ��� ��Ȯ�� �Է��ϼ���.</b><BR><BR>
					</div>
				</div>
				<input type="submit" value="ȸ������" id="join_button" style="margin-left:42%">
    	        <input type="button" value="���" id="cancel_button" onclick="goFirstForm()" style="margin-left:1.5%">
			</form>
		</div>
	</body>
</html>