<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Corps</title>
</head>


<script src="http://code.jquery.com/jquery-1.10.0.min.js" type="text/javascript"></script>

<script>

jQuery(document).ready(function() {
	var globalVar = "";	
	 $.ajax({
		    url: "ViewUserCorps",
		    type: 'GET',
		    data: {
		    	
		    },success: function (response) {
		    	globalVar = response;
		    	$('#main_table').html('');
		    	console.log("In UserCorps.jsp ViewUserCorps response : ",response);
	
		    if(response.indexOf("Amd-07")!=-1)
		      {
		    	 $("#NoResp_id").append("No Data Available");
	   
		      }
		    else{
		    	
		    	var thHTML =  '<tr class="noBorder"><th>'+'Corp'+ '</th><th>'+'Purpose'+'</th><th>'+'RequestTime'+'</th><th>'+'Click Below'+'</th></tr>';
		 	   var trHTML='';
		 	   $.each(response, function(index, value) {
		 		   trHTML += '<tr><td>' + value.corp + '</td><td><textarea style="background-color: steelblue; color:black ;" rows="2" cols="35"  disabled="false">'+ value.purpose+'</textarea></td><td>' + value.requestTime +'</td><td>'
		 		   +'<input type = "button" id="row_'+index+'" value ="Show Details" class="Table_class" />'  +'</td></tr>';
		 		   
		 		  
		 	   });

		 	   $('#main_table').append(thHTML).append(trHTML);
		    }
}
});
	 $('#main_table').on('click','input',function(e){
		    console.log(e.target.id);
		    var id = (e.target.id).split('_');
		    console.log("UserCorps.jsp selected Row : ",globalVar[id[1]]);
	
		   
		     var tdValue = "";
		     tdValue += globalVar[id[1]].corp +'#' + globalVar[id[1]].purpose+'#' 
		    +globalVar[id[1]].requestTime+'#'+ globalVar[id[1]].requestedBy+'#'+globalVar[id[1]].gid;;
		  
		  console.log("MAPPPP : ",tdValue);

		    
		        
		    console.log("Data submit to get release corp details: ",tdValue);
			   $.ajax({
				    url: "ReleaseCorpDetails",
				    type: 'GET',
				    data: {
				    	Details : tdValue
				
				    },success: function (response) {
				    	console.log("In UserCorps.jsp response from ReleaseCorpDetails Controller : ",response);
				    	
				    	window.location = response.url;
				    	
				    }
				    	
	 });
				    
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
    font-style: 
   
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
<br><br>
<table id="main_table"  class="grid" align="center" ><tr><td>
   </td></tr>
   
</table>
<h2  align="center" id="NoResp_id"></h2>
</body>
</html>