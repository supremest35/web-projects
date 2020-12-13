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
            <div class="card-header"><h4>책정보</h4></div>
            <div class="card-body">
               <table class="table table-bordered">
                  <colgroup>
                     <col width="12%">
                     <col width="38%">
                     <col width="12%">
                     <col width="38%">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>번호</th>
                        <td></td>
                        <th>등록일</th>
                        <td></td>
                     </tr>
                     <tr>
                        <th>제목</th>
                        <td></td>
                        <th>종류</th>
                        <td></td>
                     </tr>
                     <tr>
                        <th>저자</th>
                        <td></td>
                        <th>출판사</th>
                        <td></td>
                     </tr>
                     <tr>
                        <th>정상 가격</th>
                        <td>원</td>
                        <th>할인가격</th>
                        <td>원</td>
                     </tr>
                     <tr>
                        <th>평점</th>
                        <td></td>
                        <th>재고현황</th>
                        <td>권</td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="card-footer">
               <a href="" class="btn btn-warning">바로구매</a>
               <a href="" class="btn btn-danger">장바구니</a>
               <a href="" class="btn btn-primary float-right">목록</a>
            </div>
         </div>
      </div>
   </div>
   <div class="row mt-5">
      <div class="col-12">
         <div class="card">
            <!-- 리뷰 입력폼 시작 -->
            <div class="card-body">
               <form method="post" action="">
                  <div class="form-group row">
                     <div class="col-12">
                        <textarea rows="5" class="form-control" name="content" placeholder="리뷰를 남겨주세요"></textarea>
                     </div>
                  </div>
                  <div class="form-group row">
                     <div class="col-10">
                        <div class="form-check">
                           <label class="form-check-inline font-weight-bold">
                              평점
                           </label>
                           <label class="form-check-inline">
                              <input type="radio" class="form-check-input" name="point" value="1" checked/>1점 
                           </label>
                           <label class="form-check-inline">
                              <input type="radio" class="form-check-input" name="point" value="2" />2점 
                           </label>
                           <label class="form-check-inline">
                              <input type="radio" class="form-check-input" name="point" value="3" />3점 
                           </label>
                           <label class="form-check-inline">
                              <input type="radio" class="form-check-input" name="point" value="4" />4점 
                           </label>
                           <label class="form-check-inline">
                              <input type="radio" class="form-check-input" name="point" value="5" />5점 
                           </label>
                        </div>
                     </div>
                     <div class="col-2 text-right">
                        <input type="submit" class="btn btn-outline-primary" value="등록" />
                     </div>
                  </div>
               </form>   
            </div>
            <!-- 리뷰 입력폼 끝 -->
            
            <!-- 리뷰 목록  시작 -->
            <ul class="list-group m-3">
               <li class="list-group-item">
                   <div class="d-flex w-100 justify-content-between ">
                        <h5 class="mb-1">홍길동 <span class="badge badge-info ml-3">2점</span></h5>
                        <small>2020-21-05 12:56:01</small>
                   </div>
                   <hr/>
                   <p class="mb-1">리뷰 내용입니다.</p>
                 </li>
                 <li class="list-group-item">
                   <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">홍길동 <span class="badge badge-info ml-3">4점</span></h5>
                        <small>2020-21-05 12:56:01</small>
                   </div>
                   <hr/>
                   <p class="mb-1">리뷰 내용입니다.</p>
                 </li>
                 <li class="list-group-item">
                   <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">홍길동 <span class="badge badge-info ml-3">5점</span></h5>
                        <small>2020-21-05 12:56:01</small>
                   </div>
                   <hr/>
                   <p class="mb-1">리뷰 내용입니다.</p>
                 </li>
            </ul>
            <!-- 리뷰 목록 끝  -->
         </div>
      </div>
   </div>
   
   <div class="row">
      <div class="col-12">
         <%@ include file="../common/footer.jsp" %>
      </div>
   </div>
</div>
</body>
</html>