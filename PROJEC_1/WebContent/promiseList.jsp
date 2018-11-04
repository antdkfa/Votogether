<%@page contentType="text/html; charset=euc-kr" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>공약 게시판</title>
      <style>
      #wrap {
         width: 1200px;
         text-align:center;
         margin: 0 auto 0 autu;
      }
      table {
      border: 1px solid #bcbcbc;
      width: 100%;
      height: 150px;
      border-collapse: collapse;
      text-align :center;
      }
      th, td {
      border: 1px solid #bcbcbc;
      padding: 5px;
      }
      .content {
         margin-top:15%;
         margin-left:10%;
            padding: 2%;
            width: 80%;
            text-align :center;
            border: 1px solid lightgray;
            box-shadow: 2px 2px 5px #808080;
            background-color: white;
        }
      .cand {
      width: 170px;
      }
      .name {
      width: 100px;
      }
      </style>
   </head>
   <body>
   <jsp:include page="./common/top.jsp"></jsp:include>
		
		
   
   <div id="wrap">
   <div class="content">
      <table>
         <thead>
            <tr>
               <th class="cand">후보자 번호</th>
               <th class="name">이름</th>
               <th>공약1</th>
               <th>공약2</th>
            </tr>
         </thead>
         <tbody>
         <tr>
         <c:forEach var ="cnt" begin="0" end="0">
         
            <td>${CN_LIST.candidatenum[cnt]}</td>
            <td>${CN_LIST.name[cnt]}</td>
            <td>${CN_LIST.promise1[cnt]}</td>
            <td>${CN_LIST.promise2[cnt]}</td>
         
         </c:forEach>
         </tr>
         <tr>
         <c:forEach var ="cnt" begin="1" end="1">
         
            <td>${CN_LIST.candidatenum[cnt]}</td>
            <td>${CN_LIST.name[cnt]}</td>
            <td>${CN_LIST.promise1[cnt]}</td>
            <td>${CN_LIST.promise2[cnt]}</td>
         
         </c:forEach>
         </tr>
         <tr>
         <c:forEach var ="cnt" begin="2" end="2">
            
            <td>${CN_LIST.candidatenum[cnt]}</td>
            <td>${CN_LIST.name[cnt]}</td>
            <td>${CN_LIST.promise1[cnt]}</td>
            <td>${CN_LIST.promise2[cnt]}</td>
         
         </c:forEach>
         </tr>
         </tbody>
      </table>
   </div>
   </div>
   <jsp:include page="./common/foot.jsp"></jsp:include>
   </body>
</html>