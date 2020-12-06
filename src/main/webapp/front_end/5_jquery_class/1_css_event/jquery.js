/**
 * 
 */

$(document).ready(function(){

    $('#celebs tbody > tr:even').css('background-color', 'aliceblue');


    /*$('#celebs tbody > tr:even').addClass('table_striping');*/

    // 테이블에 마우스 올라가면 마우스오버 클래스
    $('#celebs table tr').hover(function(){
        $(this).addClass('td_mouseover');
    }, function () {
        $(this).removeClass('td_mouseover');
    });

    let img = $('p > img');
    $('#hideButton').click(function (){
        img.hide();
    });
    $('#showButton').click(function (){
        img.show();
    });
    $('#toggleButton').click(function (){
        img.isHidden? img.hide() : img.show();
    });

});

