<%-- 
    Document   : index
    Created on : 17-Jun-2016, 16:53:18
    Author     : Selvyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="globalHelper" class="deutschebank.thebeans.ApplicationScopeHelper" scope="application"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jquery-3.0.0.js"></script>
        <script type="text/javascript" src="userdetails_validator.js"></script>
        <title>Deutsche Bank Case Study</title>
    </head>
    
    <body>
        <%
            String  dbStatus = "DB NOT CONNECTED";

            globalHelper.setInfo("Set any value here for application level access");
            boolean connectionStatus = globalHelper.bootstrapDBConnection();
            
            if( connectionStatus )
            {
                dbStatus = "You have successfully connected the DB server";
            }
        %>
        <h2><%= dbStatus %></h2>
        <%
            if( connectionStatus )
            {
        %>
        <h3>User verification is required</h3>
        <form action = "validate.jsp" method = "GET">
            <p>User ID: <input type="text" id="f_userid" name="id"></p>
            <p>Password: <input type="text" id="f_pwd" name="password"></p>
            <button type="button" onclick="validateUserId()">Verify</button>
            <input type = "submit" value = "Submit" />
        </form>
        <p>
            <div id="userIdMessage"></div>
        </p>
        <%
            }
        %>
    </body>
</html>
