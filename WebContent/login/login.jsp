<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/fooding/bootstrap/css/bootstrap.min.css">


<style>
label{font: 돋움; color: #A6A6A6;}

</style>

<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal"
      aria-label="Close">
      <span aria-hidden="true">x</span>
   </button>
   <h4 class="modal-title">로그인</h4>
</div>

<div class="modal-body">
   <div class="row ">
      <form class="form-horizontal" method="post" action="login">
         <input type="hidden" value="login" name="cmd" />
         <div class="form-group ">
            <label for="inputEmail3" class="col-sm-2 control-label">아이디</label>
            <div class="col-sm-5">
               <input type="text" class="form-control " placeholder="id"
                  name="userid">
            </div>
         </div>

         <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-5">
               <input type="password" class="form-control" placeholder="password"
                  name="userpassword">
            </div>
         </div>

         <div class="col-sm-offset-2 col-sm-11">
         <div>
          <label><button   type="button" class="btn btn-link" onclick="location.href='search?cmd=loginsearch'">아이디/비밀번호 찾기</button></label>
         </div>
            <input type="submit" class="btn btn-danger" value="아이디로 로그인" />

         </div>
      </form>
   </div>
</div>

<div class="modal-footer">
   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
</div>