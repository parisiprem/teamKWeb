<%-- 
    Document   : usemyscripts
    Created on : 21-Apr-2016, 08:12:22
    Author     : Selvyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jquery-3.0.0.js"></script>
        <script type="text/javascript" src="userdetails_validator.js"></script>
        <title>user verification example</title>
    </head>
    <body>
        <h1>User Verification</h1>
        <form>
            <p>User ID: <input type="text" id="userid" name="id"></p>
            <p>Password: <input type="text" id="pwd" name="password"></p>
            <button type="button" onclick="validateUserId();">Verify</button>
        </form>
        <div id="userIdMessage"></div>
    </body>
</html>
