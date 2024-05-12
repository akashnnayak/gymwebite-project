<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="register.model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" href="login.css">
<script>
    function validateForm() {
        return validateUsername();
    }

    function validateUsername() {
        var username = document.getElementById("username").value.trim();
        var usernameError = document.getElementById("username-error");

        // Presence Validation
        if (username === "") {
            usernameError.innerText = "Username is required.";
            return false;
        }

        // Length Validation
        if (username.length < 3 || username.length > 25) {
            usernameError.innerText = "Username must be between 3 and 25 characters.";
            return false;
        }

        // No Spaces Validation
        if (/\s/.test(username)) {
            usernameError.innerText = "Username cannot contain spaces.";
            return false;
        }

        // Character Set Validation (Alphanumeric, underscore, and dash)
        if (!/^[a-zA-Z0-9_-]*$/.test(username)) {
            usernameError.innerText = "Username can only contain letters, numbers, underscores, and dashes.";
            return false;
        }

        // If all validations pass, hide the error message
        usernameError.innerText = "";
        return true;
    }
</script>
</head>
<body>
<nav class="navbar">
  <a href="home.jsp" class="back-link">&#8592; Go Back</a>
</nav>

<form action="LoginServlet" method="post" onsubmit="return validateForm()">
  <h3><b>Login</b></h3>

  <div class="container">
  
    <label for="username"><b>Username</b></label>
    <input type="text" placeholder="Enter Username"  id="username" name="username" required onblur="validateUsername()">
    <div id="username-error" style="color: red;"></div>
    
    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" id="password" name="password" required><br/>
    
    <button type="submit">Login</button>
    
      <p class="login-link">New Here? <a href="signup.jsp">Signup now</a></p>    
    
  </div>

  <div class="container" style="background-color: white">
    <button type="button" onclick="window.location.href='home.jsp'" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="forgotPassword.jsp">password?</a></span>
  </div>
  <%-- Check if errorMessage attribute is present in request scope --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <div style="color: red;">
            <%= request.getAttribute("errorMessage") %>
        </div>
    <% } %>
</form>

</body>
</html>
