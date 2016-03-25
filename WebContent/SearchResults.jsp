<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
<style>
 ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: steelblue;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}



input[type=button],  input[type=reset] {
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
.menu li{
height: 45px;
}
.menu li.active {
        background-color: cadetblue;
        
    }
    
    .fixed-nav-bar {
  position: fixed;
  top: 95px;
  left: 0;
  right: 0;
  z-index: 9999;
  width: 100%;
  height: 45px;
  background-color: #00a087;
}

 input,textarea{
    -moz-user-select:none;
    -webkit-user-select:none;
    user-select:none;
} 
input[type=text]{
background-color: pink;
}
td{
color:purple;
font-weight: bold;

}
.tables{

padding-top: 110px;
padding-left: 290px;
}
</style>
</head>
<body class="container">

<div class="tables">
<table  >

<c:forEach var="list" items="${corpList}">
<tr><td>Corp</td><td><input type="text" value="${list.corp}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>Corp Owner</td><td><input type="text" value="${list.corpOwner}" disabled="true"/></td></tr>
<tr></tr><tr></tr>
<tr><td>Environment</td><td><input type="text" value="${list.environment}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>WLS Instance</td><td><input type="text" value="${list.wlsInstance}"/></td></tr>
<tr></tr><tr></tr>
<tr><td>Version</td><td><input type="text" value="${list.version}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>Oracle Machine</td><td><input type="text" value="${list.oracleMachine}" disabled="true"/></td></tr>
<tr></tr><tr></tr>
<tr><td>Oracle Instance:</td><td><input type="text" value="${list.oracleInstance}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>Version</td><td><input type="text" value="${list.version}" disabled="true"/></td></tr>
<tr></tr><tr></tr>
<tr><td>Oracle Password</td><td><input type="text" value="${list.oraclePassword}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>Script</td><td><input type="text" value="${list.script}" disabled="true"/></td></tr>
<tr></tr><tr></tr>
<tr><td>WLS Version</td><td><input type="text" value="${list.wlsVersion}" disabled="true"/></td><td> &nbsp;&nbsp;&nbsp;&nbsp;</td><td>Notes</td><td><input type="text" value="${list.notes}" disabled="true"/></td></tr>
<%out.println("\n"); %>
</c:forEach>
</table>
</div>

</body>
</html>