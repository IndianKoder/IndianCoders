<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {
	var count=0;
	$('#Accept_id').on('click',function (e){
		if(($('#Reason_id').val().trim().length > 0)){
			
			      if(($('#Reason_id').val().trim().length <250)){
			$("#Reason_msg").hide();
			$("#Accept_id").attr("disabled", true);
			$("#Reject_id").attr("disabled", true);
	    	$("#Accept_id").css('background-color','gray');
	    	$("#Reject_id").css('background-color','gray');
		
		    var corp =$("#Corp_id").val();                                       
		    var reqTime =$("#ReqTime_id").val();
		    var reqBy =$("#ReqUser_id").val();
		    var reason =$("#Reason_id").val();
		    var gid =$("#Gid_id").val();
		    var status = "Accept";

		   console.log("On Admin Accept data to Servlet : ",corp + reqTime + reqBy+reason);
		    $("#Reason_id").attr("disabled", true);
		   $.ajax({
			    url: "AdminResponse",
			    type: 'POST',
			    data: {
			           Corp : corp,
			           ReqTime:reqTime,
			           Status : status,
			           ReqBy : reqBy ,
			           Reason:reason,
			           Gid : gid
			           
			    },success: function (response) {
			            console.log("Response From AdminResponse Servlet : ",response);

			        	    if(response.indexOf("Success")!=-1){
			            	$("#RespMsg_id").append("Successfully Processed Request !!!");

			            }
			    	    	else if(response.indexOf("Amd-08")!=-1)
		            	{
			            	
			            	$("#RespMsg_id").append("Unable To Allocate !!!");
			           
			            	
		            	}
		            
			            		else if(response.indexOf("Amd-02")!=-1||response==null||response.isEmpty())
			            		{
				            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");
				            	$("#Accept_id").attr("disabled", false);
				    			$("#Reject_id").attr("disabled", false);
				    	    	$("#Accept_id").css('background-color','steelblue');
				    	    	$("#Reject_id").css('background-color','steelblue');


			            		}
			            
			            
	 }
			    
	}
		   );}
			      else{
			  		console.log("cccccccccccc");
			  			$("#Reason_msg").html('');
			  			$("#Reason_msg").append("*Max allowed characters 250");
			  		}
			  		}
		else
		{
		
		if(count<=0){
			count++;
		$("#Reason_msg").append("*Mandatory");
		}
		}	
		   });
	
	$('#Reject_id').on('click',function (e){
		console.log("on click");
		if(($('#Reason_id').val().trim().length > 0)){
			   if(($('#Reason_id').val().trim().length <250)){
			
			$("#Accept_id").attr("disabled", true);
			$("#Reject_id").attr("disabled", true);
	    	$("#Accept_id").css('background-color','gray');
	    	$("#Reject_id").css('background-color','gray');
		
		    var corp =$("#Corp_id").val();                                       
		    var reqTime =$("#ReqTime_id").val();
		    var reqBy =$("#ReqUser_id").val();
		    var reason =$("#Reason_id").val();
		    var gid =$("#Gid_id").val();

		    var status = "Reject";

		   console.log("On Admin Reject data to Servlet : ",corp + reqTime + reqBy+reason);
		
		   $.ajax({
			    url: "AdminResponse",
			    type: 'POST',
			    data: {
			           Corp : corp,
			           ReqTime:reqTime,
			           Status : status,
			           ReqBy : reqBy ,
			           Reason:reason ,
			           Gid:gid
			           
			    },success: function (response) {
			            console.log("Response From AdminResponse Servlet : ",response);

			        	    if(response.indexOf("Success")!=-1){
			        	    	
			            	$("#RespMsg_id").append("Successfully Rejected Request !!!");
			            }
			    	    	else if(response.indexOf("Amd-08")!=-1)
		            	{
			            	
			            	$("#RespMsg_id").append("Unable To Allocate !!!");
			            			            	
		            	}
		            
			            //	else if(response.contains("Amd-02")||response==null||response.isEmpty())
			            		else if(response.indexOf("Amd-02")!=-1||response==null||response.isEmpty())
			            		{
				            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");
				            	$("#Accept_id").attr("disabled", false);
				    			$("#Reject_id").attr("disabled", false);
				    	    	$("#Accept_id").css('background-color','steelblue');
				    	    	$("#Reject_id").css('background-color','steelblue');

			            		}
			            
			            
	 }
	});}
		else{
	  		console.log("cccccccccccc");
	  			$("#Reason_msg").html('');
	  			$("#Reason_msg").append("*Max allowed characters 250");
	  		}
	  		}
		else
			{
			
			console.log("kkkkkkkkkkk : ");
			if(count<=0){
				count++;
			$("#Reason_msg").append("*Mandatory");
			}
			}		
		});
	
	});


</script>
<title>Insert title here</title>
</head>
<style>
td
{
    padding:0 20px 0 20px;
   
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
 input{
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
</style>
<body class="protected">

<div align="center">

<table id="Table_id" >

<tr><td align="right"> Corp : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value= "<%=request.getParameter("corp")%>" disabled="true" id="Corp_id"size="35"></td>
 <td align="right"> Version : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("version")%>" disabled="true" id="Version_id"size="35"></td></tr>
 <tr><td align="right">Environment :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("env")%>" disabled="true" id="Environment_id"size="35"></td>
 <td align="right"> OraclePassword :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oraclePass")%>" disabled="true" id="OraclePassword_id"size="35"></td></tr>
 <tr><td align="right" >Script :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("script")%>" disabled="true" id="Script_id"size="35"></td>
 <td align="right"> OracleMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oracleMac")%>" disabled="true" id="OracleMachine_id"size="35"></td></tr>
 <tr><td align="right">OracleInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oracleIns")%>" disabled="true"  id="OracleInstance_id"size="35"></td>
 <td align="right"> TuxedoInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("tuxIns")%>" disabled="true"  id="TuxedoInstance_id"size="35"></td></tr>
 <tr><td align="right">TuxedoMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("tuxMac")%>" disabled="true" id="TuxedoMachine_id"size="35"></td>
 <td align="right"> EnterpriseAcc :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("enterpriseAcc")%>" disabled="true" id="EnterpriseAcc_id"size="35"></td></tr>
 <tr><td align="right">WlsVersion :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("wlsVer")%>" disabled="true" id="WlsVersion_id"size="35"></td>
 <td align="right"> WlsInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("wlsIns")%>" disabled="true" id="WlsInstance_id"size="35"></td></tr>
 <tr><td align="right">Notes : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("notes")%>" disabled="true" id="Notes_id"size="35"></td>
 <td align="right"> CorpOwner : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("corpOwner")%>" disabled="true" id="CorpOwner_id"size="35"></td></tr>
<tr> <td align="right"> RequestedBy : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("reqUser")%>" disabled="true" id="ReqUser_id"size="35"></td>
<td align="right"> RequestedTime : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("time")%>" disabled="true" id="ReqTime_id"size="35"></td></tr>
<tr><td align="right"> Purpose : &nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="2" cols="35" id="Purpose_id"  disabled="true"> <%=request.getParameter("purpose")%></textarea> </td>

 <td align="right" > Reason : &nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="2" cols="35" id="Reason_id"> </textarea></td><td  id="Reason_msg" style="color: red;"></td></tr>
<tr><td align="right">Gid : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("gid")%>" disabled="true" id="Gid_id"size="35"></td>


</table>
</div>

<div align="center">
<input type="button"  id="Accept_id" value="  ACCEPT  "> &nbsp;&nbsp;<input type="button"  id="Reject_id" value="  REJECT  "></a>
</div>
<div align="center" class="RespMsgDiv_id">

<h2   id = "RespMsg_id"> </h2> &nbsp;&nbsp; 
 <a href="/Amdocs/PendingReqCorp.jsp" id="RespHrefPenReq_id" ></a>

</div>

</body>
</html>