<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>



<style>
.button
{
    display: inline-block;
    padding: 2em 2em 2em 2em;
    letter-spacing: 0.10em;
    margin-top: 2em;
    padding: 1em 1.5em;
    border: 2px solid #000 ;
    border-radius: 8px;
    text-decoration: none;
    color: #000000;
    font-family: 'Didact Gothic', sans-serif;

    font-weight: 600;
}


.button:hover{
    border: 2px dotted #000 ;
    opacity: 0.5;
}
input[type=button], input[type=submit], input[type=reset] {
    background-color: steelblue;
    border: none;
    color: white;
    padding: 4px 16px;
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
.Home{
    position: absolute;
   right:80px;
   top:100px;
  
       
}
.login{

    position: absolute;
    top: 200px;
   
    left: 500px;
}
.container
{   
    background: #fff url(Home.jpg) no-repeat center fixed;
    background-size:1375px 670px;
    background-position:center;
   
}
h1 {margin: 1em 0 0.75em;
	padding: 0 0 5px 0;
	color: #6B5344;
	font-weight: normal;
	position: relative;
	text-shadow: 0 8px 0 rgba(255,255,255,1);
	text-align:center;
	font-size: 70px;
	line-height: 40px;
	font-family: 'Carrois Gothic', sans-serif; }
	td{
	width:150px;
	}
	input[type=button], input[type=submit], input[type=reset] {
    background-color: steelblue;
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;

}

</style>
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<script>
$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
	$(document).ready(function() {
		 $('#RespMsg_id').html('');
	$('#btn').on('click',function (e){
		if(validate())
			{
			 $("#btn").attr("disabled", true);
    		 $("#btn").css('background-color','gray');
		 	var gid = $("#Gid_id").val();
		    var pwd = $("#Pwd_id").val();
		    var newRegUsers = $("#NewRegUsers_id").val();
		   
		   console.log("In Login.jsp: ",gid + pwd+newRegUsers);
		   $.ajax({
			    url: "LoginServlet",
			    type: 'GET',
			    data: {
			    	userid : gid,
			    	password : pwd,
			    	NewRegUsers : newRegUsers
			    },success: function (response) {
			    	
			    	 if(response.Msg=="Success"){
			    			
			    		 window.location = response.url;
		        	    
		            }
			    	 else {
			    		 $('#RespMsg_id').html('');
			    		 $('#RespMsg_id').append("*Invalid Credentials");
			    		 $("#btn").attr("disabled", false);
			    		 $("#btn").css('background-color','steelblue');
			    		 }
			    	 
			    }
			});
		   }
	});
});
if (top.location!= self.location) {
console.log("Top Location",top.location);
console.log("Content Location",self.location);
			top.location = self.location.href
		}
function validate()
{
	
	var name=document.getElementById("Gid_id").value;
	var pass=document.getElementById("Pwd_id").value;
	
	if(name==""||pass=="")
		{
		if(name=="")
		document.getElementById("user_id").innerHTML="<font color='red'>*</font>";
		else
			document.getElementById("user_id").innerHTML="";
		if(pass=="")
		{
			document.getElementById("pass_id").innerHTML="<font color='red'>*</font>";
			
		}
		else
			document.getElementById("pass_id").innerHTML="";
		return false;
		}
	else 
	{	
		
		
		return true;
	}
	
	
}
function clearf()
{
	var userid=document.getElementById("Gid_id").value;
	var password=document.getElementById("Pwd_id").value;
	document.getElementById("RespMsg_id").innerHTML="";
	if(userid!="")
		document.getElementById("user_id").innerHTML="";
	if(password!="")
		document.getElementById("pass_id").innerHTML="";
}



</script>
</head>
<style>
table#login_id 
{
    border-collapse:separate;
    border-spacing:0 15px;
}
</style>


<body class="container" bgcolor="grey">
<%@include file="header.html" %>
<div class="Home">
       
         <a href="Home.jsp" class="button">Home</a>               
    </div>


<%
String redirect = request.getParameter("AdminRedirect");

System.out.println("Redirect Admin to Registrations : "+redirect);
	%>


<div class="login">
<table align = "center" id="login_id" border="0">
			<tr><td align = "center">User ID  </td><td><input type = "text" placeholder="Enter your GId" name ="userid" onclick="clearf();" id="Gid_id" class="container1"></td>
			<td id="user_id"  ></td></tr>
			
			<tr><td align = "center">Password  </td><td><input type = "password" placeholder="Enter your Password" name ="password" onclick="clearf();" id="Pwd_id"></td>
				<td id="pass_id" ></td></tr>
				<tr>
			<td align="center" colspan="2" style="padding-left: 80px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="btn">Login</button> <a href="ForgotPassword.jsp">Forgot Password??</a> </td>
                        </tr> 
                 <tr><td>&nbsp;</td><td  style="color: red;font-size: 13pt;padding-left: 20px;"  id = "RespMsg_id"> </td></tr>
                        <input type="hidden" value="<%=redirect%>" name="NewRegUsers" id="NewRegUsers_id">
                        
</table>


 


</div>
<%@include file="footer.html" %> 
</body>
</html>