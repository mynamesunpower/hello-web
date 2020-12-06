<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-03
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
<title>오늘의 온도</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 차트 링크 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<!-- 부트스트랩 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {

    // 페이지가 불려지면 대분류부터 가져옴
    $.ajax({
        type : 'get',
        url : './address/proxy_top.jsp',
        dataType: 'json',
        success : function (result) {
            let inputOption = "";
            $.each(result, function(i, v){
                // 데이터 인풋
                inputOption += "<option value="+ v.code +">" + v.value + "</option>";
            });
            $('#top').html(inputOption);
        },
        error : function (err) {
            console.log(err);
        }
    });

    $('#top').on('change', function () {
        let val = $(this).prop("selected", true).val();
        $.ajax({
            type : 'get',
            url : 'http://www.kma.go.kr/DFSROOT/POINT/DATA/mdl.'+val+'.json.txt',
            dataType: 'jsonp',
            success : function (result) {
                alert(result);
            },
            error : function (err) {
                console.log(err);
            }
        });
    });

    let hourData = [];
    let tempData = [];
    let dayData = [];
    $('input[value="weather"]').click(function () {
        $.ajax({
            type: 'get',
            url: '../../../back_end/01_basic_class/6_ajax_class/06_jquery_ajax_proxy/jsp/proxy_kma.jsp',
            dataType: 'xml',
            success: function (result) {
                let today = parseInt($('description tm', result).text().substr(4, 4));
                let location = $('item > category', result).text();
                $('#header').text(location + " 날씨");
                let timeData = $('data', result);
                timeData.each(function () {
                    if ($('hour', this).text() === '3'){
                        today++;
                    }
                    hourData.push([today, $('hour', this).text()+"시"]);
                    tempData.push($('temp', this).text());
                });
                let ctx = document.getElementById('myChart').getContext('2d');
                let chart = new Chart(ctx, {
                    type : 'line',
                    data : {
                        labels : hourData,
                        datasets : [{
                            label: '날씨 정보',
                            backgroundColor: 'transparent',
                            borderColor: 'red',
                            fontSize: 18,
                            data: tempData
                        }]
                    },
                    options: {
                        legend: {
                            labels: {
                                fontColor: "red",
                                fontSize: 18
                            }
                        },
                        scales: {
                            yAxes: [{

                            }],
                            xAxes: [{

                            }]
                        }
                    }
                });

            },
            error: function (err) {
                console.log(err);
            }
        });
    });


});
</script>
</head>
<body>
<select id="top">
    <option>대분류</option>
</select>
<select id="middle">
    <option>중분류</option>
</select>
<select id="bottom">
    <option>소분류</option>
</select>
<input type="button" name="weather" value="weather"/>
<div id="header" style="text-align: center">
</div>
<div class="container">
    <canvas id="myChart"></canvas>
</div>
<div id="test"></div>
</body>
</html>

