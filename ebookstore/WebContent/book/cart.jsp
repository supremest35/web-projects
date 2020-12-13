<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>Bootstrap 4 Example</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
   <div class="row">
      <div class="col-12">
         <%@ include file="../common/navbar.jsp" %>
      </div>
   </div>
   <div class="row">
      <div class="col-12">
         <div class="card">
            <div class="card-header">
               <h4>장바구니 리스트</h4>
            </div>
            <div class="card-body">
               <table class="table">
                  <colgroup>
                     <col width="10%">
                     <col width="*">
                     <col width="10%">
                     <col width="15%">
                     <col width="10%">
                     <col width="10%">
                     <col width="15%">
                  </colgroup>
                  <thead>
                     <tr>
                        <th>순번</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>할인가격</th>
                        <th>수량</th>
                        <th>구매금액</th>
                        <th></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td></td>
                        <td><a href=""></a></td>
                        <td><del class="text-danger">원</del></td>
                        <td> 원</td>
                        <td></td>
                        <td> 원</td>
                        <td class="text-center">
                           <a href="" class="btn btn-outline-secondary btn-sm">삭제</a>
                           <a href="" class="btn btn-primary btn-sm">구매</a>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>