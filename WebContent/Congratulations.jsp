<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Congratulations</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style>
body {
	background-image:
		url("Wallpaper-Abstract-Abstraction-Texture-Texture-Background-Bokeh-Blue1.jpg");
}
</style>
</head>
<body>
	<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
	<form action="statistic" method="post"
		style="margin-top: 100px; margin-left: 500px;">
		<h1>Thank you for voting!!!</h1>
		<br>
		<img src="Voted.png"><br> 
		<input type="submit" style="margin-left: 650px; margin-top: 150px;"	class="btn btn-warning btn-lg" value="Show current results"></input>
	</form>
	<form action="check" method="post"
		style="margin-left: 20px; margin-top: -45px">
		<input type="submit" class="btn btn-warning btn-lg" value="Back to start page"></input>
	</form>
</body>
</html>