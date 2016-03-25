<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Under Construction</title>
<style>
.menu li{
height: 45px;
}
.menu li.active {
        background-color: cadetblue;
        
    }
    
    .fixed-nav-bar {
  position: fixed;
  top: 95px;
  left: 0;
  right: 0;
  z-index: 9999;
  width: 100%;
  height: 45px;
  background-color: #00a087;
}
 ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: steelblue;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
.container
{   
    background: #fff url(Home.jpg) no-repeat center fixed;
    background-size:1375px 670px;
    background-position:center;
   
}
</style>
<script>
function validate()
{
	
var fld = document.getElementById("srch_fld").value.trim();	

if(fld=="")
	{
	alert("*Please enter Corp-Id or Domain-Id");
	return false;
	}
	return true;
}
</script>
</head>
<body  class="container" bgcolor="grey">
<%@include file="header.html" %>
<nav class="fixed-nav-bar">
<div id="div_id" class="div_class">
<ul class="menu">

<li><a  href="/Amdocs/login.jsp"  >Login</a></li>
<li><a  href="/Amdocs/register.jsp"  >SignUp</a></li>
<li><a  href="/Amdocs/underConstruction.jsp" >CUT Guide</a></li>
<li><a  href="/Amdocs/underConstruction.jsp" > About</a></li>
<li><a href="/Amdocs/underConstruction.jsp" >Contact Us</a></li>
<li class="nope" style="color: orange; padding-left:610px;padding-top: 5px"><img style="background-color: green" alt="search.jpg" width="60px" height="30px" src="/Amdocs/search.jpg"></li><li><form action="./SearchH" method="post" style="padding-top:10px " onsubmit="return validate();"><input style="background-color: aqua"  type="text" id="srch_fld" placeholder="Enter Corp-Id or domain-Id"><input type="submit"  value="Search" ></form></li>
        </ul></div>
</nav>
<img style="padding-top: 300px;padding-left: 550px"  alt="underConstruction" src="underConstruction.jpg">
<%@include file="footer.html" %> 
</body>
</html>