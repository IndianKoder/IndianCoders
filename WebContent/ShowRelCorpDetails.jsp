<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<script>
jQuery(document).ready(function() {
	$('#Release_id').on('click',function (e){
		 $("#Release_id").attr("disabled", true);
	
		 $("#Release_id").css('background-color','gray');

		
		    var corp =$("#Corp_id").val();                                       
		    var gid =$("#Gid_id").val();
		    var reqBy =$("#ReqUser_id").val();

		   console.log("In ShowRelCorpDetails On User Release corp : ",corp);
		   $.ajax({
			    url: "ReleaseCorp",
			    type: 'POST',
			    data: {
			           Corp : corp,
			           ReqBy : reqBy ,
			           Gid : gid
			           
			    },success: function (response) {
			            console.log("ShowRelCorpDetails Response From ReleaseCorp Servlet : ",response);

			        	    if(response.indexOf("Success")!=-1){
			            	$("#RespMsg_id").append("Successfully Processed Request !!!");

			            }
		            
			            		else if(response.indexOf("Amd-02")!=-1||response==null||response.isEmpty())
			            		{
			            			$("#Release_id").attr("disabled", false);
				
					    	    	$("#Release_id").css('background-color','steelblue');
					    	  
				            	$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");


			            		}
			            
			            
	 }
	});
		   });
	$('#Back_id').on('click',function (e){
		 window.location ='UserCorps.jsp';		

		   });
	});

</script>
<title>Release Corp Details</title>
</head>
<style>
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
td
{
    padding:0 40px 0 40px;
   
}

table#Table_id 
{
    border-collapse:separate;
    border-spacing:0 15px;
}
.protected {
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
#Table_id input,textarea{
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
</style>
<body class="protected">
</br>
<div align="center">

<table id="Table_id" >

<tr><td align="right"> Corp : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value= "<%=request.getParameter("corp")%>" disabled="true" id="Corp_id"size="35" ></td>
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
<tr><td align="right">Gid : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" value="<%=request.getParameter("gid")%>" disabled="true" id="Gid_id"size="35"></td>
 <td align="right"> Purpose : &nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="3" cols="35" id="Purpose_id"  disabled="true"> <%=request.getParameter("purpose")%></textarea> </td></tr>




</table>
</div>

<div align="center">

<input type="button"  id="Release_id" value="  RELEASE  "> &nbsp;&nbsp;<input type="button"  id="Back_id" value="  BACK  "></a>
</div>
<div align="center" class="RespMsgDiv_id">

<h2   id = "RespMsg_id"> </h2>
 <a href="/Amdocs/PendingReqCorp.jsp" id="RespHrefPenReq_id" ></a>

</div>

</body>
</html>