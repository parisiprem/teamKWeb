<%-- 
    Document   : validate
    Created on : 22-Apr-2016, 16:55:36
    Author     : Selvyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="deutschebank.dbutils.UserHandler" %>
<%@ page import="deutschebank.dbutils.User" %>
<jsp:useBean id="globalHelper" class="deutschebank.thebeans.ApplicationScopeHelper" scope="application"/>
<%--jsp:useBean id="userHandler" class="deutschebank.dbutils.UserHandler" scope="application"/--%>

<%
    String userId = request.getParameter("id");
    String userPwd = request.getParameter( "password" );
    String loginResponse = "<h1>User ID and Password are INVALID</h1>";

    User theUser = globalHelper.userLogin(userId, userPwd);
    if( theUser != null )
    {
        //loginResponse = "<h1>User details are VALID</h1>";
        //loginResponse += "<p>" + UserHandler.getLoader().toJSON(theUser) + "</p>";
        loginResponse = UserHandler.getLoader().toJSON(theUser);
        
        // Do not send this next line back, the jQuery script will fail to parse
        // only send it back as a debug message
        //out.println("Message from server");
        // Sending '\n' before the JSON string will ensure the stream has been flushed
        // so simply call flush instead
        //out.write('\n');
        out.flush();
        out.print( loginResponse );
        //out.flush();
    }
    else
    {
        out.flush();
        out.println( loginResponse );
        out.flush();
    }
%>
<%--
    The Scriplet below has the same effect as writing 
    out.write('\n');
    out.print( loginResponse );
    To use it remove the -- and comment out the out.flush() and out.print() statementts above
--%>
<%--=loginResponse--%>