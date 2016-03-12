<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.LinkedList" %>
    <%@ page import="vote.Container" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Choice</title>
<link href="css/bootstrap.min.css" rel="stylesheet" /> 
<link href="css/style.css" rel="stylesheet" />
<style>
body {
	background-image: url("Silver-Blur-Background-Wallpaper.jpg");
}
</style>
</head>
<%
	request.setAttribute("elector", session.getAttribute("elector"));
%>
<body>
<div align="center"><h3>Welcome <b><i><%for(String str : (LinkedList<String>)session.getAttribute("name")){ %>
<%=str%> 
<%} %></i></b></h3>
<h3>Choose for which candidate you want to vote</h3>
</div>
<form action ="confirm" method="post">
 <div class="container">
         <h3>List of candidates</h3>
         <table class="table">
             <th>#</th>
             <th>Candidate Last Name</th>
             <th>Candidate First Name</th>
             <th>Candidate Middle Name</th>
             <th>Date of birth</th>
             <th>Place of birth</th>
             <th>Choice</th>
             <tbody>
             <%
             	for (Container candidate : (LinkedList<Container>)session.getAttribute("list")){
             %>
                   <tr>
                   <td><%=candidate.getID()%></td>
                   <td><%=candidate.getFirstName()%></td>
                   <td><%=candidate.getLastName()%></td>
                   <td><%=candidate.getMiddleName()%></td>
                   <td><%=candidate.getBirthDate()%></td>
                   <td><%=candidate.getLocation()%></td>
		           <td><div class="checkbox">
		                <label>
		                  <input type="radio" name=choose value=<%=Integer.toString(candidate.getID())%> >
		                </label>
		              </div></td>
                   </tr> 
             <%}%>
        </tbody>
        </table>
    </div>
    		<div class="col-md-1"></div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary">Submit your choice</button>
            </div>
       </form>
</body>
</html>