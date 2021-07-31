<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout2/top.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            일기
            <small id="subTitle"></small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- 일기 -->
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="box-tools pull-right">
                            <a href="<c:url value='/diary/create'/>" class="btn btn-primary">일기 쓰기</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered" id="diaryTable">
                            <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성</th>
                                <th>등록일시</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${diaryList}" var="diary">
                                <tr>
                                    <td>
                                        <a href="<c:url value='/diary/read'/>?id=${diary.id}">${diary.title}</a>
                                    </td>
                                    <td>${diary.userId}</td>
                                    <td>
                                        ${fn:substring(diary.updateDateTime, 0, 4)}-${fn:substring(diary.updateDateTime, 4, 6)}-${fn:substring(diary.updateDateTime, 6, 8)}&nbsp;${fn:substring(diary.updateDateTime, 8, 10)}:${fn:substring(diary.updateDateTime, 10, 12)}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--// 일기 -->

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