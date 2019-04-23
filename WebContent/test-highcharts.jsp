<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Insert title here</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
</head>
<body>  

        <div id="container" style="min-width:400px;height:400px"></div>
        
        
        
        
        
        
        <!-- jQuery 2.2.3 -->
		<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
		<!-- jquery UI -->
		<script src="plugins/jQueryUI/jquery-ui.min.js"></script>
		<!-- Bootstrap 3.3.7 -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
		<!--highcharts -->
		<script src="plugins/highcharts/highcharts.js"></script>
		<script src="plugins/highcharts/highcharts-more.js"></script>
		<script src="plugins/highcharts/modules/exporting.js"></script>
		<script>
		/*
		Highcharts图表控件是目前使用最为广泛的图表控件。本文将从零开始逐步为你介绍Highcharts图表控件。通过本文，你将学会如何配置Highcharts以及动态生成Highchart图表。
							参考：http://www.cnblogs.com/liuhaorain/archive/2012/01/24/2311352.html
								http://www.hcharts.cn/
		参数说明：
						chart：	关于图表区和图形区的参数及一般图表通用参数。
								
						
						credits：版权信息：Highcharts在图表的右下方放置的版权信息及链
								enabled：是否显示版权信息，默认为true
								href：版权信息点击之后指向的URL(设置自己版权信息地址时记得加“http://“)
								text：显示的版权信息文字
								position：文字显示位置。支持的属性有align(左右对齐),verticalAlign(上下对齐), x(x轴偏移量), y(y轴偏移量)
								style：版权信息标签的CSS样式
						title:	标题：包括即标题和副标题，其中副标题为非必须的
								text：标题的文字
								align：文字水平对齐方式，有left、center、right可选
								verticalAlign：文字垂直对齐方式，有top、middle、bottom可选
								useHTML：是否解析html标签，设置解析后，可以使用例如a等html标签
								floating：是否浮动，设置浮动后，标题将不占用图表区位置
								margin：标题和图表区的间隔，当有副标题时，表示标题和副标题之间的间隔
								style：文字样式，可以设置文字颜色、字体、字号，注意和css有略微的不同，例如font-size用fontSize、font-family用fontFamily表示
								x：相对于水平对齐的偏移量，可以是负数，单位是px
								y:相对于垂直对齐的偏移量，可以使负数，单位是px
						xAxis和yAxis: 	坐标轴：包括x轴和y轴。多个不同的数据列可共用同一个X轴或Y轴，当然，还可以有两个X轴或Y轴，分别显示在图表的上下或左右。
											enabled：是否启用Labels。x，y轴默认值都是true，如果想禁用（或不显示）Labels，设置该属性为false即可。
											Formatter：标签格式化函数。
											坐标轴中，可以通过Type指定坐标轴类型，有linear、logarithmic、datetime、category可选
						tooltip:	数据点提示框：当鼠标滑过某点时，以框的形式提示改点的数据，比如该点的值，数据单位等
					    series:	数据列：图表上一个或多个数据系列，比如图表中的一条曲线，一个柱形
								type:
									line:直线图;spline:曲线图;area:面积图;areaspline:曲线面积图;arearange:面积范围图;
									areasplinerange:曲线面积范围图;column:柱状图;columnrange:柱状范围图;bar:条形图;
									pie:饼图;scatter:散点图;boxplot:箱线图;bubble:气泡图;errorbar:误差线图;funnel:漏斗图;
									gauge:仪表图;waterfall:瀑布图;polar:雷达图;pyramid:金字塔;
											http://www.hcharts.cn/api/index.php
							
							
		需要加载 jquery.min.js; highcharts.js
		
		*/
		$(function(){
		    $('#container').highcharts({
		        chart:{
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false,
		            marginTop: 40,	//上边距，单位PX
		            marginLeft: 40,
		            marginRight: 40,
		            marginBottom: 40   //底边距，单位PX
		        },
		        title:{
		            text: '2014 某网站各浏览器浏览量占比',
		            align: 'center'
		        },
		        tooltip: {
		            headerFormat: '{series.name}<br>',
		            pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        credits:{
		        	enabled:false
		        },
		        plotOptions:{
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    }
		                }
		            }
		        },
		        series: [{
		            type: 'pie',
		            name: '浏览器访问量占比',
		            data: [
		                ['Firefox',   45.0],
		                ['IE',       26.8],
		                {
		                    name: 'Chrome',
		                    y: 12.8,
		                    sliced: true,
		                    selected: true
		                },
		                ['Safari',    8.5],
		                ['Opera',     6.2],
		                ['其他',   0.7]
		            ]
		        }]
		    });
		});

		</script>
</body>
</html>