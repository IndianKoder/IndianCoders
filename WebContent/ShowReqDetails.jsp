<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<title>ShowReqDetails</title>
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

<script>
$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
	<% String corp = request.getParameter("corp");
       String version =request.getParameter("version");
       String env =request.getParameter("environment");
       String corpType = request.getParameter("corpType");
       String hrefUrl ="/Amdocs/UserMenu.jsp?corp="+corp+"&version="+version+"&env="+env+"&corpType="+corpType;
       System.out.println("ShowReqDetails.jsp on click of BACK hrefUrl : "+hrefUrl);
       %>
$(document).ready(function() {
	
	var count=0;
    $('#SendReq_id').on('click',function (e){
    $("#Purpose_msg").html('');
	$('#RespMsg_id').html('');
	if(($('#Purpose_id').val().trim().length > 0)){
      if(($('#Purpose_id').val().trim().length <250)){
    	  console.log("fffffffffff");
		 $('#SendReq_id').attr("disabled", true);
		 $("#SendReq_id").css('background-color','gray');
	    var Corp =$("#Corp_id").val(); 
	    var version = $("#Version_id").val();
	    var env = $("#Environment_id").val();

	    var OraclePassword =$("#OraclePassword_id").val();                    
	    var Script  =$("#Script_id").val();
	    var OracleMachine =$("#OracleMachine_id").val();
	    var OracleInstance =$("#OracleInstance_id").val(); 
	    var TuxedoInstance  =$("#TuxedoInstance_id").val();
	    var TuxedoMachine =$("#TuxedoMachine_id").val();
	    var EnterpriseAcc =$("#EnterpriseAcc_id").val();   
	    var WlsVersion =$("#WlsVersion_id").val();          
	    var WlsInstance =$("#WlsInstance_id").val();                      
	                                               
	    var CorpOwner =$("#CorpOwner_id").val();
	    var Notes =$("#Notes_id").val(); 
	    var Purpose =$("#Purpose_id").val();
	    var tdValue = "";
	    tdValue +=  Corp +',' +  version +',' +  env +',' + OraclePassword +',' +
	    Script +',' + OracleMachine +',' + OracleInstance +',' + TuxedoInstance +',' +
	    TuxedoMachine +',' + EnterpriseAcc +',' + WlsVersion +',' + WlsInstance +',' +
	    CorpOwner +',' + Notes+','+Purpose;
	    console.log("feffff : ",tdValue);
	    $("#Purpose_id").attr("disabled", true);
	    $.ajax({
		    url: "RequestAdmin",
		    type: 'POST',
		    data: {
		    	Details : tdValue
		
		    },success: function (response) {
		    	var tdArray = tdValue.split(',');
		    	  console.log("Response From RequestCorpDetail Servlet : ",response);
		    	  
	        	    if(response.indexOf("Success")!=-1){
	        	
	        	    	$('#RespMsg_id').append("Successfully Sent Request To Admin");
	        	    
	            }
	    	    	else if(response.indexOf("Amd-04")!=-1)
          	{
	    	    			$('#RespMsg_id').append("Requested Corp Does Not Exist !!!");
	            	
          	}else if(response.indexOf("Amd-05")!=-1)
          	{
  
	    			$('#RespMsg_id').append("Requested Corp Details Have Been Changed");

            	
      	}
          	else if(response.indexOf("Amd-06")!=-1||response==null)
    		{
    		
	    			$('#RespMsg_id').append("Request Already Raised!!!");

    		}
          
	            //	else if(response.contains("Amd-02")||response==null||response.isEmpty())
	            		else if(response.indexOf("Amd-02")!=-1||response==null)
	            		{
	            			$('#SendReq_id').attr("disabled", false);
	            			$('#Purpose_id').attr("disabled", false);
	   		       		 	$("#SendReq_id").css('background-color','steelblue');
	            			$('#RespMsg_id').append("Unable To Process request.Please Try Later !!!");
		            	
	            		}
	            
		
		  
	   }
});
	}
	else{
		console.log("cccccccccccc");
			$("#Purpose_msg").html('');
			$("#Purpose_msg").append("*Max allowed characters 250");
		}
		}
	    else
		{
	    	
		console.log("kkkkkkkkkkk : ");
		if(count<=0){
			count++;
		$("#Purpose_msg").append("*Mandatory");
		}
		}	
});
});

</script>
<body class="protected">
<div align="center">

<table id="Table_id" >

      <tr><td align="right"> Corp : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value= "<%=request.getParameter("corp")%>" disabled="true" id="Corp_id" size="35"></td>
 <td align="right"> Version : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("version")%>" disabled="true" id="Version_id"size="35"></td></tr>
 <tr><td align="right">Environment :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("environment")%>" disabled="true" id="Environment_id"size="35"></td>
 <td align="right"> OraclePassword :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oraclePassword")%>" disabled="true" id="OraclePassword_id" size="35"></td></tr>
 <tr><td align="right" >Script :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("script")%>" disabled="true" id="Script_id" size="35"></td>
 <td align="right"> OracleMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oracleMachine")%>" disabled="true" id="OracleMachine_id"size="35"></td></tr>
 <tr><td align="right">OracleInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("oracleInstance")%>" disabled="true"  id="OracleInstance_id"size="35"></td>
 <td align="right"> TuxedoInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("tuxedoInstance")%>" disabled="true"  id="TuxedoInstance_id"size="35"></td></tr>
 <tr><td align="right">TuxedoMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("tuxedoMachine")%>" disabled="true" id="TuxedoMachine_id"size="35"></td>
 <td align="right"> EnterpriseAcc :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("enterpriseAcc")%>" disabled="true" id="EnterpriseAcc_id"size="35"></td></tr>
 <tr><td align="right">WlsVersion :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("wlsVersion")%>" disabled="true" id="WlsVersion_id"size="35"></td>
 <td align="right"> WlsInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="<%=request.getParameter("wlsInstance")%>" disabled="true" id="WlsInstance_id"size="35"></td></tr>
 <tr><td align="right">Notes : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("notes")%>" disabled="true" id="Notes_id"size="35"></td>
 <td align="right"> CorpOwner : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("corpOwner")%>" disabled="true" id="CorpOwner_id" size="35"></td></tr>
<tr> <td align="right"> Purpose : &nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="35" id="Purpose_id"> </textarea></td><td  id="Purpose_msg" style="color: red;"></td></tr>
  


</table>
</div></br>
<div align="center">
<input type="button"  id="SendReq_id" value="SEND REQUEST"> &nbsp;&nbsp;<a href="<%=hrefUrl%>"> <input type="button"  id="Back_id" value="  BACK  "></a>
</div>
<div align="center" class="RespMsgDiv_id">

<h2   id = "RespMsg_id"> </h2>  


</div>
</body>