<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrations</title>
</head>


<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>

<script>

jQuery(document).ready(function() {
	var globalVar = "";	
	 $.ajax({
		    url: "ViewRegistrations",
		    type: 'GET',
		    data: {
		    	
		    },success: function (response) {
		    	globalVar = response;
		    	$('#main_table').html('');
	
		    if(response.indexOf("Usr-03")!=-1)
		      {
		    	 $("#NoResp_id").append("No Registrations Available");
	   
		      }
		    else{
		    	var thHTML =  '<tr class="noBorder"><th>'+'Gid'+ '</th><th>'+'User'+'</th><th>'+'RequestedTime'+'</th><th>'+'Click Below'+'</th></tr>';
		 	   var trHTML='';
		 	   $.each(response, function(index, value) {
		 		   trHTML += '<tr ><td>' + value.gid + '</td><td>' + value.firstName + '</td><td>' + value.createdTime +'</td><td class="lasttd">' +'<input type = "button" id="row_'+index+'" value ="Show Details" class="Table_class" />'  +'</td></tr>';
		 		   
		 	
		 	   });

		 	   $('#main_table').append(thHTML).append(trHTML);
		    }
}
});
	 $('#main_table').on('click','input',function(e){
		    console.log(e.target.id);
		    var id = (e.target.id).split('_');
		    console.log("GLOBAL : ",globalVar[id[1]]);
	         window.location = 'ShowUserRegDetails.jsp?gid='+encodeURIComponent(globalVar[id[1]].gid)+'&time='+encodeURIComponent(globalVar[id[1]].createdTime)+
	        		 '&emailId='+encodeURIComponent(globalVar[id[1]].emailId)+'&firstName='+encodeURIComponent(globalVar[id[1]].firstName)+'&lastName='+encodeURIComponent(globalVar[id[1]].lastName)+'&RMEmailId='+encodeURIComponent(globalVar[id[1]].rmEmailId);

				    
});
			  });
</script>
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
    background-color: #09568d;
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
td
{
    padding:0 20px 0 20px;
   
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
<br><br>

<table id="main_table" class="grid" align="center" ><tr><td>
   </td></tr>
   
</table></div>
<h2 align="center" id="NoResp_id"></h2>
</body>
</html>