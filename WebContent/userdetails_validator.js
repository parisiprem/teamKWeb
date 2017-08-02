/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var ajaxRequest;  // The variable that makes Ajax possible!  Only if you need to support older browsers
var target = null;
var respText = "";

//validateUserId();

// This function checks if your browser is compatiable with running ajax
// Only used if you need to support older browsers
function ajaxFunction()
{
    if (window.XMLHttpRequest)
    {
        // Opera 8.0+, Firefox, Safari
        ajaxRequest = new XMLHttpRequest();
        // Internet Explorer Browsers
    }else
    {
        try
        {
            ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
        }catch (e) 
        {
            try
            {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
            }catch (e)
            {
                // Something went wrong
                return false;
            }
        }
    }
   return true;
}

// This function is going to read the user ID from a form, send it to the server
// for verification
function validateUserId() 
{
    var userName = document.getElementById("f_userid");
    var userPwd = document.getElementById("f_pwd");
    var url_to_call = "validate.jsp?id=" + escape(userName.value) + "&password=" + escape(userPwd.value);
    $.ajax({url: url_to_call, success: function( result )
    {
       //$("#userIdMessage").html( result ); 
        setMessageUsingDOM( result );
    }});
}

function validateUserId_older_browsers() 
{
    // USe the code below to support older browsers
    if( ajaxFunction() )
    {
        // Here processRequest() is the callback function.
        ajaxRequest.onreadystatechange = processRequest;

        var userName = document.getElementById("f_userid");
        var userPwd = document.getElementById("f_pwd");
        var url = "validate.jsp?id=" + escape(userName.value) + "&password=" + escape(userPwd.value);

        ajaxRequest.open("GET", url, true);
        ajaxRequest.send();
    }
}

// This function is the callback from ajax when it receives a response back
// from the server, used by validateUserId() to support older browsers
function processRequest() 
{
   if (ajaxRequest.readyState === 4) // request has been processed by server
   {
        if (ajaxRequest.status === 200) // server status is good
        {
            respText = ajaxRequest.responseText;
            setMessageUsingDOM( respText );
        }
        else if (ajaxRequest.status === 404) // page not found
        {
            setMessageUsingDOM( "404" );
        }
        else if (ajaxRequest.status === 500) // page not found
        {
            setMessageUsingDOM( "500 - Internal Server Error" );
        }
   }
}

// This function is then used to update the DOM in the web page
function setMessageUsingDOM(message) 
{
    var userMessageElement = document.getElementById("userIdMessage");
    var color;
    var target = $("#userIdMessage");
    message = $.trim( message );
    // same as code below
    //var target = escape( document.getElementById("userid").value);
   
    if( userMessageElement !== null )
    {
        if(message.indexOf("INVALID") > -1) 
        {
            color = "red";
            $('#userIdMessage').html(message);
        }
        else 
        {
            $('#userIdMessage').html("<p>DEBUG JSON Representation from the server: " + message + "</p>");
            userMessageElement.style.color = "red";
            var items = [];
            var user = JSON.parse(message);
            
            var existingElement = $("#" + user.userID );
            
            if( existingElement.length > 0 )
                $("#" + user.userID ).remove();
            
            items.push( "<li id='" + user.userID + "'>" + user.userID + "->" + user.userPwd + "</li>" );
            
            var userList = $( "<ul/>", {
                "class": "dbgrads",
                html: items.join( "" )
            });
            userList.appendTo( "body" );
            
            $('#userIdMessage').html("<p>JSON Representation from the server: " + message + "</p>");
            color = "green";
        }
        userMessageElement.style.color = color;
    }
    else
        $('#userIdMessage').html("<div>ERROR IN PAGE</div>");
}