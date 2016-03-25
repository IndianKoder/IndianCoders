<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Menu</title>
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
  $('.nope').removeClass('active');
}
	jQuery(document).ready(function() {
		
	    $(".menu li").click(make_button_active);
		
	<%
	System.out.println("In AdminMenu.jsp value of link set : "+request.getParameter("link"));
String link = (String)(request.getParameter("link"));
if(link!=null && link!="")
{

	System.out.println("In AdminMenu.jsp On click of new user registration emailLink");
	
String str =(String)(session.getAttribute("username"));
if(str!=null && str.equals("admin"))
		{
	
	System.out.println("In AdminMenu.jsp Admin Session not expired");
	%>
	var site = 'http://192.168.0.113:8090/Amdocs/ShowRegistrations.jsp';
	document.getElementById('iframe_id').src = site;
	<%
		}
else
{
	%>
	console.log("Admin Session expired");
	window.location='http://172.27.49.124:8090/Amdocs/login.jsp?AdminRedirect=true';

	
	<%
}
}
%>
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
    padding: 10px 16px;
    text-decoration: none;
}

.container
{   
    background: #fff url(Home.jpg) no-repeat center;
   background-size: cover;
   
}
.welcome{
 position: absolute;
   right:80px;
   top:50px;

}
input[type=button], input[type=submits], input[type=reset] {
    
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}



button {
   
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
        background-color:cadetblue;
    }
    
.fixed-nav-bar {
  position: fixed;
  top: 95px;
  left: 0;
  right: 0;
  z-index: 9999;
  width: 100%;
  height: 45px;
 
}
.menu #nope{
padding-left: 5px;

}
 </style>

</head>

<body class="container">

<%@include file="header.html" %>
<nav class="fixed-nav-bar">
  <div id="div_id" class="div_class" style=" width:1400px; height: 25px; ">

<ul class="menu">
<li ><a href="/Amdocs/AddCorp.jsp" target="iframe_user" >Add Corp</a></li>
<li ><a href="/Amdocs/DeleteCorp.jsp" target="iframe_user" >Delete Corp</a></li>
<li ><a href="/Amdocs/ShowCorp.jsp" target="iframe_user" >Show Corp</a></li>
<li ><a href="/Amdocs/EditCorp.jsp" target="iframe_user" >Update Corp</a></li>
<li ><a href="/Amdocs/PendingReqCorp.jsp" target="iframe_user" >Corp Requests</a></li>
<li ><a href="/Amdocs/ShowRegistrations.jsp" target="iframe_user" >Registrations</a></li>
<li ><a href="/Amdocs/logout.jsp"  >Logout</a></li>
<li  style="color: orange; padding-left:300px;padding-top: 5px">
   <img style="background-color: green;border-radius:700px 10px ;" alt="search.jpg" width="60px" height="30px" src="/Amdocs/search.jpg"></li>
<li id="nope"><form  target="iframe_user" action="./Search" method="post" style="padding-top:10px " onsubmit="return validate();">
<input id="srch_fld" style="background-color: aqua" name="Search_fieldA" onclick="" type="text" placeholder="Enter Corp-Id or domain-Id"><input type="submit"  value="Search"></form></li>
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