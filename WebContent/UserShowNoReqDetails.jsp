<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>
<title>Insert title here</title>
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
    padding-top:40px; 
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
       System.out.println("UserShowNoReqDetails.jsp on click of BACK hrefUrl : "+hrefUrl);
       %>

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
 </tr>
  


</table>
</div></br></br>
<div align="center">
<a href="<%=hrefUrl %>"> <input type="button"  id="Back_id" value="  BACK  "></a>
</div>

</body>