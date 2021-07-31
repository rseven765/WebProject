<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../layout/layout2/top.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            사용자
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- 사용자 목록 -->
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">사용자 목록</h3>
                        <div class="box-tools pull-right">
                            <a href="<c:url value='/user/create'/>" class="btn btn-primary">사용자 등록</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered" id="userTable">
                            <thead>
                            <tr>
                                <th>구분</th>
                                <th>이름</th>
                                <th>아이디</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th>등록일시</th>
                                <th>수정일시</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${userList}" var="user">
                                <tr>
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
                                    <td>
                                        <a href="<c:url value='/user/read'/>?userId=${user.userId}">${user.userName}</a>
                                    </td>
                                    <td>${user.userId}</td>
                                    <td>${user.userTel}</td>
                                    <td>${user.userEmail}</td>
                                    <td>
                                        ${fn:substring(user.createDateTime, 0, 4)}-${fn:substring(user.createDateTime, 4, 6)}-${fn:substring(user.createDateTime, 6, 8)}&nbsp;${fn:substring(user.createDateTime, 8, 10)}:${fn:substring(user.createDateTime, 10, 12)}
                                    </td>
                                    <td>
                                        ${fn:substring(user.updateDateTime, 0, 4)}-${fn:substring(user.updateDateTime, 4, 6)}-${fn:substring(user.updateDateTime, 6, 8)}&nbsp;${fn:substring(user.updateDateTime, 8, 10)}:${fn:substring(user.updateDateTime, 10, 12)}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--// 나의 일기 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<%@include file="../layout/layout2/bottom.jsp" %>

<script>
</script>
</body>

</html>