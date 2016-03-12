<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Sign In</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style>
body {
	background-image: url("login-background.jpg");
}
</style>
</head>
<body>
	<%if (session.getAttribute("error") == "voted") {
		session.setAttribute("error",null);
	%>
		<div class="col-sm-offset-5 col-sm-4" style="margin-top: -100px;">
			<font color="red"><h3>You have already voted!</h3></font>
		</div>
	<%}else if (session.getAttribute("error") == "wrong") {
		session.setAttribute("error",null);%>
		<div class="col-sm-offset-5 col-sm-4" style="margin-top: -100px;">
			<font color="red"><h3>Wrong ID or secret key!</h3></font>
		</div>
	<%} %>
	<form class="form-horizontal" style="margin-top: 200px;" role="form" action="check"
		method="post">
		<div class="form-group">
			<label class="control-label col-sm-5" for="id">ID:</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="Enter your ID number">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-5" for="key">Secret key:</label>
			<div class="col-sm-3">
				<input type="password" class="form-control" id="key" name="key"
					placeholder="Enter secret key">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-4">
				<button type="submit" class="btn btn-primary">Sign in</button>
			</div>
		</div>
	</form>
	<form class="form" role="form" action="statistic" method="post">
		<div class="form-group">
			<div class="col-sm-offset-5 col-sm-4">
				<button type="submit" class="btn btn-info">Statistic</button>
			</div>
		</div>
	</form>
</body>
</html>