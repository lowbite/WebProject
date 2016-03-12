<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Set" %>
    <%@ page import="java.util.Iterator" %>
    <%@ page import="java.util.Map" %>
    <%@ page import="java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style>
body {
	background-image: url("Silver-Blur-Background-Wallpaper.jpg");
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Statistic</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      <%HashMap<String,Integer> map= (HashMap<String, Integer>)session.getAttribute("statistic");
      	Set set = map.entrySet();
      	Iterator i = set.iterator();
      %>
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        /* var data = google.visualization.DataTable();
        data.addColumn('string', 'Candidate Name');
        data.addColumn('number', 'Votes');
        data.addRows(['Kuchma', 7],['Yanukovich', 15]); */
        var data = google.visualization.arrayToDataTable([
	        ['Candidate Name', 'Votes'],
	        <% while(i.hasNext()) {
		        Map.Entry stat = (Map.Entry)i.next();
		        %>
		        ['<%= stat.getKey()%>', <%= stat.getValue()%>],
	        <%}%>
	        ]);
          
        var options = {
          title: '',
          backgroundColor: '#F4F4F5',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<h1 align="center" color='blue'>Previous results</h1>
	<div id="piechart_3d" style="width: 900px; height: 500px; margin-top: 50px; margin-left: 200px" ></div>
	<form action="check" method="post"
		style="margin-left: 20px; margin-top: 10px">
		<input type="submit" class="btn btn-warning btn-lg" value="Back to start page"></input>
	</form>
</body>
</html>