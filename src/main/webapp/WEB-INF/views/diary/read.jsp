<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="../layout/layout2/top.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            일기장
            <small id="subTitle"></small>
        </h1>
        <ol class="breadcrumb">
            <li>현재시간 : <span id="currentTime"></span></li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">

            <!-- 나의 일기 내용 -->
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">인내는 희망을 품은 기술이다.</h3>
                        <div class="box-tools pull-right">
                            <a href="create.jsp" class="btn btn-primary">일기 쓰기</a>
                        </div>
                    </div>
                    <div class="box-body">
                        <div>
                            <span class="text-muted">2021.07.09</span>
                        </div>
                        <div>
                            안네는 작가를 지망하고 있었으며 자신이 적은 일기도 퇴고해서 새로 적고 있었다. 그 때문에 일기에는 오리지널 일기와 자신이 정서한 개정판 원고의 두 가지가 있다. 이
                            원고들은 어느쪽이건 완전한 책의 형태가 아니기 때문에 사후에 출간된 책은 아버지 오토 프랑크가 양쪽을 상호 보완하는 형태로 편집해서 만든 것이다.

                            이 편집의 도중에 안네가 기술한 내용 중, 사춘기 소녀다운 성적 호기심이나 지루한 에피소드, 어머니에 대한 신랄한 비판과 제 3자들에 대한 비판은 일부 삭제나 정정이
                            있었다. 그런데 안네 프랑크가 유명해지면서, 홀로코스트 부인론자들은 안네의 일기가 허구이며 안네는 실존하지 않았거나 일기의 내용이 부친에 의해서 날조된 것이라는
                            주장이 제기되었다.

                            1958년 홀로코스트 부인론자들의 '안네가 실존했다면 안네를 체포한 인간을 찾아내라"는 주장에 대하여 나치 헌터로 유명한 시몬 비젠탈은 게슈타포 출신으로 네덜란드에서
                            SD 상사였던 카를 질베바우어를 1963년에 찾아내어 안네가 실존했음을 증명하는데 성공한다. 인터뷰에서 실베바우어는 그가 전시중에 SD에서 일했음을 시인했고 안네
                            프랑크의 사진을 보고 그가 체포한 사람들 중 하나였다고 인정했으며 체포한 유대인들에게서 압수한 물건을 담는 가방에서 안네의 일기장을 빼내는 것을 보았다고 한 그의
                            진술은 오토 프랑크의 진술과 합치했다.

                            이후에도 홀로코스트 부인론자들은 끈질기게 안네의 마지막 일기가 허구라는 주장을 계속했으며 1970년대에 영국의 유명한 홀로코스트 부인론자 데이비드 어윙은 일기가
                            가짜라고 주장했고 1976년에 일기가 허위라는 팜플렛을 프랑크푸르트에서 배포하던 네오나치주의자 에른스트 뢰머와 에드거 가이스가 체포되었을때 일기의 진위 여부에 대한
                            논쟁은 최고조에 달했다. 이 재판중에 오토 프랑크의 의뢰를 받은 역사가 팀이 원본을 정밀 조사하여 일기가 진짜라는 결론을 내렸지만 1978년 뢰머와 가이스가
                            상소하면서 독일 내무성 소속 범죄조사국(Bundes kriminalamt ; BKA)은 원본의 종이와 잉크에 대한 과학 분석을 실시해서 "일기를 적을 때 사용한
                            잉크는 전시중의 것이지만 나중에 기입된 정정사항들은 흑, 녹, 청 볼펜으로 기록된 것이다"라는 취지의 보고서를 제출했다. BKA는 이에 관련된 상세한 내용을 발표하지
                            않았지만 일기의 진위를 의심하는 사람들은 볼펜은 1950년대에나 널리 사용되었기 때문에 이것이야말로 일기가 허위라는 결정적인 증거라고 받아들였다.

                            1986년 일기의 원본을 보관하고 있는 네덜란드의 전시자료 연구소는 보다 상세한 과학적 조사를 진행하기 위해 BKA에게 볼펜으로 기술된 부분을 지적할 것을 요구했으나
                            BKA는 그 부분을 지적할 수가 없었다. 추후의 조사를 통해서 볼펜으로 기입된 종이 두 장을 발견했으며 1987년 함부르크의 심리학자로 필적 감정 전문가인 한스
                            오클먼은 그의 어머니인 도로시 오클먼이 미나 베커와 공동으로 일기를 조사했을 때 그 볼펜의 텍스트를 기입했음을 밝혀내어 일기의 진위에 대한 의문점은 해결되었다.
                            2003년에 출간된 수정판 일기에서는 논란이 된 두 장의 종이의 사진을 게재하고 있다.
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger" id="btnDelete" data-toggle="modal"
                                data-target="#modalDelete" data-backdrop="false">삭제
                        </button>
                    </div>
                </div>
            </div>
            <!--// 나의 일기 내용 -->

            <!-- 나의 일기 목록 -->
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">나의 일기</h3>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered" id="myTable">
                            <thead>
                            <tr>
                                <th>날짜</th>
                                <th>제목</th>
                                <th>좋아요</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--// 나의 일기 목록 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- 삭제 모달 -->
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

    /*
    // 삭제 버튼
    $('#btnDelete').on('click', function() {
      $('#modalDelete').modal({
        show: true,
        backdrop: false,
      });
    });
    */

    // 삭제 처리
    $('#btnDeleteConfirm').on('click', function () {
        $('#modalDelete').modal('hide');
        toastr.error('삭제되었습니다.');
    });

    // 리스트
    let textList = [
        '<b>장미꽃은 가시 틈에서 자란다.</b> - 탈무드',
        '음미되지 않은 인생은 보람이 없다. - 소크라테스',
        '자기를 아는 것이 최대의 지혜이다. - 탈무드',
        '인내는 희망을 품은 기술이다. - 시루스',
        '운명은 용감한 자를 사랑한다. - 버질',
        '누구나 자기 손아귀에 자기의 운명을 쥐고 있다. - 시푸스',
        '중요한 것보다 소중한 것을 먼저 하라. - 스티븐 코비',
        '귀 기울여라. 너의 혀가 너를 귀머거리로 만들기 전에. - 인디언 격언',
        '짧은 인생은 시간을 낭비함으로써 더욱 짧아진다. - 탈무드'
    ];

    // 명언, 격언
    $('#subTitle').html(textList[0]);

    // 10초마다 명언, 격언이 바뀌도록 처리
    setInterval(function () {
        let randomNumber = Math.floor(Math.random() * 7);
        $('#subTitle').html(textList[randomNumber]);
    }, 10000);

    let tr = '';
    let today = 20210730;
    for (let i = 0; i < 21; i++) {
        // 날짜
        let wdate = today - i;
        let wdateString = String(wdate);
        wdateString = wdateString.substring(0, 4) + '-'
            + wdateString.substring(4, 6) + '-'
            + wdateString.substring(6, 8);

        // 제목
        let randomTitle = Math.floor(Math.random() * 7);
        let title = textList[randomTitle];
        titles = title.split('-');
        title = '<a href="read.jsp">' + titles[0].trim() + '</a>';


        // 좋아요
        let like = Math.floor(Math.random() * 10);

        //tr += '<tr><td>' + wdateString + '</td><td>' + title + '</td><td>' + like + '</td></tr>';
        tr = '<tr><td>' + wdateString + '</td><td>' + title + '</td><td>' + like + '</td></tr>';
        $('#myTable > tbody').append(tr);     // 나의 일기
    }
    //$('#myTable > tbody').html(tr);
</script>
</body>

</html>