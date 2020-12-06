$(function () {
   $('#info').tabs({
       active : 1,  // active: 처음에 활성화될 패널의 인덱스.
       event : 'mouseover', // event: 탭을 활성화하는 이벤트
       heightStyle : 'auto',  // content 내용에 따라 높낮이, fill 부모에게 무조건 맞춤, auto 가장 큰 친구로 통일
       hide : true
   });
});