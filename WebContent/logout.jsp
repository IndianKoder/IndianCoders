
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>logout page</title>
        <script type="text/javascript">
          
        history.pushState(null,null,'logout');
        window.addEventListener('popstate', function(event){
          history.pushState(null,null,'logout');  
        });


       
        
     </script>
            
       
    </head>
  <body> 
   <%
            session.invalidate();
            response.sendRedirect("Home.jsp");
            %>
           </body> 
</html>
