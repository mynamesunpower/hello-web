/**
 * 
 */

$(document).ready(function (){

    // animate({속성}, 시간(ms))
    $('#intro').animate({
        'padding' : '20px',
        'font-size': '25px'
    }, 2000);

    $('#navigation li').hover(function () {
        $(this).animate({
            'padding-left' : '+=15px'
        }, 300);
    }, function () {
        $(this).animate({
            'padding-left' : '-=15px'
        }, 300);
    });

    // window 객체에 스크롤을 할 때 이벤트를 걸자
    $(window).scroll(function (){
        $('#navigation').css('top', $(document).scrollTop());
        //$('#navigation').css('left', $(document).scrollLeft());
    });

});