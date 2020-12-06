/*
    -- jquery.RED
      My Jquery Library
       published for free --

                    M. Kim
 */


$.fn.red=function () {
    $(this).css('background-color', 'red');

    return this; // 순수한 html 태그
}

$.prototype.sunny = function () {
    alert($(this));
    return this;
}