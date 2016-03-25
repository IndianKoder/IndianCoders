<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List"%>
    <%@ page import="java.util.ArrayList"%>
        <%@ page import="com.amdocs.corp.model.CorpDetails"%>
    
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<title>Update Corp</title>
<script>
$(document).on('keydown',function(e){
	  var $target = $(e.target||e.srcElement);
	  if(e.keyCode == 8 && !$target.is('input,[contenteditable="true"],textarea'))
	  {
	    e.preventDefault();
	  }
	})
	
      
jQuery(document).ready(function() {
$('#Save_id').on('click',function (e){
	 $("#Save_id").attr("disabled", true);
	 $("#Back_id").attr("disabled", true);
	 $("#Save_id").css('background-color','gray');
	 $("#Back_id").css('background-color','gray');
	 var env = $("#Environment_id").val();
	    var version = $("#Version_id").val();
	    var env = $("#Environment_id").val();
	    var Corp =$("#Corp_id").val(); 
	    var OraclePassword =$("#OraclePassword_id").val();                    
	    var Script  =$("#Script_id").val();
	    var OracleMachine =$("#OracleMachine_id").val();
	    var OracleInstance =$("#OracleInstance_id").val(); 
	    var TuxedoInstance  =$("#TuxedoInstance_id").val();
	    var TuxedoMachine =$("#TuxedoMachine_id").val();
	    var EnterpriseAcc =$("#EnterpriseAcc_id").val();   
	    var WlsVersion =$("#WlsVersion_id").val();          
	    var WlsInstance =$("#WlsInstance_id").val();                      
	    var Notes =$("#Notes_id").val();                                            
	    var CorpOwner =$("#CorpOwner_id").val();
	    
	   var tdvalue = ''+
	    
	   console.log("Add submit Id: ",env + version + Corp);
	   $.ajax({
		    url: "UpdateCorp",
		    type: 'POST',
		    data: {
		    	Env : env,
		           Version : version,
		           Corp : Corp,
		           OraclePassword : OraclePassword,
		           Script  :  Script ,
		           OracleMachine   : OracleMachine ,
		           OracleInstance  : OracleInstance,
		           TuxedoInstance  : TuxedoInstance,
		           TuxedoMachine   : TuxedoMachine ,
		           EnterpriseAcc   : EnterpriseAcc ,
		           WlsVersion      : WlsVersion ,
		           WlsInstance     :  WlsInstance ,
		           Notes           : Notes ,
		           CorpOwner       :CorpOwner
		           
		    },success: function (response) {
		            console.log("Response From UpdateCorp Servlet : ",response);

		        	    if(response.indexOf("Success")!=-1){
		        	    $("#Back_id").attr("disabled", false);
		        	    $("#Back_id").css('background-color','steelblue');
		            	$("#RespMsg_id").append("Successfully Processed Request !!!");
		                
		            	
		            }
		    	    	else if(response.indexOf("Amd-03")!=-1)
	            	{
		    	    	$("#Back_id").attr("disabled", false);
		    	    	$("#Back_id").css('background-color','steelblue');
		            	$("#RespMsg_id").append("Corp Does Not Exist !!!");
		            	 
		            	
	            	}
	            
		            //	else if(response.contains("Amd-02")||response==null||response.isEmpty())
		            		else if(response.indexOf("Amd-02")!=-1||response==null||response.isEmpty())
		            		{
		            		$("#Back_id").attr("disabled", false);
		            		$("#Back_id").css('background-color','steelblue');
			            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");
			            
		            		}
		            
		            
 }
});
	   });
});
console.log("2222");
<% List corpList = (List)request.getAttribute("corpDetails");

CorpDetails details = new CorpDetails();
details = (CorpDetails)corpList.get(0);
System.out.println("ewtewtwt : "+details.getCorp());

String hrefUrl ="/Amdocs/EditCorp.jsp?corp="+details.getCorp()+"&version="+details.getVersion()+"&env="+details.getEnvironment();
%>
console.log("11111111");

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

</style>
<body>

<br><br>
<div align="center">
<table id="Table_id">

<c:forEach var="details" items="${corpDetails}">
   <tr><td align="right"> Corp : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${details.corp}" disabled="true" id="Corp_id" size="35"></td>
 <td align="right"> Version : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${details.version}" id="Version_id"size="35"></td></tr>
 <tr><td align="right">Environment :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.environment}" id="Environment_id"size="35"></td>
 <td align="right"> OraclePassword :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.oraclePassword}" id="OraclePassword_id"size="35"></td></tr>
 <tr><td align="right" >Script :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.script}" id="Script_id"size="35"></td>
 <td align="right"> OracleMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.oracleMachine}" id="OracleMachine_id"size="35"></td></tr>
 <tr><td align="right">OracleInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.oracleInstance}" id="OracleInstance_id"size="35"></td>
 <td align="right"> TuxedoInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.tuxedoInstance}" id="TuxedoInstance_id"size="35"></td></tr>
 <tr><td align="right">TuxedoMachine :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.tuxedoMachine}" id="TuxedoMachine_id"size="35"></td>
 <td align="right"> EnterpriseAcc :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.enterpriseAcc}" id="EnterpriseAcc_id"size="35"></td></tr>
 <tr><td align="right">WlsVersion :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.wlsVersion}" id="WlsVersion_id"size="35"></td>
 <td align="right"> WlsInstance :&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" value="${details.wlsInstance}" id="WlsInstance_id"size="35"></td></tr>
 <tr><td align="right">Notes : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${details.notes}" id="Notes_id"size="35"></td>
 <td align="right"> CorpOwner : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="${details.corpOwner}" disabled="true" id="CorpOwner_id"size="35"></td></tr>
</c:forEach>



</table>
</div> </br>
<div align="center">
<input type="button"  id="Save_id" value="  SAVE  "> &nbsp;&nbsp;<a href="<%=hrefUrl%>"><input style="background-image: back.png" type="button"  id="Back_id" value="  BACK  "></a>
</div>
<div align="center">

<h2   id = "RespMsg_id"> </h2> &nbsp;&nbsp; 
 <a href="/Amdocs/EditCorp.jsp" id="RespHrefUpdateCorp_id" ></a>

</div>
</body>
</html>