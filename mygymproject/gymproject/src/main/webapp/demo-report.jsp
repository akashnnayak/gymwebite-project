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
        google.charts.setOnLoadCallback(function() {
            drawCharts('January');
        });

        function drawCharts(month) {
            var months = ['January', 'February', 'March']; // Add more months here if needed

            // Loop through each month and set visibility of charts accordingly
            for (var i = 0; i < months.length; i++) {
                var chartDiv = document.getElementById(months[i].toLowerCase() + 'chart');
                if (months[i] === month) {
                    chartDiv.style.display = 'block';
                } else {
                    chartDiv.style.display = 'none';
                }
            }

            // Draw charts for the selected month
            var salesData = {
                'January': [
                    ['Month', 'Sales'],
                    ['January', 2000],
                    // Add more data for January here...
                ],
                'February': [
                    ['Month', 'Sales'],
                    ['February', 2500],
                    // Add more data for February here...
                ],
                'March': [
                    ['Month', 'Sales'],
                    ['March', 1800],
                    // Add more data for March here...
                ]
            };

            var profitLossData = {
                'January': [
                    ['Month', 'Profit', 'Loss'],
                    ['January', 500, -200],
                    // Add more data for January here...
                ],
                'February': [
                    ['Month', 'Profit', 'Loss'],
                    ['February', 600, -300],
                    // Add more data for February here...
                ],
                'March': [
                    ['Month', 'Profit', 'Loss'],
                    ['March', 400, -150],
                    // Add more data for March here...
                ]
            };

            var membershipData = {
                'January': [
                    ['Month', 'Memberships Purchased'],
                    ['January', 50],
                    // Add more data for January here...
                ],
                'February': [
                    ['Month', 'Memberships Purchased'],
                    ['February', 70],
                    // Add more data for February here...
                ],
                'March': [
                    ['Month', 'Memberships Purchased'],
                    ['March', 60],
                    // Add more data for March here...
                ]
            };

            drawPieChart(salesData[month]);
            drawBarChart(profitLossData[month]);
            drawLineChart(membershipData[month]);
        }

        function drawPieChart(data) {
            var data = google.visualization.arrayToDataTable(data);

            var options = {
                title: 'Monthly Sales Distribution',
                width: 400,
                height: 300
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }

        function drawBarChart(data) {
            var data = google.visualization.arrayToDataTable(data);

            var options = {
                title: 'Monthly Profit and Loss',
                bars: 'vertical',
                width: 400,
                height: 300
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('barchart'));
            chart.draw(data, options);
        }

        function drawLineChart(data) {
            var data = google.visualization.arrayToDataTable(data);

            var options = {
                title: 'Monthly Memberships Purchased',
                curveType: 'function',
                width: 800,
                height: 300
            };

            var chart = new google.visualization.LineChart(document.getElementById('linechart'));
            chart.draw(data, options);
        }

        // Event listener for dropdown menu change
        document.getElementById('monthSelect').addEventListener('change', function() {
            var selectedMonth = this.value;
            drawCharts(selectedMonth);
        });
    </script>
    <style>
        .chart-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .chart {
            margin: 10px;
        }
    </style>
</head>
<body>
    <h1>Monthly Sales Report</h1>
    <!-- Dropdown menu for selecting month -->
    <select id="monthSelect">
        <option value="January">January</option>
        <option value="February">February</option>
        <option value="March">March</option>
        <!-- Add more months here... -->
    </select>
    <div class="chart-container">
        <div id="januarychart" class="chart"></div>
        <div id="februarychart" class="chart"></div>
        <div id="marchchart" class="chart"></div>
    </div>
    <div>
        <!-- Display total products sold -->
        <h2>Total Products Sold</h2>
        <p>January: 100</p>
        <p>February: 120</p>
        <p>March: 90</p>
        <!-- Add more months here... -->
    </div>
</body>
</html>
