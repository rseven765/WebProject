<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout2/top.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            공지사항
            <small id="subTitle"></small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- 공지사항 -->
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header">
                        <div class="box-tools pull-right">
                            <a href="<c:url value='/notice/create'/>" class="btn btn-primary">공지사항 쓰기</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered" id="noticeTable">
                            <thead>
                            <tr>
                                <th>제목</th>
                                <th>날짜</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noticeList}" var="notice">
                                <tr>
                                    <td>
                                        <a href="<c:url value='/notice/read'/>?id=${notice.id}">${notice.title}</a>
                                    </td>
                                    <td>
                                        ${fn:substring(notice.updateDateTime, 0, 4)}-${fn:substring(notice.updateDateTime, 4, 6)}-${fn:substring(notice.updateDateTime, 6, 8)}&nbsp;${fn:substring(notice.updateDateTime, 8, 10)}:${fn:substring(notice.updateDateTime, 10, 12)}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--// 공지사항 -->

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