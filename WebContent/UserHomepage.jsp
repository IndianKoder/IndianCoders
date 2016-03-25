<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home Page</title>
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<script>
$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
	var make_button_active = function()
{
  //Get item siblings
  var siblings =($(this).siblings());

  //Remove active class on all buttons
  siblings.each(function (index)
    {
      $(this).removeClass('active');
    }
  )


  //Add the clicked button class
  $(this).addClass('active');
$(".nope").removeClass('active');
$(".menu #nopes").removeClass('active');
}
	jQuery(document).ready(function() {

		    $(".menu li").click(make_button_active);
	
function dosubmits(pageUrl)
{
	location.href=pageUrl;
}
 });
	
	
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
 </script>
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
    background: #fff url(Home.jpg) no-repeat center fixed;
    background-size: cover;
   
}
.welcome{
 position: absolute;
   right:80px;
   top:50px;

}
input[type=button], input[type=submits], input[type=reset] {
    background-color: steelblue;
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}



button {
    background-color: steelblue;
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
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
.protected {
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
 input,textarea{
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
 </style>
 

</head>

<body class="container">
<%@include file="header.html" %>

<nav class="fixed-nav-bar">
<div id="div_id" class="div_class">
<ul class="menu">

<!--  <li><a  href="/Amdocs/underConstructionA.jsp" target="iframe_user" >KT Login</a></li>
<li><a  href="/Amdocs/underConstructionA.jsp" target="iframe_user" >Amdocs</a></li>-->
<li><a  href="/Amdocs/UserMenu.jsp" target="iframe_user" > Corps</a></li>
<li><a  href="/Amdocs/UserCorps.jsp" target="iframe_user" > My Corps</a></li>
<li><a href="/Amdocs/logout.jsp" >Logout</a></li>
<li id="nopes" style="color: orange; padding-left:810px;padding-top: 5px"><img style="background-color: green;border-radius:700px 10px ;" alt="search.jpg" width="60px" height="30px" src="/Amdocs/search.jpg"></li><li><form target="iframe_user" action="./Search" method="post" style="padding-top:10px " onsubmit="return validate();"><input style="background-color: aqua" name="Search_fieldU" type="text" placeholder="Enter Corp-Id or domain-Id"><input type="submit"  value="Search"></form></li>

        </ul></div>
</nav>
<!--  <table  style="padding-top: 120px;position: fixed;">
<tr><td class="nope" style="color: lime; font-size: 120%;padding-left: 550px"><%
        String username=(String)(session.getAttribute("username"));
        
        out.println("<h3>Welcome "+username+"</h3>");
        %>
        </td></tr>
</table>-->
<iframe width="100%" height="600px"  name="iframe_user" id="iframe_id" style="border:none;padding-top: 150px;"></iframe>

</br></br></br>
<%@include file="footer.html" %> 
</body>
</html>