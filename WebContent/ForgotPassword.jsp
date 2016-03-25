<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<title>Forgot Password</title>
<script> 

$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
jQuery(document).ready(function() {
	
	$('#email_id').on('click',function (e){
		console.log("bcwbcbcwec");
		$('#RespMsg_id').html('');
	});
	$('#Reset_id').on('click',function (e){
		$('#RespMsg_id').html('');

	
	    var Email =$("#email_id").val(); 
	   
	    
	    $("#Reset_id").attr("disabled", true);
	    $("#Reset_id").css('background-color','gray');
	   console.log("In ForgotPassword.jsp On click of reset email id : ",Email);
	   $.ajax({
		    url: "UserResetPassword",
		    type: 'POST',
		    data: {
		    	
		    	EmailId: Email
		          
		           
		    },success: function (response) {

		            console.log("Response",response);

		        	    if(response.indexOf("Success")!=-1){
		            	$("#RespMsg_id").append("Verification request has been sent to Admin.");

		            }

		    	    	else if(response.indexOf("Usr-03")!=-1)
	            	{
		    	    		   $("#Reset_id").attr("disabled", false);
		    	    		   $("#Reset_id").css('background-color','steelblue');
		    	    		   
		            	
		            	$("#RespMsg_id").append("Not a Registered EmailId !!!");

		            	
	            	}
		    	    	else if(response.indexOf("Usr-04")!=-1)
		            	{
			    	    		   $("#Reset_id").attr("disabled", false);
			    	    		   $("#Reset_id").css('background-color','steelblue');
			    	    		   
			            	
			            	$("#RespMsg_id").append("Request Already Raised !!!");

			            	
		            	}

		            		else if(response.indexOf("Usr-02")!=-1||response==null)
		            		{
			            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");


		            		}
		            
		            
}
});
	   
});

});


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
	width:75px;
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
<table  style="padding-top: 250px;padding-left: 500px" >
 <tr ><td><label for="txtemail">Email:</label></td>
              <td > <input type="text" id="email_id" name="emp_email" 
                          placeholder="name@domain.com"/>
                       </td><td id="emaill" ></td></tr><tr><td>
                        </br></td></tr><tr><td colspan="2" align="center">
      
          <button class="submit" id="Reset_id" >  Reset  </button> </td></tr>
          </table> 

<h3 id="mand_id"></h3>       

<h2   id = "RespMsg_id" align="center"> </h2> 
<%@include file="footer.html" %> 
</body>
</html>