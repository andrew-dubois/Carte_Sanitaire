// JavaScript Document

(function(){
	google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
	google.setOnLoadCallback(drawChart2);
	google.setOnLoadCallback(drawChart3);
	google.setOnLoadCallback(drawVisualization);
	function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Nord',     11],
          ['Ouest',      2],
          ['Sud',  2],
          ['Sud\'est', 2],
          ['Centre',    7]
        ]);

        var options = {
          title: 'Liste des femmes enceintes par departement',
		  width:500,
		  height:400,
		  legend:{position:'center'}
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
	  
	 
	 function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Mois', 'Cas vu', 'Cas hospitalises'],
          ['Jan 2012',  200, 400],
          ['Fev 2012',  1170, 460],
          ['Mar 2012',  660,  298],
          ['Avr 2012',  400, 540]
        ]);

        var options = {
          title: 'Evolution mensuelle du cholera au niveau des zones d\'intervention',
          vAxis: {title: 'Mois',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
	  
	  function drawChart3() {
         var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: '',
		  height:300,
          hAxis: {title: 'Year', titleTextStyle: {color: 'blue'}}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
      }
	  
	  function drawVisualization() {
        var data = google.visualization.arrayToDataTable([
          ['Mon', 20, 28, 38, 45],
          ['Tue', 31, 38, 55, 66],
          ['Wed', 50, 55, 77, 80],
          ['Thu', 77, 77, 66, 50],
          ['Fri', 68, 66, 22, 15]
          // Treat first row as data as well.
        ], true);

        var options = {
          legend:'none',
		  height:300
        };

        var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div2'));
        chart.draw(data, options);
	  }
	 
	})();