<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <style>
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body style="background-color: #131b2b;">

<div class="container">
    <h4 style="text-align: center; margin-top: 50px; color:#40f564;"><span>HELLO ADMIN!!</span></h4>
    <h6 style="text-align: center;   color:#40f564;"><span>please login yourself!</span></h6><br/><br/>
    <div class="row justify-content-center">

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Admin Login
                </div>
                <div class="card-body">
                    <form id="loginForm" action="admin-login" method="post" onsubmit="return validateForm()">

                        <div class="mb-3">
                            <label for="username" class="form-label">Username:</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   onblur="validateUsername()">
                            <div id="username-error" class="error-message"></div>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" id="email" name="email"
                                   onblur="validateEmail()">
                            <div id="email-error" class="error-message"></div>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   onblur="validatePassword()">
                            <div id="password-error" class="error-message"></div>
                        </div>

                        <button type="submit" class="btn btn-primary me-2">Login</button>
                        <a href="home.jsp" class="btn btn-secondary">Cancel</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function validateForm() {
        return validateUsername() && validateEmail() && validatePassword();
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

    function validateEmail() {
        var email = document.getElementById("email").value.trim();
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            document.getElementById("email-error").innerText = "Invalid email address.";
            return false;
        } else {
            document.getElementById("email-error").innerText = "";
            return true;
        }
    }

    function validatePassword() {
        var password = document.getElementById("password").value.trim();
        if (password.length < 6) {
            document.getElementById("password-error").innerText = "Password must be at least 6 characters.";
            return false;
        } else {
            document.getElementById("password-error").innerText = "";
            return true;
        }
    }
</script>
</body>
</html>
