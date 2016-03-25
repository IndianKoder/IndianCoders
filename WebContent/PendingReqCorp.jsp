<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pending Requests</title>
</head>


<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>

<script>

jQuery(document).ready(function() {
	var globalVar = "";	
	 $.ajax({
		    url: "ViewPenReq",
		    type: 'GET',
		    data: {
		    	
		    },success: function (response) {
		    	globalVar = response;
		    	$('#main_table').html('');
	
		    if(response.indexOf("Amd-07")!=-1)
		      {
		    	 $("#NoResp_id").append("No Requests Available");
	   
		      }
		    else{
		    	console.log("Got REQ DATA");
		    	var thHTML =  '<tr class="noBorder"><th>'+'Corp'+ '</th><th>'+'Gid'+'</th><th>'+'RequestedBy'+'</th><th>'+'Status'+'</th><th>'+'RequestTime'+'</th><th>'+'Click Below'+'</th></tr>';
		 //	   var thbutn = ''+'<tr><th>'+'bbbb'+'</th></tr>';
		 	   var trHTML='';
		 //	   var trbutn='';
		 	  console.log("SET HEAD VAR DATA");
		 	   $.each(response, function(index, value) {
		 		  console.log("IN FOR LOOP");
		 		   trHTML += '<tr><td>' + value.corp + '</td><td>' + value.gid +'</td><td>' + value.requestedBy + '</td><td>' + value.status +'</td><td>'
		 		   + value.requestTime +'</td><td class="lasttd">' +'<input type = "button" id="row_'+index+'" value ="Show Details" class="Table_class" />'  +'</td></tr>';
		 		   
		 		   //trbutn += '<tr><td>' +'<input type = "button" id="row_'+index+'" value ="Show Details" class="Table_class" />'  +'</td></tr>';
		 	   });

		 	   $('#main_table').append(thHTML).append(trHTML);
		    }
}
});
	 $('#main_table').on('click','input',function(e){
		    console.log(e.target.id);
		    var butnId = (e.target.id).split('_');
		    console.log("GLOBAL : ",globalVar[butnId[1]]);
	
		   
		     var tdValue = "";
		     tdValue += globalVar[butnId[1]].corp +'#' + globalVar[butnId[1]].requestTime+'#' 
		     + globalVar[butnId[1]].requestedBy +'#' +globalVar[butnId[1]].status+'#'+globalVar[butnId[1]].purpose+'#'+globalVar[butnId[1]].gid;
		  
		  console.log("MAPPPP : ",tdValue);

		    
		        
		    console.log("Data submit to get req corp details: ",tdValue);
			   $.ajax({
				    url: "ReqCorpDetails",
				    type: 'GET',
				    data: {
				    	Details : tdValue
				
				    },success: function (response) {
				    	console.log("In PendingReqCorp.jsp response from ReqCorpDetails Server : ",response);
				    	
				    	window.location = response.url;
				    	
				    }
				    	
	 });
				    
});
			  });
</script>
<style>

.lastth{
border:0;}
.lasttd{
border :0;
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
<table id="main_table" class="grid" align="center"><tr><td>
   </td></tr>
   
</table>
<h2 align="center" id="NoResp_id"></h2>
</body>
</html>