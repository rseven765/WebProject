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

            <!-- 공지사항 내용 -->
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">${notice.title}</h3>
                    </div>
                    <div class="box-body">
                        <p>
                            <span class="text-muted">
                                ${fn:substring(notice.updateDateTime, 0, 4)}-${fn:substring(notice.updateDateTime, 4, 6)}-${fn:substring(notice.updateDateTime, 6, 8)}&nbsp;${fn:substring(notice.updateDateTime, 8, 10)}:${fn:substring(notice.updateDateTime, 10, 12)}
                            </span>
                        </p>
                        <div>${notice.content}</div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger" id="btnDelete" data-toggle="modal"
                                data-target="#modalDelete" data-backdrop="false">삭제
                        </button>
                        <div class="box-tools pull-right">
                            <a href="<c:url value='/notice/update'/>?id=${notice.id}" class="btn btn-warning">수정</a>
                            <a href="<c:url value='/notice/list'/>" class="btn btn-primary">목록</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// 공지사항 읽기 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- 삭제 모달 -->
<form name="deleteForm" method="post" action="<c:url value='/notice/delete'/>">
    <input type="hidden" name="id" value="${notice.id}">
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