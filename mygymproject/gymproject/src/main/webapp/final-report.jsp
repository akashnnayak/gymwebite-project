<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Final Report</title>
    <!-- Include Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
            drawPieChart();
            drawBarChart();
            drawLineChart();
        }

        function drawPieChart() {
            var salesData = [
                ['Month', 'Sales'],
                ['January', 2000],
                ['February', 2500],
                ['March', 1800]
                // Add more months here...
            ];

            var data = google.visualization.arrayToDataTable(salesData);

            var options = {
                title: 'Monthly Sales Distribution',
                width: 400,
                height: 300
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }

        function drawBarChart() {
            var profitLossData = [
                ['Month', 'Profit', 'Loss'],
                ['January', 500, -200],
                ['February', 600, -300],
                ['March', 400, -150]
                // Add more months here...
            ];

            var data = google.visualization.arrayToDataTable(profitLossData);

            var options = {
                title: 'Monthly Profit and Loss',
                bars: 'vertical',
                width: 400,
                height: 300
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('barchart'));
            chart.draw(data, options);
        }

        function drawLineChart() {
            var membershipData = [
                ['Month', 'Memberships Purchased'],
                ['January', 50],
                ['February', 70],
                ['March', 60]
                // Add more months here...
            ];

            var data = google.visualization.arrayToDataTable(membershipData);

            var options = {
                title: 'Monthly Memberships Purchased',
                curveType: 'function',
                width: 800,
                height: 300
            };

            var chart = new google.visualization.LineChart(document.getElementById('linechart'));
            chart.draw(data, options);
        }
    </script>
    <style>
    * {
   
    font-family: 'Poppins', sans-serif;
    box-sizing: border-box;
    outline: none;
}
        .chart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .chart {
            margin: 10px;
            margin-top:50px;
        }
        .navbar {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #1f2125;
    overflow: hidden;
    z-index: 1000;
    transition: top 0.3s;
}

.navbar a {
    float: right;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
}

.navbar a:hover {
    background-color: #00ff34;
    color: black;
}

.navbar a.active {
    background-color: #00ff34;
    color: black;
}
    </style>
</head>
<body>
    <div class="navbar" id="navbar">
    <a href="admin.jsp">Dashboard</a>
    <a href="mems-form.jsp">Update Membership</a>
    <a href="deleteUser">Users</a>
    <a href="deleteTrainer">Trainers</a>
    <a href="deleteFreeClass">Classes</a>
    <a href="final-report.jsp">Reports</a>
</div>
    
    <div class="chart-container">
  
        <div id="piechart" class="chart"></div>
      
        <div id="barchart" class="chart"></div>
  
        <div id="linechart" class="chart"></div>
    </div>
    <div>
       
    </div>
</body>
</html>
