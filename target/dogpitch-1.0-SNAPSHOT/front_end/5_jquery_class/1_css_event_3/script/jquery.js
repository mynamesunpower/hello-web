
$(document).ready(function () {

    $('.fontSize > button').click(function () {
        $(this).text() == "+"?
            $('#txt').animate({ 'font-size' : '+=1px' }, 100)
            : $('#txt').animate({ 'font-size' : '-=1px' }, 100);
    });
    
    $('#fontstyle').change(function () {
        $('#txt').css('font-family', $(this).val());
    });

    /*$('.fontSize>button:first-of-type').click( () =>{
    // $('#txt').css({'fontSize' : '+=1px'})
    $('#txt').animate({'fontSize' : '+=1px'},100)
})*/

});