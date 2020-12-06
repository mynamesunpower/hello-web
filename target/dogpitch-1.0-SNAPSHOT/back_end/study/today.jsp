<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-03
  Time: 오후 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<!-- <html lang="en" style="height: 100%"> -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트그리기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function () {
                    let ctx = document.getElementById('myChart').getContext('2d');
                    let chart = new Chart(ctx, {
                        // 챠트 종류를 선택
                        type: 'line',

                        // 챠트를 그릴 데이타
                        data: {
                            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],

                            datasets: [{
                                label: 'My First dataset',
                                backgroundColor: 'transparent',
                                borderColor: 'red',
                                data: [0, 10, 5, 2, 20, 30, 45]
                            }] },

                        // 옵션
                        options: {}
                        });
})
    </script>
</head>

<body>
<div class="container">
    <canvas id="myChart"></canvas>
</div>


<!-- 차트 -->

</body>
</html>
