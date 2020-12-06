/**
 * bpopup magnificpopup colorbox jbox....
 */


/*$(function () {
    $('a[rel="prettyPopin"]:eq(0)').prettyPopin({
        width : '500px'
    });
    $('a[rel="prettyPopin"]:eq(1)').prettyPopin({
        width : '500px',
        callback : function () {
            alert("팝업창이 닫힙니다.");
        }
    });


});*/
$(function(){
    $('a[rel="prettyPopin"]:eq(0)').prettyPopin({
        width:500
    });
    $('a[rel="prettyPopin"]:eq(1)').prettyPopin({
        width:500,
        callback:function(){
            alert('팝업창이 닫힘');
        }
    });
})