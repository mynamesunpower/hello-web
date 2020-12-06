/**
 * 
 */
$(function () {
    // 개별적으로 관리한다.
    $('.accordion').each(function () {
        // $(this) => 각각의 dl 태그
        let allDt = $(this).find('dt');
        let allDd = $(this).find('dd');

        allDd.hide();
        allDt.css('cursor', 'pointer');
        allDt.click(function () {
            allDd.hide();
            // slideDown().. fadeIn()... toggle().... show()대신 쓸만한거 많음
            $(this).next().toggle();
        });
    });
});