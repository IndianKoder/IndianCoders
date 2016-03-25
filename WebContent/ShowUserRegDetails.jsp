<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>


<script>
$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
	jQuery(document).ready(function() {
		$('#Accept_id').on('click',function (e){
			 $("#Accept_id").attr("disabled", true);
			 $("#Reject_id").attr("disabled", true);
			 $("#Accept_id").css('background-color','gray');
 	    	$("#Reject_id").css('background-color','gray');
		
		    var gid =$("#Gid_id").val();                                       
		    var reqTime =$("#RequestedTime_id").val();
		    var emailId =$("#EmailId_id").val();
		    var fname =$("#FirstName_id").val();
		    var lname =$("#LastName_id").val();
		    var rmemailId =$("#RMEmail_id").val();
		    var status = "Accept";

		   console.log("In ShowUserRegDetails.jsp On Admin Accept data to Servlet  Gid : ",gid+" email : ",emailId);
		   $.ajax({
			    url: "AdminRegResponse",
			    type: 'POST',
			    data: {
			           Gid : gid,
			           ReqTime:reqTime,
			           EmailId : emailId,
			           RMEmailId : rmemailId,
			           FirstName : fname ,
			           LastName: lname,
			           Status : status
			           
			    },success: function (response) {
			            console.log("Response From AdminRegResponse Servlet : ",response);

			        	    if(response.indexOf("Success")!=-1){
			            	$("#RespMsg_id").append("Successfully Verified User !!!");

			            }
			            		else if(response.indexOf("Usr-02")!=-1||response==null||response.isEmpty())
			            		{
				            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");
				            	$("#Accept_id").attr("disabled", false);
					   			 $("#Reject_id").attr("disabled", false);
					   			 $("#Accept_id").css('background-color','steelblue');
					    	    	$("#Reject_id").css('background-color','steelblue');

			            		}
			            
			            
	 }
	});
		});
		$('#Reject_id').on('click',function (e){
			 $("#Accept_id").attr("disabled", true);
			 $("#Reject_id").attr("disabled", true);
			 $("#Accept_id").css('background-color','gray');
 	    	$("#Reject_id").css('background-color','gray');
			
			    var gid =$("#Gid_id").val();                                       
			    var reqTime =$("#RequestedTime_id").val();
			    var emailId =$("#EmailId_id").val();
			    var fname =$("#FirstName_id").val();
			    var lname =$("#LastName_id").val();
			    var rmemailId =$("#RMEmail_id").val();
			    var status = "Reject";

			   console.log("In ShowUserRegDetails.jsp On Admin REJECT data to Servlet  Gid : ",gid+" email : ",emailId);
			   $.ajax({
				    url: "AdminRegResponse",
				    type: 'POST',
				    data: {
				           Gid : gid,
				           ReqTime:reqTime,
				           EmailId : emailId,
				           RMEmailId : rmemailId,
				           FirstName : fname ,
				           LastName: lname,
				           Status : status
				           
				    },success: function (response) {
				            console.log("Response From AdminRegResponse Servlet : ",response);

				        	    if(response.indexOf("Success")!=-1){
				            	$("#RespMsg_id").append("Successfully Rejected User !!!");

				            }
				            		else if(response.indexOf("Usr-02")!=-1||response==null||response.isEmpty())
				            		{
					            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");
					            	$("#Accept_id").attr("disabled", false);
					   			 $("#Reject_id").attr("disabled", false);
					   			 $("#Accept_id").css('background-color','steelblue');
					    	    	$("#Reject_id").css('background-color','steelblue');


				            		}
				            
				            
		 }
		});
			});
		
	
	});
	</script>
</head>
<style>
td
{
    padding:0 40px 0 40px;
   
}
table#Table_id 
{
    border-collapse:separate;
    border-spacing:0 15px;
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
<body class="protected">
</br></br></br>
<div align="center">

<table id="Table_id" >



      <tr><td align="right"> Gid : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value= "<%=request.getParameter("gid")%>" disabled="true" id="Gid_id" size="35"></td>
 <td align="right"> EmailId : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("emailId")%>" disabled="true" id="EmailId_id"size="35"></td></tr>
 <tr><td align="right">FirstName :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("firstName")%>" disabled="true" id="FirstName_id"size="35"></td>
 <td align="right"> RMEmailId :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("RMEmailId")%>" disabled="true" id="RMEmail_id" size="35"></td></tr>
 <tr><td align="right" >RequestedTime :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("time")%>" disabled="true" id="RequestedTime_id" size="35"></td>
<td align="right"> LastName :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("lastName")%>" disabled="true" id="LastName_id" size="35"></td></tr>


</table>
</div></br></br></br>

<div align="center">
<input type="button"  id="Accept_id" value="  ACCEPT  "> &nbsp;&nbsp;<input type="button"  id="Reject_id" value="  REJECT  "></a>
</div>
<div align="center" class="RespMsgDiv_id">

<h2   id = "RespMsg_id"> </h2> &nbsp;&nbsp; 
 <a href="/Amdocs/ShowRegistrations.jsp" id="RespHrefPenReq_id" ></a>

</div>
</body>
</html>