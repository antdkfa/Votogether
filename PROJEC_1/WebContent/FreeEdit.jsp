<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="bbsItem" class="web.BBSItem"/>
<jsp:setProperty property="seqNo" name="bbsItem" value="${param.SEQ_NO}"/>
<% bbsItem.readDB(); %>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style>
        p {
            text-align: center;
        }

       
        .mypage_logout {
            color: white;
            font: normal 90% 'Century Gothic';
            text-decoration: none;
            padding: 1%;
        }

            .mypage_logout:hover {
                font-weight: bold;
            }

        h3 {
            text-align: left;
            font: bold 135% '나눔고딕';
            color: #111c46;
            margin-bottom: 0;
            padding: 1%;
            margin-left: 15%;
        }

        #nav {
            margin-left: 30px;
            margin-right: 30px;
        }

            #nav > tbody > tr > th {
                background-color: rgba(66, 133, 244, 1.0);
                font: 500 20px '주아';
                color: white;
                box-shadow: 0 0 5px grey;
                padding: 7px 0;
            }

            #nav > tbody > tr > td {
                background-color: white;
                cursor: pointer;
                text-align: left;
                padding-left: 10px;
                box-shadow: 0 0 5px grey;
                font: normal 15px '주아';
                border-top: 5px white;
                padding-top: 7px;
                padding-bottom: 7px;
            }

                #nav > tbody > tr > td:hover {
                    background-color: rgba(66, 133, 244, 1.0);
                    color: white;
                    transition-property: background-color,color;
                    transition-duration: 0.5s;
                }

        h2 {
            font: normal 100% '나눔고딕';
            color: black;
            padding: 0%;
        }

        .button {
            background-color: rgba(66, 133, 244, 1.0);
            color: white;
            border: none;
            padding: 0.5% 1%;
            font: normal 90% '맑은 고딕';
            text-decoration: none;
            float: right;
            margin-right: 1%;
        }

            .button:hover {
                opacity: 0.7;
            }
    </style>
    <link type="text/css" rel="stylesheet" href="copyright_css.css" />
    <link type="text/css" rel="stylesheet" href="nav_css.css" />
    <meta charset="utf-8" />

    <title>게시글 수정</title>
</head>
<body>
    <div style="min-width:1200px">
        <div class="top">
            <a class="mypage_logout" href="logout" style="float:right; color:blue; margin-right:2%; padding:0.2%;">로그아웃</a>
        </div>
        <p>
          <a href="voting"> <img src="Logo.png" style="max-width:25%" /></a>
        </p>
        <h3>게시글 수정</h3>
        <hr style="color:darkblue;width:70%;" />
        <table id="nav" cellspacing="7" style="margin-top:30px;float:left">
            <tr>
                <th width="130px">메  뉴</th>
            </tr>
            <tr>
                <td onclick="location.href = 'bbs-list'">게시글</td>
            </tr>
        </table>
        <div style="padding:3%;float:left">
            <form action="FreeEditPro.jsp" method="post">
				<b style="font:normal 80% '맑은 고딕'; margin-left:5%;color:gray"></b><br /><br />
                <h2 style="display:inline; padding:2%;margin-left:3%">제목</h2>
                
                <select name="opt" style="font-size:100%; height:30px;display:inline">
                	    <option value="자연과학부">자연과학부</option>
                    <option value="생명환경학부">생명환경학부</option>
                    <option value="컴퓨터정보공학부">컴퓨터정보공학부</option>
                    <option value="정보통신전자공학부">정보통신전자공학부</option>
                    <option value="미디어기술컨텐츠학과">미디어기술컨텐츠학과</option>
                </select> 
                <input type="text" name="title" size="50" style="font-size:100%; height:30px;margin-left:2%" value='${bbsItem.title}'/>
                <br /><br /><br />
                <textarea type="text" cols="125" name="content" rows="15" style="margin-left:2.5%;">${bbsItem.content}</textarea>
                <input type="hidden" name="seqNo" value="${param.SEQ_NO}"/>
                
                <br />
                <br /><br />
                <a href="bbs-list" class="button" style="margin-right:-1%;">취소</a>

                <input type="submit" value="확인" class="button" />
            </form>
        </div>
    </div>
</body>
</html>