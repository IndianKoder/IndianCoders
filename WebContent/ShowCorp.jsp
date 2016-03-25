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

	  $('#main_table').html('');
<% System.out.println("In ShowCorp.jsp on click of back restoring values : ");

	if(request.getParameter("env")!=null){     %>


$("#Version_id").val("<%=request.getParameter("version")%>");
$("#Environment_id").val("<%=request.getParameter("env")%>");
var env = $("select#Environment_id").val();
var version = $("select#Version_id").val();
console.log("Data :hhioohio");
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
	var globalVar = "";	
	var globalCorp = "";
$('#Environment_id').click(function(event) {
        var env = $("select#Environment_id").val();
        var version = $("select#Version_id").val();
		 console.log("In ShowCorp.jsp on click of env");
        console.log("Data : ",env + version);
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
        });
		
		$('#Environment_id').change(function() {
	

	 var env = $("select#Environment_id").val();
     var version = $("select#Version_id").val();
     console.log("In ShowCorp.jsp on change of env");
     console.log("Data : ",env + version);
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
     });
   
$('#Version_id').click(function(event) {
    var env = $("select#Environment_id").val();
    var version = $("select#Version_id").val();
	    console.log("In ShowCorp.jsp on click of version");
    console.log("Data : ",env + version);
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
    });
	$('#Version_id').change(function() {
    var env = $("select#Environment_id").val();
    var version = $("select#Version_id").val();
    console.log("In ShowCorp.jsp on change of version");
    console.log("Data : ",env + version);
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
    });
    
$('#Submit_id').on('click',function (e){
	if(validate())
		{
	 	var env = $("select#Environment_id").val();
	    var version = $("select#Version_id").val();
	    var corp =  $("select#Corp_id").val();
 globalCorp = corp;
	   console.log("Data submit Id: ",env + version + corp);
	   $.ajax({
		    url: "ViewCorps",
		    type: 'GET',
		    data: {
		    	Env : env,
		           Version : version,
		           corp : corp
		    },success: function (response) {
		    	globalVar = response;
		    
		    	//var select = $('#CorpsDetails_id');
		      $('#main_table').html('');
		 
	   var trHTML = '';
	   var thHTML = '<tr><th>'+'Corp'+'</th><th>'+'OracleMachine'+'</th><th>'+'OracleInstance'+'</th><th>'+'TuxedoMachine' +'</th><th>'+'EnterpriseAcc'+'</th><th>'+'Click Below'+'</th></tr>';
	   $.each(response, function(index, value) {
		   trHTML += '<tr><td>' + value.corp +'</td><td>' + value.oracleMachine +'</td><td>' + value.oracleInstance +'</td><td>' + value.tuxedoMachine +'</td><td>' + value.enterpriseAcc
		   +'</td><td>' +'<input type = "button"  class="lasttd" id="row_'+index+'" value ="More Info" class="Table_class" />'  +'</td></tr>'
			
		  // trbutn += '<tr><td>' +'<input type = "button" id="row_'+index+'" value ="Show Details" class="Table_class" />'  +'</td></tr>'
			
		   console.log("CorpType : ",corp);
  });
		   
		     $('#main_table').append(thHTML).append(trHTML);
	//   if(type=="FreeCorps"){
	//   $('#buttons_id').append(thbutn).append(trbutn);
	   
	  }
		});
	   }
});
$('#main_table').on('click','input',function(e){
    console.log(e.target.id);
    var butnId = (e.target.id).split('_');

    console.log("GLOBAL : ",globalVar[butnId[1]]);
	 window.location='AdminShowNoReqDetails.jsp?corp='+encodeURIComponent(globalVar[butnId[1]].corp)+
	    '&corpOwner='+encodeURIComponent(globalVar[butnId[1]].corpOwner)+
	    '&enterpriseAcc='+encodeURIComponent(globalVar[butnId[1]].enterpriseAcc)+
	    '&environment='+encodeURIComponent(globalVar[butnId[1]].environment)+
	   '&notes='+encodeURIComponent(globalVar[butnId[1]].notes)+
	     '&oracleInstance='+encodeURIComponent(globalVar[butnId[1]].oracleInstance)+
	         '&oracleMachine='+encodeURIComponent(globalVar[butnId[1]].oracleMachine)+
	 		'&oraclePassword='+unescape(encodeURIComponent(globalVar[butnId[1]].oraclePassword))+
	 		'&script='+encodeURIComponent(globalVar[butnId[1]].script)+
	 		'&tuxedoInstance='+encodeURIComponent(globalVar[butnId[1]].tuxedoInstance)+
	 		'&tuxedoMachine='+encodeURIComponent(globalVar[butnId[1]].tuxedoMachine)+
	 		'&version='+encodeURIComponent(globalVar[butnId[1]].version)+
	 		'&wlsInstance='+encodeURIComponent(globalVar[butnId[1]].wlsInstance)+
	 		'&wlsVersion='+encodeURIComponent(globalVar[butnId[1]].wlsVersion)+'&allCorps='+encodeURIComponent(globalCorp);
});
    
});
function validate()
{
	var env = document.getElementById("Environment_id").value;
	var version = document.getElementById("Version_id").value;
	var corp = document.getElementById("Corp_id").value;
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

<title></title>
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
.grid th,div.model td {
    text-align:center;
    padding: 5px;
}

.grid tr {background-color:steelblue}
.grid td:last-child{
background-color:steelblue;

}

.grid th {
    background-color:#09568d;
    color: black;
    
    
}
.grid table{
border-collapse: collapse;
}

.lastth{
border:0;}
.lasttd{
border :0;
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


<br><br><br><br><br><br><br>
<table align="center" width="800px" style="padding-left: 165px">
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
 <option value="">Select Environment</option>
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
             <button id="Submit_id">SHOW DETAILS</button>
      </td></tr>
    </table>
      <br> <br> 
      <br> <br> 
        
 <table id="main_table" class="grid" align="center" border ='1'><tr><td>
   </td></tr>
   
</table>


        
        
</body>
</html>