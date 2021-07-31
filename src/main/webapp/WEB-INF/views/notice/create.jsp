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

            <!-- 공지사항 쓰기 -->
            <div class="col-md-12">
                <form id="createForm" method="post">
                    <div class="box">
                        <div class="box-body">
                            <div class="form-group">
                                <input type="text" class="form-control" name="title" placeholder="제목">
                            </div>
                            <div class="form-group">
                                <textarea id="content" name="content" placeholder="내용"></textarea>
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
            <!--// 공지사항 쓰기 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<%@include file="../layout/layout2/bottom.jsp" %>

<script>
    // ckeditor
    CKEDITOR.replace('content').config.height = "400px";

    // 취소
    $('#btnCancel').on('click', function () {
        let choice = confirm('글을 작성중입니다. 취소하시겠습니까?');

        // 확인
        if (choice) {
            window.history.back();
        }
    })

    // 공지사항 저장 처리
    $('form[name=createForm]').on('submit', function() {
        let title = $('input[name=title]').val().trim();
        let content = CKEDITOR.instances.content.getData();

        // 제목 검증
        if (!title) {
            toastr.error('제목을 입력하세요.');
            $('input[name=title]').val('').focus();
            return false;
        }

        // 내용 검증
        if (!content) {
            toastr.error('내용을 입력하세요.');
            $('input[name=content]').val('').focus();
            return false;
        }
    });
</script>
</body>

</html>