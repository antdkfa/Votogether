<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>top</title>
    <style>
        html, body{margin:0; padding:0; height:100%;}
        .header {width: 100%;}
        .table{
            margin : 5%;
            width : 500px;
            height : 300px;
            border : 1px solid;
        }
        #top{
    		width:100%;
    		height:70px;   
    		background:#ccc;
    		text-align: center;
        }
        #fixed{
            position : fixed;
            top : 10px;
            right : 10px;
            color : black;
        }
       #menu{
           list-style : none;
           text-align: center;
           border-top : 1px solid red; border-bottom : 1px solid red; padding : 10px 0;
       }
       #menu li{
           display : inline;
           padding : 0 20px; 
       }
       #menu li a {
           text-decoration: none; color: black;
       }
        #menu li a:hover {
            text-decoration: underline;
            
        }
        
        #blogMenu ul li:hover ul{
        	display: block;
        	width: 100%;
        	padding : 20px 0 0 0;
        	
        	text-align : center;
        	
        	
        }
        #blogMenu ul ul{
        	display: none;
        	position: absolute;
        }
        #menubar {
		background-color: ivory;
		border: none;
		color: black;
		box-shadow: 2px 2px 5px #808080;
		padding: 1% 2%;
		font: '���� ���';
		}
        
    </style>
</head>
<body>

 <div id="fixed" class="top">
        <a class="logout" href="logout">�α׾ƿ�</a>
    </div>
    
    <header class="header">
            <center>
            <a href="voting"><img src="Logo.png" alt="Votogether" /></a>
            </center>
    <div id="blogMenu">
    <ul id="menu">
        <li style="background-color : ivory">
        	���� �Խ���
        	<ul>
        		<form action="promise" method="post">
        			<li><input type="submit" value="�ڿ����к�" id="menubar" name="major"></li>
        			<li><input type="submit" value="����ȯ���к�" id="menubar"  name="major"></li>
        			<li><input type="submit" value="��ǻ���������к�" id="menubar"  name="major"></li>
        			<li><input type="submit" value="����������ڰ��к�" id="menubar"  name="major"></li>
        			<li><input type="submit" value="�̵�����������а�" id="menubar"  name="major"></li>
        		</form>
        	</ul>
        </li>
        
        <li><a href="boardList.jsp" style="background-color : ivory;">���� �Խ���</a>
        
        </li>
        
        <li><a href="FreeBoard.jsp" style="background-color : ivory;">�ĺ��� ���� �Խ���</a></li>
        
        <li style="background-color : ivory"><a href="voting">���� �������� ��ǥ</a>
        </li> 
    </ul>
    </div>
    
    </header>

</body>
</html>