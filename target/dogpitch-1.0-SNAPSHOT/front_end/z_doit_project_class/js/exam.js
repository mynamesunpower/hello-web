$(function () {

    // 1. 오늘 날짜 출력
    let today = new Date();
    $('#date_wrap > span.year').text(today.getFullYear());
    $('#date_wrap > span.month').text(today.getMonth()+1);
    $('#date_wrap > span.date').text(today.getDate());

    // 2. 포커스 가면 '검색어를 입력하세요' 안보이기, 포커스 없으면 다시 출력
    $('#keyword').focusin(function () {
        $('#keyword').css('background', 'none');
    });
    $('#keyword').focusout(function () {
        $('#keyword').css({
            'background-image' : 'url("../images/sch_guide.gif")',
            //'background-image' : 'url("/sunnyJava/web/z_doit_project_class/images/sch_guide.gif")',
            'background-repeat' : 'no-repeat'
        });
    });

    // 3. 탭팬 구현
    let anchors = $('#tabmenu > dt > a'); // 각 a태그 전부 선택
    let dds = $('#tabmenu > dd'); // dd 요소들 선택
    
    anchors.show(); // a 태그는 보여줌
    dds.hide(); // dd는 숨김

    let lastDd = dds.first(); // 임의로 시작 dd 정함
    lastDd.show();

    anchors.click(function () {
        let currentDd = $(this).parent().next();
        $(this).children('img').attr('src', $(this).children('img').attr('src').replace("out", "over"));
        lastDd.prev().find('img').attr('src', lastDd.prev().find('img').attr('src').replace("over", "out"));
        lastDd.hide();
        currentDd.show();

        lastDd = currentDd;
    });

    // 4. 이미지슬라이드 구현
    // span 부분 텍스트 중앙으로 정렬 (임의)
    $('#best_bg > ul span').css({
        'padding-top' : '10px',
        'padding-right' : '35px'
    });

    let slider = $('#best_bg > ul').bxSlider({
            mode : 'horizontal', // 수평 모드
            nextText: '', // 다음 요소 버튼의 텍스트 없애기
            prevText: '', // 이전 요소 버튼의 텍스트 없애기
            minSlides : 5,
            maxSlides : 5,
            slideMargin : 5,
            slideWidth : 160,
            auto : true,
            autoHover : true, // hover시 슬라이더 멈추기, 재시작
            moveSlides : 1,
            speed: 500, // 다음 요소를 가져오는 속도 (ms)
            pause: 1500, // 멈춤 시간 (ms)
            pager: false,
            autoControls: false
        });

    // 다음 버튼 클릭 기능
    $('.next_btn').click(function () {
        slider.goToNextSlide(); // bxSlider 객체에서 쓸 수 있는 함수 (다음 요소로)
        return false;
    });
    // 이전 버튼 클릭 기능
    $('.prev_btn').click(function () {
       slider.goToPrevSlide(); // bxSlider 객체에서 쓸 수 있는 함수 (이전 요소로)
       return false;
    });

    // 5. 로그인을 누르면 로그인 창이 보이고 클로즈를 누르면 다시 안 보임
    $('.login_wrap > a').click(function () {
        if($('#login_f').css('display') === "none"){
            $('#login_f').show();
        }
        $('#login_f').css({
            'top' : '20px'
        });
    });

    $('.login_close_btn').click(function () {
        $('#login_f').hide();
    });

    // 6. 전체 메뉴를 누르면 전체 메뉴가 뜨고 클로즈를 누르면 들어감
    $('#total_btn').click(function () {
        $('#total_menu').toggle();
    });
    $('#total_close').click(function () {
        $('#total_menu').hide();
    });
    
    // 7-1. 알림판 기능
    let dts = $('#roll_banner_wrap dt');
    let lastDt = dts.first();
    $(dts).click(function () {
        let currentDt = $(this);
        let number = $(this).attr('class').substr(8,1); // 숫자 가쟈오기

        // 클릭한 요소(숫자 버튼) 이미지 바꾸기
        $(this).find('img').attr('src', $(this).find('img').attr('src').replace("out", "over"));
        lastDt.find('img').attr('src', lastDt.find('img').attr('src').replace("over", "out"));
        $('#roll_banner_wrap dd').hide(); // dd(큰 이미지 부분 전부 숨기기)
        $('.roll_btn' + number).next().show(); // .roll_btn1의 다음 요소(dd)를 보여주기

        lastDt = currentDt;
    });

    // 7-2. 인쇄 버튼
    $('.print_btn').click(function () {
        window.print();
    });

    // 7-3. 화면 크기
    $('.zoom_in').click(function () {
        $('*').css('zoom', '+=0.01');
    });
    $('.zoom_out').click(function () {
        $('*').css('zoom', '-=0.01');
    });
    $('.zoom_return').click(function () {
        $('*').css('zoom', '1');
    });



});