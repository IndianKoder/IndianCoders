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
$(document).ready(function() {
	
	<% System.out.println("In EditCorp.jsp on click of back restoring values : ");

	if(request.getParameter("env")!=null){     %>


$("#Version_id").val("<%=request.getParameter("version")%>");
$("#Environment_id").val("<%=request.getParameter("env")%>");
var env = $("select#Environment_id").val();
var version = $("select#Version_id").val();

$.get("ViewCorps", {
        Env : env,
        Version : version
}, function(response) {

var select = $('#Corp_id');
select.find('option').remove();
  $.each(response, function(index, value) {
  $('<option>').val(value).text(value).appendTo(select);
});
  
});


    
       
       <%
       } 
	%>
$('#Environment_id').click(function(event) {
        var env = $("select#Environment_id").val();
        var version = $("select#Version_id").val();
        console.log("In EditCorp.jsp on click of env");

        console.log("Data : ",env + version);
        $.get("ViewCorps", {
                Env : env,
                Version : version
        }, function(response) {

        var select = $('#Corp_id');
        select.find('option').remove();
          $.each(response, function(index, value) {
        	  if(value!="Show All Corps")
          $('<option>').val(value).text(value).appendTo(select);
      });
          
        });
        });
        
$('#Environment_id').change(function() {
    var env = $("select#Environment_id").val();
    var version = $("select#Version_id").val();
    console.log("In EditCorp.jsp on change of env");

    console.log("Data : ",env + version);
    $.get("ViewCorps", {
            Env : env,
            Version : version
    }, function(response) {

    var select = $('#Corp_id');
    select.find('option').remove();
      $.each(response, function(index, value) {
    	  if(value!="Show All Corps")
      $('<option>').val(value).text(value).appendTo(select);
  });
      
    });
    });
   
$('#Version_id').click(function(event) {
    var env = $("select#Environment_id").val();
    var version = $("select#Version_id").val();
    console.log("In EditCorp.jsp on click of version");
    console.log("Data : ",env + version);
    $.get("ViewCorps", {
            Env : env,
            Version : version
    }, function(response) {

    var select = $('#Corp_id');
    select.find('option').remove();
      $.each(response, function(index, value) {
    	  if(value!="Show All Corps")
      $('<option>').val(value).text(value).appendTo(select);
  });
      
    });
    });
    
$('#Version_id').change(function() {
    var env = $("select#Environment_id").val();
    var version = $("select#Version_id").val();
    console.log("In EditCorp.jsp on change of version");
    console.log("Data : ",env + version);
    $.get("ViewCorps", {
            Env : env,
            Version : version
    }, function(response) {

    var select = $('#Corp_id');
    select.find('option').remove();
      $.each(response, function(index, value) {
    	  if(value!="Show All Corps")
      $('<option>').val(value).text(value).appendTo(select);
  });
      
    });
    });

});
function validate()
{
	var env = document.getElementById("Environment_id").value;
	var version = document.getElementById("Version_id").value;
	var corp=document.getElementById("Corp_id").value;
	if(env==""||version==""||corp==""||corp=="Select Corp")
	{
		if(env=="")
			document.getElementById("envCol_id").innerHTML="<font color='red'>*Select Environment</font>";
		else
			document.getElementById("envCol_id").innerHTML="";	


		if(version=="")
			document.getElementById("verCol_id").innerHTML="<font color='red'>*Select Version</font>";
		else
			document.getElementById("verCol_id").innerHTML="";
		
		
		if(env!=""&&version!="")
		{
			if(corp==""||corp=="Select Corp")
				document.getElementById("corpCol_id").innerHTML="<font color='red'>No Corp(s) exists</font>";
			else
				document.getElementById("corpCol_id").innerHTML="";
		}
		return false;
	}
	return true;
}
function clearf() {
	var env = document.getElementById("Environment_id").value;
	var version = document.getElementById("Version_id").value;
	
	document.getElementById("corpCol_id").innerHTML="";
	if(version!="")
		document.getElementById("verCol_id").innerHTML="";
	if(env!="")
		document.getElementById("envCol_id").innerHTML="";
}
</script>

</head>
<style>

td
{
    padding:0 20px 0 20px;
   
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


<form action="ViewCorps" method="GET" onsubmit="return validate();">

<br><br><br><br><br><br><br>
<div align="center">
<table align="center" id="EditCorpTable_id" width="800px" style="padding-left: 165px">
   <tr ><td style="width: 100px"><label>
 Version</label></td>
<td style="width: 200px"><select name="Version" id="Version_id" onchange="clearf();" style="width:140px">
      <option value="">Select Version</option>
        <option value="version9.5">9.5
        <option value="version9.0">9.0
        <option value="version8.5">8.5
        <option value="version8.0">8.0
    </select> 
   </td>
   <td id="verCol_id" style="width: 200px"></td>
  </tr>
 <tr><td></br></td></tr>
    <tr ><td style="width: 100px">
    <label>Environment</label></td>
<td style="width: 100px"><select name="Environment" id="Environment_id" onchange="clearf();" style="width:140px">
 <option value="" style="width: 40px;">Select Environment</option>
        <option value="DEV">DEV
        <option value="QA">QA
    </select> 
   </td>
   <td id="envCol_id" style="width: 300px"></td>
   </tr>
    <tr><td></br></td></tr>
   <tr><td>
    <label>
        Corp</label></td>
        <td><select name = "EditCorp" id="Corp_id" style="width:140px">
                <option>Select Corp</option>
        </select>
        </td>
        <td id="corpCol_id"></td></tr>
         
 <tr><td></br></td></tr>
<tr><td colspan="2" align="center">
<input type ="submit" class="submit" id="UpdateCorp_id" value="UPDATE CORP">
</td></tr></table>
</div>
</form>
  

</body>
</html>