<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout1/top.jsp" %>


<!-- 아이디 찾기 -->
<div class="col-md-4 col-md-offset-2">
    <div class="panel panel-primary">
        <div class="panel-heading">
            아이디 찾기
        </div>
        <div class="panel-body">
            <form id="findIdForm" method="post" action="">
                <div class="form-group">
                    <input type="email" id="findIdEmail" class="form-control" placeholder="이메일">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">아이디 찾기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--// 아이디 찾기 -->

<!-- 비밀번호 찾기 -->
<div class="col-md-4">
    <div class="panel panel-primary">
        <div class="panel-heading">
            비밀번호 찾기
        </div>
        <div class="panel-body">
            <form id="findPasswordForm" method="post" action="">
                <div class="form-group">
                    <input type="email" id="findPasswordEmail" class="form-control" placeholder="이메일">
                </div>
                <div class="form-group">
                    <input type="text" id="id" class="form-control" placeholder="아이디">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--// 비밀번호 찾기 -->

<%@include file="../layout/layout1/bottom.jsp" %>
<script>
    // 아이디찾기 입력값 검증
    $('#findIdForm').on('submit', function () {
        // 이메일 검증
        if (!$('#findIdEmail').val().trim()) {
            alert('이메일을 입력하세요.');
            $('#findIdEmail').val('').focus();
            return false;
        }
    });

    // 비밀번호찾기 입력값 검증
    $('#findPasswordForm').on('submit', function () {
        // 이메일 검증
        if (!$('#findPasswordEmail').val().trim()) {
            alert('이메일을 입력하세요.');
            $('#findPasswordEmail').val('').focus();
            return false;
        }

        // 아이디 검증
        if (!$('#id').val().trim()) {
            alert('아이디를 입력하세요.');
            $('#id').val('').focus();
            return false;
        }
    });
</script>
</body>

</html>