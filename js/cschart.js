var dataSource = [
    { country: "Russia", area: 12 },
    { country: "Canada", area: 7 },
    { country: "USA", area: 7 },
    { country: "China", area: 7 },
    { country: "Brazil", area: 6 },
    { country: "Australia", area: 5 },
    { country: "India", area: 2 },
    { country: "Others", area: 55 }
];
$(function () {
	$("#chartContainer").dxPieChart({
		
		size:{ 
        width: 300
    },
    dataSource: dataSource,
    series: [
        {
            argumentField: "country",
            valueField: "area",
            label:{
                visible: true,
                connector:{
                    visible:true,           
                    width: 1
                }
            }
        }
    ],
    title: "Area of Countries"
		
		});
	var pieChart = $("#chartContainer").dxPieChart("instance");
	pieChart.option({
            legend: { visible:false}
        });
})
