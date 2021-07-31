<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout1/top.jsp" %>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            사용자
            <small id="subTitle"></small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <!-- 사용자 쓰기 -->
            <div class="col-md-4">
                <form name="userForm" method="post">
                    <div class="box">
                        <div class="box-body">
                            <div class="form-group">
                                <select name="userType" class="form-control">
                                    <option value="STU" selected>일반사용자</option>
                                    <option value="COR">기업 사용자</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="userName" class="form-control" placeholder="이름(2~4글자)" maxlength="4">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userEmail" class="form-control" placeholder="이메일">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userTel" class="form-control" placeholder="전화번호">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userId" class="form-control" placeholder="아이디(숫자,영소문자,5~10글자)" maxlength="10">
                            </div>
                            <div class="form-group">
                                <input type="password" name="userPassword" class="form-control" placeholder="비밀번호">
                            </div>
                            <div class="form-group">
                                <input type="password" name="userPasswordConfirm" class="form-control" placeholder="비밀번호 확인">
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="button" id="btnCancel" class="btn btn-default">취소</button>
                            <div class="box-tools pull-right">
                                <button type="submit" class="btn btn-primary">등록</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--// 사용자 쓰기 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->


<%@include file="../layout/layout1/bottom.jsp" %>


<script>
    // 정규식
    let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    let regId = /^[0-9a-z]{5,10}$/i;
    let regPassword = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

    // 취소
    $('#btnCancel').on('click', function () {
        let choice = confirm('취소하시겠습니까?');

        // 확인
        if (choice) {
            window.history.back();
        }
    });

    // 화면을 처음 보여줄때 이름 입력에 포커스 처리
    $('input[name=userName]').focus();

    // 아이디입력(숫자, 영소문자, 5~10글자) 검증
    $('input[name=userId]').on('keyup', function () {
        $(this).val($(this).val().replace(/[^0-9a-z]/g, ''));
    });

    // 사용자등록 입력값 검증
    $('form[name=userForm]').on('submit', function () {
        let userName = $('input[name=userName]').val().trim();
        let userEmail = $('input[name=userEmail]').val().trim();
        let userTel = $('input[name=userTel]').val().trim();
        let userId = $('input[name=userId]').val().trim();
        let userPassword = $('input[name=userPassword]').val().trim();
        let userPasswordConfirm = $('input[name=userPasswordConfirm]').val().trim();

        // 이름 검증
        if (!userName) {
            toastr.error('이름을 입력하세요.');
            $('input[name=userName]').val('').focus();
            return false;
        }

        // 이름 검증
        if (userName.length < 2 || userName.length > 4) {
            toastr.error('이름은 2글자에서 4글자까지 입력하세요.');
            $('input[name=userName]').val('').focus();
            return false;
        }

        // 이메일 검증
        if (!userEmail.match(regEmail)) {
            toastr.error('이메일을 입력하세요.');
            $('input[name=userEmail]').val('').focus();
            return false;
        }

        // 전화번호 검증
        if (!userTel) {
            toastr.error('전화번호를 입력하세요.');
            $('input[name=userTel]').val('').focus();
            return false;
        }

        // 아이디 검증
        if (!userId) {
            toastr.error('아이디는 숫자, 영소문자, 5글자에서 10글자까지 입력하세요.');
            $('input[name=userId]').focus();
            return false;
        }

        // 아이디 검증
        if (userId.length < 5 || userId.length > 10) {
            toastr.error('아이디는 숫자, 영소문자, 5글자에서 10글자까지 입력하세요.');
            $('input[name=userId]').val('').focus();
            return false;
        }

        // 아이디 검증
        if (!userId.match(regId)) {
            toastr.error('아이디는 숫자, 영소문자, 5글자에서 10글자까지 입력하세요.');
            $('input[name=userId]').val('').focus();
            return false;
        }

        // 비밀번호 검증

        if (!userPassword.match(regPassword)) {
            toastr.error('비밀번호는 숫자, 영문자, 특수문자(!@#$%^*+=-), 8글자에서 20글자까지 입력하세요.');
            $('input[name=userPassword]').val('').focus();
            return false;
        }



        // 비밀번호 확인 검증
        if (userPasswordConfirm != userPassword) {
            toastr.error('비밀번호와 비밀번호 확인이 다릅니다.');
            $('input[name=userPassword]').val('').focus();
            return false;
        }
    });
</script>
</body>

</html>