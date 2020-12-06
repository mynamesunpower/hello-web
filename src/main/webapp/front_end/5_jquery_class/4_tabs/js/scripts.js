$(function () {

    let topDiv = $('.tabSet'); // body 안의 div 통째로 선택했지만 쓰진 않았음.

    let anchors = $('.tabs > li > a'); // ul(.tabs) > li > 각 a태그들을 전부 선택
    
    let panelDivs = $('div.panel'); // .panel클래스인 div요소(들) 선택

    // a 태그는 보여줌
    anchors.show();

    // 패널부분은 숨김
    panelDivs.hide();

    // a 태그에서 on 클래스를 찾는다.
    let lastAnchor = anchors.filter('.on');
    let lastPanel = $(lastAnchor.attr('href'));
    lastPanel.show();
    
    /*anchors.click(function () {
        panelDivs.hide();
        anchors.removeClass('on');
        $(this).addClass('on');
        $($(this).filter('.on').attr('href')).show();
    });*/

    anchors.click(function () {
        let currentAnchor = $(this);
        currentAnchor.addClass('on');
        lastAnchor.removeClass('on');
        let currentPanel = $(currentAnchor.attr('href'));

        lastPanel.hide();
        currentPanel.show();

        lastAnchor = currentAnchor;
        lastPanel = currentPanel;
    });
});