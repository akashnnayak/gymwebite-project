<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Create a New Account</title>
    <style>
        /* Container styling */
        body {
            background-color: #131b2b;
            min-height: 95vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* Add styles for navbar */
        .navbar {
            position: fixed; /* Make navbar fixed */
            top: 0;
            left: 0;
            width: 100%;
            background-color: #1e2735; /* Customize navbar background color */
            color: #fff; /* Customize navbar text color */
            padding: 20px 30px;
            z-index: 1000; /* Ensure navbar stays on top */
        }

        .navbar a {
            color: #fff; /* Customize link color */
            text-decoration: none;
            margin-right: 20px;
        }

        .note {
            position: absolute;
            top: 130px; /* Adjust top distance as needed */
            right: 20px; /* Adjust right distance as needed */
            width: 300px;
            background-color: #cfe2f3;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
        }

        /* Add styles for container */
        .container {
            max-width: 400px;
            width: 500px;
            margin: 0 auto;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #cfe2f3;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-top: 91px; /* Adjust top margin to create space below note */
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        /* Title styling */
        .title {
            display: block;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            font-family: 'Poppins', sans-serif;
        }

        h6 {
            text-align: center;
            font-size: 12px;
            margin-bottom: 20px;
            font-family: Arial, sans-serif;
        }

        /* Input field styling */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Ensure padding doesn't increase width */
        }

        /* Submit button styling */
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #4caf50;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .login-link {
            text-align: center;
        }

        .login-link a {
            color: blue;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <a href="home.jsp" class="back-link">&#8592; Go Back</a>
</nav>

<div class="note">
    <strong>Read Me</strong><br>
    <ul>
        <li>Username must be between 3 and 25 characters, alphanumeric, underscore, or dash.</li>
        <li>Email must be in a valid format and less than 100 characters.</li>
        <li>Password must be between 8 and 20 characters, containing at least one uppercase letter, one lowercase letter, one digit, and one special character. Common passwords are not allowed.</li>
        <li>Location selection is required.</li>
    </ul>
</div>

<div class="container">
    <span class="title">Sign Up</span>
    <h6>Create a New Account</h6>
    <form action="SignupServlet" method="post" onsubmit="return validateForm()">
        <div>
            UserName: <input type="text" name="name1"  id="name1"  required onblur="validateUsername()"> <br/>
            <div id="username-error" style="color: red; font-size: 14px;"></div>
            <div>
                Email: <input type="email" name="email1" id="email1" required onblur="validateEmail()">
                <div id="email_error" style="color: red; font-size: 14px;"></div>
            </div>
            <div>
                password: <input type="password" name="pass1" id="pass1" required onblur="validatePassword()">
                <div id="password_error" style="color: red; font-size: 14px;"></div>
            </div>
            <br/>
            <select name="country" id="country" required>
                <option value="" disabled selected>Select Your location</option>
                <option value="bandra">Bandra</option>
                <option value="vasai">Vasai</option>
                <option value="virar">Virar</option>
                <option value="nallasopara">Nallasopara</option>
                <option value="thane">Thane</option>
                <option value="kalyan">Kalyan</option>
                <option value="dombivli">Dombivli</option>
                <option value="panvel">Panvel</option>
                <option value="bhiwandi">Bhiwandi</option>
            </select>
            <div id="country_error" style="color: red; font-size: 14px;"></div> <br/>

            <input type="submit" Value="Signup" />
            <p class="login-link">Already have an account? <a href="loginpage.jsp">Login now</a></p>
        </div>
    </form>
</div>

<script>
    function validateForm() {
        return validateUsername() && validateEmail() && validatePassword() && validateCountry();
    }

    function validateUsername() {
        var username = document.getElementById("name1").value.trim();
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
        var email = document.getElementById("email1").value.trim();
        var emailError = document.getElementById("email_error");

        if (email === "") {
            emailError.innerText = "Email is required.";
            return false;
        } else if (!email.match(/[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}/)) {
            emailError.innerText = "Invalid email format.";
            return false;
        } else if (email.length > 100) {
            emailError.innerText = "Email is too long.";
            return false;
        } else {
            emailError.innerText = "";
            return true;
        }
    }

    function validatePassword() {
        var password = document.getElementById("pass1").value;
        var passwordError = document.getElementById("password_error");

        // Presence Validation
        if (password === "") {
            passwordError.innerText = "Password is required.";
            return false;
        }

        // Length Validation
        if (password.length < 8 || password.length > 20) {
            passwordError.innerText = "Password must be between 8 and 20 characters.";
            return false;
        }

        // Complexity Validation: Require a combination of characters (uppercase, lowercase, digits, special characters)
        var hasUppercase = /[A-Z]/.test(password);
        var hasLowercase = /[a-z]/.test(password);
        var hasDigit = /\d/.test(password);
        var hasSpecialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password);

        if (!(hasUppercase && hasLowercase && hasDigit && hasSpecialChar)) {
            passwordError.innerText = "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
            return false;
        }

        // Common Password Check: Prevent the use of common or easily guessable passwords
        var commonPasswords = ["password", "123456", "qwerty", "abc123"]; // Add more common passwords as needed
        if (commonPasswords.includes(password.toLowerCase())) {
            passwordError.innerText = "Password is too common or easily guessable.";
            return false;
        }

        // If all validations pass, clear error message and return true
        passwordError.innerText = "";
        return true;
    }

    function validateCountry() {
        var country = document.getElementById("country").value;
        var countryError = document.getElementById("country_error");

        // Check if the selected option is the default "Select City" option
        if (country === "") {
            countryError.innerText = "Please select a country.";
            return false;
        }

        // Reset country error message if selection is valid
        countryError.innerText = "";
        return true;
    }
</script>

</body>
</html>
