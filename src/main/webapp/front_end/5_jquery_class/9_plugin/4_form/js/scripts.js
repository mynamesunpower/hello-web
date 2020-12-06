/**
 * 
 */

$(function () {
    $('#signup > form').validate({
        rules : {
            name : {
                required : true,
                minlength : 4
            }, // id = "name"을 찾는거임
            email : {
                email : true
            },
            website : {
                url : true
            },
            password : {
                required: true
            },
            passconf : {
                equalTo : '#password'
            }
        },
        success : function (label) {
            label.addClass('valid');
            label.text('성공'); // 출력은 안되지만 없으면 녹색체크가 안됨(?)
        }
    });

    $('.check-all').click(function () {
        $('.agree').prop('checked', $(this).is(':checked'));
    });

    $('.agree').click(function () {
        if(!$(this).is(':checked')){
            $('.check-all').prop('checked', false);
        }
    });
});