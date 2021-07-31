<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="./layout/layout2/top.jsp" %>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            게시물
            <small id="subTitle"></small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div class="row">
            <!-- 학생 작품 공간 -->
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">학생 작품</h3>
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
            <!--// 나의 일기 -->

            <!-- 기업 공고 공간 -->
            <div class="col-md-6">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">기업 공고</h3>
                    </div>
                    <div class="box-body">
                        <table class="table table-bordered" id="friendTable">
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
            <!--// 친구 일기 -->

        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<%@include file="./layout/layout2/bottom.jsp" %>

<script>
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
    //let randomNumber = Math.floor(Math.random() * 7);       
    //$('#subTitle').html(textList[randomNumber]);

    /*
    // 1초뒤 1번만 실행
    setTimeout(function() {
      console.log(textList[randomNumber]);
    }, 1000);
    */

    // 명언, 격언
    $('#subTitle').html(textList[0]);

    // 10초마다 명언, 격언이 바뀌도록 처리
    setInterval(function () {
        let randomNumber = Math.floor(Math.random() * 7);
        $('#subTitle').html(textList[randomNumber]);
    }, 10000);

    /* 한국시간대로 변경 필요함
    setInterval(function() {
      // 1970년 1월 1일 0시 0분 0초부터 지금까지 흐름시간을 마이크로초로 표현
      let now = new Date(); 
      let YYYY = now.getFullYear();
      let MM = now.getMonth();
      let DD = now.getDay();
      let HH = now.getHours();
      let mm = now.getMinutes();
      let ss = now.getSeconds();
      console.log(YYYY + '-' + MM + '-' + DD + ' ' + HH + ':' + mm + ':' + ss);
    }, 1000);
    */

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
        title = '<a href="diary/read.jsp">' + titles[0].trim() + '</a>';


        // 좋아요
        let like = Math.floor(Math.random() * 10);

        //tr += '<tr><td>' + wdateString + '</td><td>' + title + '</td><td>' + like + '</td></tr>';
        tr = '<tr><td>' + wdateString + '</td><td>' + title + '</td><td>' + like + '</td></tr>';

        $('#myTable > tbody').append(tr);     // 나의 일기
        $('#friendTable > tbody').append(tr); // 친구 일기장

        // 베스트 일기
        like = Math.floor(Math.random() * 100) + 50;
        tr = '<tr><td>' + wdateString + '</td><td>' + title + '</td><td>' + like + '</td></tr>';
        $('#bestTable > tbody').append(tr);
    }
    //$('#myTable > tbody').html(tr);
</script>
</body>

</html>