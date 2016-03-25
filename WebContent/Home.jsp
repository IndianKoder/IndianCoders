<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBtdC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
 
     
     
<style>


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
    position:fixed;
      left: 0;
      right: 0;
      top:125px;
    background: #fff url(start.jpg) no-repeat center; 
    background-size: 1500px 500px; 
}

 tr {
    tdst-style-type: none;
    border: 0;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: steelblue;    
}

td {
    float: left;
    border: 0;
    padding-left: 20px;

    color: steelblue;
    
}

a {
    background-color: steelblue;
    border: none;
    color: white;
   	padding-left:100px;
    text-decoration: none;
    margin: 2px 2px;
    cursor: pointer;
}
.fixed-nav-bar {
  position: fixed;
  top: 95px; 
  left: 0;
  right: 0;
  z-index: 9999;
  width: 150%;
  height: 30px;
  background-color: steelblue;
}
 

.protected {
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
input[type=button], input[type=submits], input[type=reset] {
    
    border: none;
    color: white;
    padding: 15px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
    background-color: steelblue;
}
 
</style>
<script>
function validate()
{
	
var fld = document.getElementById("srch_fld").value;	
if(fld=="")
	{
	alert("*Please enter Corp-Id or Domain-Id");
	return false;
	}
	return true;
}
function opens(){
	window.open("Documentation.pdf");
}
</script> 

</head>
<body >
<%@include file="header.html" %>



 
<div style="background-color:skyblue; width:1400px; height: 25px;">
 

<nav class="fixed-nav-bar">
<div>
<ul class="menu">
<li><a  href="/Amdocs/login.jsp"  >Login</a></li>
<li><a  href="/Amdocs/register.jsp"  >SignUp</a></li>
<li><input type="button" value="CUT Guide" onclick="opens();"></li>
<li><a  href="/Amdocs/underConstruction.jsp" > About</a></li>
<li><a href="/Amdocs/underConstruction.jsp" >Contact Us</a></li>

<li class="nope" style="color: orange; padding-left:610px;padding-top: 5px">
   <img style="background-color: green;border-radius:700px 10px ;" alt="search.jpg" width="60px" height="30px" src="/Amdocs/search.jpg"></li>
<li style="padding-left: 5px;"><form  action="./SearchH" method="post" style="padding-top:10px " onsubmit="return validate();">
<input id="srch_fld" style="background-color: aqua" name="Search_field" type="text" placeholder="Enter Corp-Id or domain-Id"><input type="submit"  value="Search"></form></li>
        </ul></div>
</nav>

</div>

 <div class="container" style="color: red; width:1400px; height: 500px;"> 
</div>

<%@include file="footer.html" %>
</body>
</html>
