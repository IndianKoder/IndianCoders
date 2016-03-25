<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
        <title>Register</title>
        <style type="text/css">
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
       .container
{   
    background: #fff url(Home.jpg) no-repeat center fixed;
    background-size: cover;
   
}
.space{
width:200px;
}
.register{

    position: absolute;
    top: 150px;
   
    left: 500px;
}
.home{
    position: absolute;
   right:80px;
   top:80px;
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

button {
    background-color: steelblue;
    border: none;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}



</style>
    
   

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
	$('#Register_id').on('click',function (e){
		$('#RespMsg_id').html('');
if(validate()){
	 var Fname = $("#fname_id").val();
	    var Lname = $("#lname_id").val();
	    var gid = $("#gid_id").val();
	    var Email =$("#email_id").val(); 
	    var Pwd =$("#pwd_id").val();                    
	    var Cpwd  =$("#cpwd_id").val();
	    var rmemail=$("#rmemail_id").val();
	    
	    $("#Register_id").attr("disabled", true);
	    $("#Register_id").css('background-color','gray');
	   console.log("In register.jsp On click of register gid : ",gid +" Fname : ",Fname+" Lname : ",Lname+" Email : ",Email+" Pwd : ",Pwd);
	   $.ajax({
		    url: "UserRegistration",
		    type: 'POST',
		    data: {
		    	FirstName: Fname,
		           LastName : Lname,
		           Gid : gid,
		           EmailId : Email,
		           Password :  Pwd ,
		           RMEmailId :rmemail
		           
		    },success: function (response) {

		            console.log("Response",response);

		        	    if(response.indexOf("Success")!=-1){
		            	$("#RespMsg_id").append("Verification request has been sent to Admin.");

		            }

		    	    	else if(response.indexOf("Usr-01")!=-1)
	            	{
		    	    		   $("#Register_id").attr("disabled", false);
		    	    		   $("#Register_id").css('background-color','steelblue');
		    	    		   
		            	
		            	$("#RespMsg_id").append("EmailId Or Gid Already Exists !!!");

		            	
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


</script>
<script type="text/javascript">
function validate() {
	var pwd = document.getElementById("pwd_id").value;
	var conf_pwd = document.getElementById("cpwd_id").value;
    var fname=document.getElementById("fname_id").value;
    var lname=document.getElementById("lname_id").value;
    var gid=document.getElementById("gid_id").value;
    var email=document.getElementById("email_id").value;
  var rmemail=document.getElementById("rmemail_id").value;
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    var cgid=/^\d{3,8}$/;

    if(fname==""||lname==""||gid==""|| pwd==""||conf_pwd==""||email=="" || (!filter.test(email))||pwd.length<4 || conf_pwd.length<4||pwd!=conf_pwd||(!cgid.test(gid))||(!filter.test(rmemail)))
	{
    	document.getElementById("mand_id").innerHTML = "<font color=red>*Mandatory Field(s)";
console.log("1111");
if(fname=="")
{
document.getElementById("demo0").innerHTML = "<font color=red>*";
}
else 
{
	document.getElementById("demo0").innerHTML ="";

}
if(lname=="")
{
document.getElementById("demo2").innerHTML = "<font color=red>*";

}
else 
{
	document.getElementById("demo2").innerHTML ="";

}
if(gid=="")
{
document.getElementById("demo1").innerHTML = "<font color=red>*"


}
else 
{
	if ((!cgid.test(gid))) 
	 {

			document.getElementById("demo1").innerHTML = "<font color=red>*Please enter a valid gid";
			
			
	}


}


 if(email=="")
 {

 document.getElementById("demo3").innerHTML = "<font color=red>*"

 }else
 {
  if ((!filter.test(email))) 
  {

 		document.getElementById("demo3").innerHTML = "<font color=red>*Please enter a valid email";
 		
 		
 }
}
 
 if(rmemail=="")
 {

 document.getElementById("demo6").innerHTML = "<font color=red>*"

 }else
 {
  if ((!filter.test(rmemail))) 
  {

 		document.getElementById("demo6").innerHTML = "<font color=red>*Please enter a valid email";
 		
 		
 }
}
if(pwd==""||conf_pwd=="")
{
if(pwd=="")
{
document.getElementById("demo4").innerHTML = "<font color=red>*"

}
else 
{

document.getElementById("demo4").innerHTML ="";

}
if(conf_pwd=="")
{
document.getElementById("demo5").innerHTML = "<font color=red>*"

}
else
{

document.getElementById("demo5").innerHTML ="";

}}
else
{
if(pwd.length<4 && conf_pwd.length<4)
{
document.getElementById("demo4").innerHTML ="";
document.getElementById("demo4").innerHTML ="<font color=red>Atleast 4 characters!";
}
else if(pwd!=conf_pwd)
{
document.getElementById("demo4").innerHTML ="<font color=red>Passwords doesn't match";
    }



}

return false;
	}
    if(pwd==conf_pwd)
    {
    document.getElementById("demo4").innerHTML ="";

    }
    if ((cgid.test(gid))) 
	 {
	document.getElementById("demo1").innerHTML ="";
	 }
    if ((filter.test(email)))
	{

		document.getElementById("demo3").innerHTML ="";
	}
    if ((filter.test(rmemail)))
	{

		document.getElementById("demo6").innerHTML ="";
	}
    if(pwd==conf_pwd&&filter.test(email))
   
 return true;
}


function clearf()
{
	var pwd = document.getElementById("pwd_id").value;
	var conf_pwd = document.getElementById("cpwd_id").value;
	var email=document.getElementById("email_id").value;
	 var fname=document.getElementById("fname_id").value;
	    var lname=document.getElementById("lname_id").value;
	    var gid=document.getElementById("gid_id").value;
	    var rmemail=document.getElementById("rmemail_id").value;
	    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	    var cgid=/^\d{3,8}$/;
	    console.log("came to clear");
	 
	//  $("#RespMsg_id").html('');
	if(fname!="")
	document.getElementById("demo0").innerHTML ="";
	if(lname!="")
		document.getElementById("demo2").innerHTML ="";
	if(gid!="" && (cgid.test(gid)))
		document.getElementById("demo1").innerHTML ="";
	if(email!=""  && (filter.test(email)))
		document.getElementById("demo3").innerHTML ="";
	if(rmemail!="" && (filter.test(rmemail)) )
		document.getElementById("demo6").innerHTML ="";
	if(conf_pwd!="")
		document.getElementById("demo5").innerHTML ="";
	if(lname!=""&& gid!=""&&email!="" &&conf_pwd!=""&&rmemail!="")
	document.getElementById("mand_id").innerHTML = ""
	
}

   
    
 
</script>

</head>
        
     
     <body class="container">   
     <%@include file="header.html" %>
         <div class="home">
       
         <a href="Home.jsp" class="button">Home</a>               
    </div>
       
        <div align="center" class="register">
       
              
            
            <table border="0"  width="600"  >
                <tr>
                     <td><label for="txtName">FirstName:</label></td><td>
                    <input type="text" name="fname"id="fname_id" onchange="clearf();" placeholder="Enter your first Name "/>
                               
          
                    </td><td id="demo0"></td></tr>
                    <tr>
                    <tr><td></br></td></tr>
                     <td><label for="txtName">LastName:</label></td>
                    <td><input type="text" name="lname"id="lname_id" onchange="clearf();" placeholder="Enter your last Name "/>
                                                      
                    </td><td id="demo2" class="space"></td></tr>
<tr><td></br></td></tr>
               <tr> <td><label for="txtid">GId:</label></td>
                   <td><input type="text" id="gid_id" name="gid" onchange="clearf();" placeholder="Eg.123456"
            
           
           /></td></td><td id="demo1"></td></tr>
          <tr><td></br></td></tr>     
       <tr ><td><label for="txtemail">Email:</label></td>
              <td > <input type="text" id="email_id" name="emp_email" onchange="clearf();"
                          placeholder="name@domain.com"/>
                       </td><td id="demo3" class="space"></td></tr>
       <tr><td></br></td></tr>
       <tr ><td><label for="rmemail">RM Email:</label></td>
              <td > <input type="text" id="rmemail_id" name="rm_email" onchange="clearf();"
                          placeholder="name@domain.com"/>
                       </td><td id="demo6" class="space"></td></tr>
       <tr><td></br></td></tr>
      <tr>  <td><label for="txtpwd">Password:</label></td>
     <td> <input type="password" id="pwd_id"name="password"  onchange="clearf();" placeholder="enter password"/></td><td id="demo4"></tr>
      <tr><td></br></td></tr>
        <tr><td><label for="txtcpwd"> Confirm Password:</label></td>
       <td> <input type="password" id="cpwd_id" name="cpassword" onchange="clearf();" placeholder="re-enter password" /></td><td id="demo5"></tr>
       
<tr><td></br></td></tr>
      </br></br><tr><td colspan="2" align="center">
      
          <button class="submit" id="Register_id" >  Register  </button> </td></tr>
          </table> 
          
         
 <h3 id="mand_id"></h3>       

<h2   id = "RespMsg_id" align="left"> </h2> 
 </div>
        <br>
        <br>
        <%@include file="footer.html" %> 
    </body>
</html>
