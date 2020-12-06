$(document).ready(function(){

    let sum = 0;

    $('.menu > select').change(function () {

        let name = $(this).siblings('span').first().text(); //선택한 이름
        let price = $(this).siblings('span').last().text();  // 단가
        let count = 0;
        count += $(this).val(); // 선택 갯수

        // !(선택한 이름이 우측 주문내역 표에 들어가 있니!?)  => 들어가 있지 않니?
        if (!($('#listTable td:contains('+ name +')').text() === name)) {
            let tr = $('<tr/>'); // tr 태그 만들꺼야 한방에 열고 닫을꺼야
            tr.append('<td class="name">' + name + '</td>'); // td 이름 넣자 클래스도 부여하자
            tr.append('<td class="count">' + count + '</td>'); // td 수량 넣자 클래스도 부여하자
            tr.append('<td> <input type="button" class="delete" value="삭제"> </td>'); // 버튼 만들기
            $('#listTable').append(tr); // 행 삽입

            sum += count * price; // 합계 계산
            $('#total').val(sum); // 합계창에 출력
        } 
        else {
            let coffeeCount = $('#listTable tr:contains('+ name +')').children('.count').text();
            sum -= coffeeCount * price;
            coffeeCount += count;
            $('#listTable tr:contains('+ name +')').children('.count').text(coffeeCount);
            sum += coffeeCount * price;
            $('#totallist input[id="total"]').val(sum);
        }         
        
    });

    // 동적 버튼에 이벤트 걸기 on ('이벤트', '어디다 걸래?', '뭐 시킬래')
    $(document).on('click', '.delete', function () {
        let tr = $(this).parent().parent(); // 버튼의 부모님의 부모님 -> tr
        let name = $(this).parent().siblings('.name').text(); // 버튼의 부모님의 형제 .name 클라쓰 -> 커피이름
        let count = $(this).parent().siblings('.count').text(); // 버튼의 부모님의 형제 .count클라쓰 -> 수량
        // 왼쪽 메뉴판에서 단가 가쟈오기
        let price = $('td:contains(' + name + ')').children('span').last().text();

        sum -= count * price; // 계산
        $('#total').val(sum); // 출력
        tr.remove(); // 행 지워
    });



});