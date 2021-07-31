<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout2/top.jsp" %>

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

            <!-- 사용자 정보 -->
            <div class="col-md-4">
                <div class="box">
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tr>
                                <th>구분</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.userType eq 'ADMIN'}">
                                            <code>관리자</code>
                                        </c:when>
                                        <c:otherwise>
                                            일반사용자
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${user.userName}</td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td>${user.userId}</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>${user.userTel}</td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td>${user.userEmail}</td>
                            </tr>
                            <tr>
                                <th>등록일시</th>
                                <td>
                                    ${fn:substring(user.createDateTime, 0, 4)}-${fn:substring(user.createDateTime, 4, 6)}-${fn:substring(user.createDateTime, 6, 8)}&nbsp;${fn:substring(user.createDateTime, 8, 10)}:${fn:substring(user.createDateTime, 10, 12)}
                                </td>
                            </tr>
                            <tr>
                                <th>수정일시</th>
                                <td>
                                    ${fn:substring(user.updateDateTime, 0, 4)}-${fn:substring(user.updateDateTime, 4, 6)}-${fn:substring(user.updateDateTime, 6, 8)}&nbsp;${fn:substring(user.updateDateTime, 8, 10)}:${fn:substring(user.updateDateTime, 10, 12)}
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger" id="btnDelete" data-toggle="modal"
                                data-target="#modalDelete" data-backdrop="false">삭제
                        </button>
                        <div class="box-tools pull-right">
                            <a href="<c:url value='/user/update'/>?userId=${user.userId}" class="btn btn-warning">수정</a>
                            <a href="<c:url value='/user/list'/>" class="btn btn-primary">목록</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// 사용자 정보 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- 삭제 모달 -->
<form name="deleteForm" method="post" action="<c:url value='/user/delete'/>">
    <input type="hidden" name="userId" value="${user.userId}">
</form>
<div class="modal fade" id="modalDelete">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                경고
            </div>
            <div class="modal-body">
                삭제된 데이터는 복구가 불가능합니다. 정말 삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button class="btn btn-danger pull-left" id="btnDeleteConfirm">삭제</button>
                <button class="btn btn-default" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
<!--// 삭제 모달 -->

<%@include file="../layout/layout2/bottom.jsp" %>

<script>
    // 삭제 처리
    $('#btnDeleteConfirm').on('click', function() {
       $('form[name=deleteForm]').submit();
    });
</script>
</body>

</html>