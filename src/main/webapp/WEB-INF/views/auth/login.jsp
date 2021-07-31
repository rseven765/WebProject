<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout1/top.jsp" %>


<!-- 로그인 -->
<div class="col-md-4 col-md-offset-4">
    <div class="alert alert-danger hidden" id="errorBox">
        <h4>
            <i class="icon fa fa-ban"></i>
            오류
        </h4>
        <div id="errorMessage"></div>
    </div>
    <div class="panel panel-primary">

        <div class="panel-heading">
            <form method="post">
                <button type="button" class="active btn btn-primary" id="stuBtn">
                    개인회원
                </button>
                <button type="button" class="btn btn-primary" id="corBtn">
                    기업회원
                </button>
            </form>
        </div>
        <div class="panel-body">
            <form id="loginForm" method="post">
                <div class="form-group">
                    <label id="typeText">
                        개인회원 로그인입니다.
                    </label>
                </div>
                <div class="form-group">
                    <input type="hidden" name="userType" id ="userType" value="STU"/>
                </div>
                <div class="form-group">
                    <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디">
                </div>
                <div class="form-group">
                    <input type="password" name="userPassword" id="userPassword" class="form-control"
                           placeholder="비밀번호">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </form>
            <hr>
            <div>
                <a href="<c:url value='/auth/find_password'/>">아이디/비밀번호 찾기</a>
                <div class="pull-right">
                    <a href="<c:url value='/auth/register'/>">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--// 로그인 -->

<%@include file="../layout/layout1/bottom.jsp" %>

<script>
    //change userLoginType
    //stuLoginMode
    $('#stuBtn').on('click', function () {
        $('#corBtn').attr('class', 'btn btn-primary');
        $('#typeText').text('개인회원 로그인입니다.');
        $('#userType').attr('value', 'STU');
    });
    //corLoginMode
    $('#corBtn').on('click', function () {
        $('#stuBtn').attr('class', 'btn btn-primary');
        $('#typeText').text('기업회원 로그인입니다.');
        $('#userType').attr('value', 'COR');
    });


    let errorCode = '${errorCode}';
    if (errorCode == '201') {
        $('#errorMessage').text('사용자가 존재하지 않습니다.');
        $('#errorBox').removeClass('hidden');
    } else if (errorCode == '202') {
        $('#errorMessage').text('비밀번호가 틀렸습니다.');
        $('#errorBox').removeClass('hidden');
    }else if(errorCode == '203'){
        $('#errorMessage').text('로그인 종류를 확인해 주십시오.');
        $('#errorBox').removeClass('hidden');
    }

    // 화면을 처음 보여줄때 아이디 입력에 포커스 처리
    $('#userId').focus();

    // 로그인 입력값 검증

    $('#loginForm').on('submit', function () {
        // 아이디 검증
        if (!$('#userId').val().trim()) {
            alert('아이디를 입력하세요.');
            $('#userId').val('').focus();
            return false;
        }

        // 비밀번호 검증
        if (!$('#userPassword').val().trim()) {
            alert('비밀번호를 입력하세요.');
            $('#userPassword').val('').focus();
            return false;
        }
    });


</script>
</body>

</html>