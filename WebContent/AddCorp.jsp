<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Corp Page</title>
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
$('#AddCorp_id').on('click',function (e){
      if( validate()){
    	  $("#RespMsg_id").html('');
	 var env = $("select#Environment_id").val();
	    var version = $("select#Version_id").val();
	    var env = $("select#Environment_id").val();
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
	    $("#AddCorp_id").attr("disabled", true);
	   console.log("Add submit Id: ",env + version + Corp);
	   $.ajax({
		    url: "AddCorp",
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
		            console.log("Response",response);
		            
		            
		        	    if(response.indexOf("Success")!=-1){
		            	$("#RespMsg_id").append("Successfully Processed Request !!!");
		            	$("#AddCorp_id").css('background-color','gray');
		            	
		            }
		 
		    	    	else if(response.indexOf("Amd-01")!=-1)
	            	{
		    	    		$("#AddCorp_id").attr("disabled", false);
		            	$("#RespMsg_id").append("Corp Already Exist !!!");

		            	
	            	}
	            
		            		else if(response.indexOf("Amd-02")!=-1||response==null||response.isEmpty())
		            		{
		            			$("#AddCorp_id").css('background-color','gray');
			            		$("#RespMsg_id").append("Unable To Process request.Please Try Later !!!");

		            		}
		        	    
		            
 }
});
	   } 
});
      
});


function validate() {
var version=document.getElementById("Version_id").value;
var environment=document.getElementById("Environment_id").value;
var corps=document.getElementById("Corp_id").value;
var password=document.getElementById("OraclePassword_id").value;
var scrp=document.getElementById("Script_id").value;
var omac=document.getElementById("OracleMachine_id").value;
var oins=document.getElementById("OracleInstance_id").value;
var tins=document.getElementById("TuxedoInstance_id").value;
var tmac=document.getElementById("TuxedoMachine_id").value;
var eacc=document.getElementById("EnterpriseAcc_id").value;
var wver=document.getElementById("WlsVersion_id").value;
var wins=document.getElementById("WlsInstance_id").value;
var nid=document.getElementById("Notes_id").value;
var cid=document.getElementById("CorpOwner_id").value;

if(version==""||environment==""||corps==""|| password==""||scrp==""||omac==""||oins==""||tins==""||tmac==""||eacc==""||wver==""||wins==""||nid==""||cid=="")
	{
	document.getElementById("Mand_id").innerHTML = "<font color=red>*Mandatory fields";
if(version=="")
document.getElementById("ver").innerHTML = "<font color=red>*";


else {document.getElementById("ver").innerHTML ="";}






	if(environment=="")
	{
	document.getElementById("env").innerHTML = "<font color=red>*";

	}
	else {document.getElementById("env").innerHTML ="";
	
	}


	if(corps=="")
	{
	document.getElementById("corp").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("corp").innerHTML ="";
	
	}
	

	if(password=="")
	{
	document.getElementById("pwd").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("pwd").innerHTML ="";

	}
	

	if(scrp=="")
	{
	document.getElementById("script").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("script").innerHTML ="";
	
	}
	

	if(omac=="")
	{
	document.getElementById("oracleMachine").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("oracleMachine").innerHTML ="";
	
	}
	

	if(oins=="")
	{
	document.getElementById("oracleInstance").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("oracleInstance").innerHTML ="";
	
	}
	

	if(tins=="")
	{
	document.getElementById("tuxedoInstance").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("tuxedoInstance").innerHTML ="";

	}
	

	if(tmac=="")
	{
	document.getElementById("tuxedoMachine").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("tuxedoMachine").innerHTML ="";
	
	}

	if(eacc=="")
	{
	document.getElementById("enterpriseAcc").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("enterpriseAcc").innerHTML ="";
	
	}
	

	if(wver=="")
	{
	document.getElementById("wlsVersion").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("wlsVersion").innerHTML ="";
	
	}

	if(wins=="")
	{
	document.getElementById("wlsInstance").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("wlsInstance").innerHTML ="";
	
	}
	

	if(nid=="")
	{
	document.getElementById("notes").innerHTML = "<font color=red>*";
	
	}
	else {document.getElementById("notes").innerHTML ="";
	
	}
	

	if(cid=="")
	{
	document.getElementById("corpOwner").innerHTML = "<font color=red>*";
	
	}
	else {
		document.getElementById("corpOwner").innerHTML ="";
	}
return false;
	}
	
	return true;

}
function clearf()
{

	var version=document.getElementById("Version_id").value;
	var environment=document.getElementById("Environment_id").value;
	var corps=document.getElementById("Corp_id").value;
	var password=document.getElementById("OraclePassword_id").value;
	var scrp=document.getElementById("Script_id").value;
	var omac=document.getElementById("OracleMachine_id").value;
	var oins=document.getElementById("OracleInstance_id").value;
	var tins=document.getElementById("TuxedoInstance_id").value;
	var tmac=document.getElementById("TuxedoMachine_id").value;
	var eacc=document.getElementById("EnterpriseAcc_id").value;
	var wver=document.getElementById("WlsVersion_id").value;
	var wins=document.getElementById("WlsInstance_id").value;
	var nid=document.getElementById("Notes_id").value;
	
	
	if(version!="")
		document.getElementById("ver").innerHTML = "";


	if(environment!="")
	{
		document.getElementById("env").innerHTML = "";
	}

	if(corps!="")
	{
			document.getElementById("corp").innerHTML = "";
			
	}
			
	if(password!="")
	{
			document.getElementById("pwd").innerHTML = "";
	}
	
	if(scrp!="")
	{
			document.getElementById("script").innerHTML = "";
			
	}
			
	if(omac!="")
	{
			document.getElementById("oracleMachine").innerHTML = "";
	}
			
	if(oins!="")
	{
		document.getElementById("oracleInstance").innerHTML = "";
			
	}
		
	if(tins!="")
	{
		document.getElementById("tuxedoInstance").innerHTML = "";
			
	}
		
			
	if(tmac!="")
	{
			document.getElementById("tuxedoMachine").innerHTML = "";
	}
			

	if(eacc!="")
	{
			document.getElementById("enterpriseAcc").innerHTML = "";
	}
			
	if(wver!="")
	{
			document.getElementById("wlsVersion").innerHTML = "";
	}
			
	if(wins!="")
	{
		document.getElementById("wlsInstance").innerHTML = "";
			
	}
			
	if(nid!="")
	{
			document.getElementById("notes").innerHTML = "";
	}
	if(version!=""&&environment!=""&&corps!=""&& password!=""&&scrp!=""&&omac!=""&&oins!=""&&tins!=""&&tmac!=""&&eacc!=""&&wver!=""&&wins!=""&&nid!="")
	{
	document.getElementById("Mand_id").innerHTML = "";
	}
	
}

</script>
</head>
<style>

table#AddCorpTable_id 
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

<div align ="center">

<table border="0" align="center" width="500" padding="500px" id="AddCorpTable_id" >
 <tr>
<td><label for="version">Select Version :</label></td>
<td>
<select name="Version" id="Version_id" onchange="clearf();" style="width:170px">
<option value="">Select Version</option>
<option value="version9.5">9.5</option>
<option value="version9.0">9.0</option>
<option value="version8.5">8.5</option>
<option value="version8.0">8.0</option>
</select> </td>
<td id="ver"></td>
<td>&nbsp;&nbsp;</td>
<td><label for="Environment">Select Environment :</label></td>
<td>
<select name="Environment" id="Environment_id" onchange="clearf();" style="width:170px">
<option value="">Select Environment</option>
<option value="DEV">DEV</option>
<option value="QA">QA</option>
</select> </td>
<td id="env"></td></tr>

<tr> <td><label>Corp :</label></td>
 <td><input type="text" name="Corp" id ="Corp_id" placeholder="Enter Corp" onchange="clearf();"  >
</td> <td id="corp"></td>
<td>&nbsp;&nbsp;</td>
 <td><label >OraclePassword:</label></td>
 <td><input type="text" name="OraclePassword" id ="OraclePassword_id" placeholder="Enter OraclePassword"  onchange="clearf();" >
</td> <td id="pwd"></td></tr>

 <tr> <td><label>Script:</label></td>
 <td><input type="text" name="Script" id ="Script_id" placeholder="Enter Script" onchange="clearf();">
</td> <td id="script"></td> 
<td>&nbsp;&nbsp;</td>
<td><label>OracleMachine:</label></td>
 <td><input type="text" name="OracleMachine" id ="OracleMachine_id" placeholder="Enter OracleMachine" onchange="clearf();"  >
</td> <td id="oracleMachine"></td></tr>

 <tr> <td><label>OracleInstance:</label></td>
 <td><input type="text" name="OracleInstance" id ="OracleInstance_id" placeholder="Enter OracleInstance"  onchange="clearf();" >
</td> <td id="oracleInstance"></td> 
<td>&nbsp;&nbsp;</td>
<td><label>TuxedoInstance:</label></td>
 <td><input type="text" name="TuxedoInstance" id ="TuxedoInstance_id" placeholder="Enter TuxedoInstance" onchange="clearf();" >
</td> <td id="tuxedoInstance"></td></tr>

<tr> <td><label>TuxedoMachine:</label></td>
 <td><input type="text" name="TuxedoMachine" id ="TuxedoMachine_id" placeholder="Enter TuxedoMachine"  onchange="clearf();" >
</td> <td id="tuxedoMachine"></td>
<td>&nbsp;&nbsp;</td>
 <td><label>EnterpriseAcc:</label></td>
 <td><input type="text" name="EnterpriseAcc" id ="EnterpriseAcc_id" placeholder="Enter EnterpriseAcc"  onchange="clearf();" >
</td> <td id="enterpriseAcc"></td></tr>

<tr> <td><label>WlsVersion:</label></td>
 <td><input type="text" name="WlsVersion" id ="WlsVersion_id" placeholder="Enter WlsVersion"  onchange="clearf();" >
</td> <td id="wlsVersion"></td>
<td>&nbsp;&nbsp;</td>
<td><label>WlsInstance:</label></td>
 <td><input type="text" name="WlsInstance" id ="WlsInstance_id" placeholder="Enter WlsInstance" onchange="clearf();"  >
</td> <td id="wlsInstance"></td></tr>

 <tr> <td><label>Notes:</label></td>
 <td><input type="text" name="Notes" id ="Notes_id" placeholder="Enter Notes"  onchange="clearf();" >
</td> <td id="notes"></td>
<td>&nbsp;&nbsp;</td>
<td><label>CorpOwner:</label></td>
 <td><input type="text" name="CorpOwner" id ="CorpOwner_id" placeholder="Enter CorpOwner"  value="ADMIN" disabled="true" >
</td> <td id="corpOwner"></td></tr>

</table>
 </div>
</br></br>

 <div align="center"> 
  <button class="submit" id="AddCorp_id">ADD CORP</button>
 </div>
<div align="center" class="RespMsgDiv_id">

<h2   id = "RespMsg_id"> </h2>
<h4 id="Mand_id"></h4>
</div>
</br></br></br>


</body>
</html>