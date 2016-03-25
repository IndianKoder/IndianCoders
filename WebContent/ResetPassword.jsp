<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<title>Insert title here</title>
<script> 

$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
jQuery(document).ready(function() {
	
	$('#newpwd_id').on('click',function (e){
		console.log("bcwbcbcwec");
		$('#RespMsg_id').html('');
	});
	$('#Submit_id').on('click',function (e){
		$('#RespMsg_id').html('');
	
		if(validate()){
	    var New_pwd =$("#newpwd_id").val(); 
	    var token=$("#token_id").val();
	   
	    
	    $("#Submit_id").attr("disabled", true);
	    $("#Submit_id").css('background-color','gray');
	   console.log("In ForgotPassword.jsp On click of reset email id : ",New_pwd,token);
	   $.ajax({
		    url: "UserUpdatePassword",
		    type: 'POST',
		    data: {
		    	
		    	Newpwd:  New_pwd,
		        Token: token  
		           
		    },success: function (response) {

		            console.log("Response",response);

		        	    if(response.indexOf("Success")!=-1){
		            	$("#RespMsg_id").append("Password Successfully resetted.");

		            }

		    	    	else if(response.indexOf("Usr-03")!=-1)
	            	{
		    	    		   $("#Submit_id").attr("disabled", false);
		    	    		   $("#Submit_id").css('background-color','steelblue');
		    	    		   
		            	
		            	$("#RespMsg_id").append("Already resetted password !!!");

		            	
	            	}
		    	    	

		            		else if(response.indexOf("Usr-02")!=-1||response==null)
		            		{
			            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");


		            		}
		            
		            
}
});
		}	   
});

});

function validate()
{
	
	var pass=document.getElementById("newpwd_id").value;
	var conf_pass=document.getElementById("cnewpwd_id").value;
	
	if(pass==""||conf_pass=="")
		{
		if(pass=="")
		document.getElementById("newpswd").innerHTML="<font color='red'>*</font>";
		else
			document.getElementById("newpswd").innerHTML="";
		if(conf_pass=="")
		{
			document.getElementById("cnewpswd").innerHTML="<font color='red'>*</font>";
			
		}
		else
			document.getElementById("cnewpswd").innerHTML="";
		return false;
		}
	else if(pass!=conf_pass)
	{	
		document.getElementById("cnewpswd").innerHTML="<font color='red'>Passwords doesnt match</font>";
	}
	else
		return true;
	
}
function clearf()
{
	var pass=document.getElementById("newpwd_id").value;
	var conf_pass=document.getElementById("cnewpwd_id").value;
	document.getElementById("RespMsg_id").innerHTML="";
	if(pass!="")
		document.getElementById("newpswd").innerHTML="";
	if(conf_pass!="")
		document.getElementById("cnewpswd").innerHTML="";
}

</script>
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


input[type=button], input[type=submit], input[type=reset] 
{
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
</style>
</head>
<body class="container" bgcolor="grey">
<%@include file="header.html" %>
<div class="Home">
       
         <a href="Home.jsp" class="button">Home</a>               
    </div>
<table border="0" style="padding-top: 250px;padding-left: 500px" >
 <tr ><td><label for="newpwd">New Password:</label></td>
              <td > <input type="password" id="newpwd_id" name="new_pwd" placeholder="Enter new password" onchange="clearf();"/>
                       </td><td id="newpswd" ></td></tr>
                       <tr><td>
                        </br></td></tr>
                  <tr ><td><label for="cnewpwd">Confirm Password:</label></td>   
                       <td > <input type="password" id="cnewpwd_id" name="cnew_pwd" placeholder="Re-enter password" onchange="clearf();"/>
                       </td><td  id="cnewpswd" ></td></tr><tr><td colspan="2" align="center" style="padding-top: 15px;">
      <input type="hidden" value=<%= request.getParameter("token") %> id="token_id"/>
          <button class="submit" id="Submit_id" >  Submit  </button> </td>
          
          </tr>
          </table> 

<h3 id="mand_id"></h3>       

<h1   id = "RespMsg_id" align="center"> </h1> 
<%@include file="footer.html" %> 
</body>
</html>