<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Trainer Registration Form</title>
  <style>
  /* Import Google font - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
body {
  min-height: 90vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  background: #131b2b;
}
.container {
  position: relative;
  max-width: 550px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}
/* Add styles for navbar */
    .navbar {
      position: fixed; /* Make navbar fixed */
      top: 0;
      left: 0;
      width: 100%;
      background-color: #1e2735; /* Customize navbar background color */
      color: #fff; /* Customize navbar text color */
      padding: 10px 20px;
      z-index: 1000; /* Ensure navbar stays on top */
    }
    .navbar a {
      color: #fff; /* Customize link color */
      text-decoration: none;
      margin-right: 20px;
    }
    .container {
      position: relative;
      max-width: 550px;
      width: 100%;
      background: #fff;
      padding: 25px;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      margin-top: 60px; /* Add margin to push content below navbar */
    }
.container header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}
.container .form {
  margin-top: 30px;
}
.form .input-box {
  width: 100%;
  margin-top: 20px;
}
.input-box label {
  color: #333;
}
.form :where(.input-box input, .select-box) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.form .gender-box {
  margin-top: 20px;
}
.gender-box h3 {
  color: #333;
  font-size: 1rem;
  font-weight: 400;
  margin-bottom: 8px;
}
.form :where(.gender-option, .gender) {
  display: flex;
  align-items: center;
  column-gap: 50px;
  flex-wrap: wrap;
}
.form .gender {
  column-gap: 5px;
}
.gender input {
  accent-color: rgb(130, 106, 251);
}
.form :where(.gender input, .gender label) {
  cursor: pointer;
}
.gender label {
  color: #707070;
}
.address :where(input, .select-box) {
  margin-top: 15px;
}
.select-box select {
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  color: #707070;
  font-size: 1rem;
}

/*Responsive*/
@media screen and (max-width: 500px) {
  .form .column {
    flex-wrap: wrap;
  }
  .form :where(.gender-option, .gender) {
    row-gap: 15px;
  }
}
  </style>
</head>
<body>
<nav class="navbar">
  <a href="home.jsp" class="back-link">&#8592; Go Back</a>
</nav>


  <section class="container">
    <header>Trainer Registration Form</header>
    <form id="trainerForm"  class="form" action="TrainerSignupServlet" method="POST">
      <div class="input-box">
        <label>Full Name</label>
        <input id="full_name" name="full_name" type="text" placeholder="Enter full name" required />
      </div>

      <div class="input-box" >
        <label>Email Address</label>
        <input id="email" name="email" type="text" placeholder="Enter email address" required />
        <div id="email_error" style="color: red; font-size: 10px;"></div>
      </div>

      <div class="column" >
        <div class="input-box">
          <label>Phone Number</label>
          <input id="phone_number" name="phone_number" maxlength="10" type="number" placeholder="Enter phone number" required />
          <div id="phone_number_error" style="color: red; font-size: 10px;"></div>
        </div>
        <div class="input-box">
          <label>Birth Date</label>
          <input id="birth_date" name="birth_date" type="date" placeholder="Enter birth date" required />
        </div>
      </div>
      <div class="gender-box">
        <h3>Gender</h3>
        <div class="gender-option">
          <div class="gender">
            <input type="radio" id="check-male" name="gender" value="male" checked />
            <label for="check-male">male</label>
          </div>
          <div class="gender">
            <input type="radio" id="check-female" name="gender" value="female" />
            <label for="check-female">Female</label>
          </div>
          <div class="gender">
            <input type="radio" id="check-other" name="gender" value="prefer_not_to_say" />
            <label for="check-other">prefer not to say</label>
          </div>
        </div>
      </div>
      <div class="input-box address">
        <label>Address</label>
        <input id="address_line1" name="address_line1" type="text" placeholder="Enter street address" required />
        <input id="address_line2" name="address_line2" type="text" placeholder="Enter street address line 2" required />
        <div class="column">
          <div class="select-box">
            <select id="country" name="country">
              <option hidden="">Select Country</option>
              <option>America</option>
              <option>Japan</option>
              <option>India</option>
              <option>Nepal</option>
            </select>
          </div>
          <input id="city" name="city" type="text" placeholder="Enter your city" required />
        </div>
        <div class="column">
          <input id="region" name="region" type="text" placeholder="Enter your region" required />
          <input id="postal_code" name="postal_code" type="number" placeholder="Enter postal code" required />
        </div>
      </div>
      <input type="submit" value="Signup" style="height: 55px; width: 100%; color: #fff; font-size: 1rem; font-weight: 400; margin-top: 30px; border: none; cursor: pointer; transition: all 0.2s ease; background: rgb(83, 230, 115);" 
      onmouseover="this.style.background='rgb(39, 218, 78)'" onmouseout="this.style.background='rgb(83, 230, 115)'"/>

    </form>
  </section>
<script>
//Get references to the form and input elements
const form = document.getElementById('trainerForm');
const fullNameInput = document.getElementById('full_name');
const emailInput = document.getElementById('email');
const emailError = document.getElementById('email_error');
const phoneNumberInput = document.getElementById('phone_number');
const phoneNumberError = document.getElementById('phone_number_error');
const birthDateInput = document.getElementById('birth_date');
const addressLine1Input = document.getElementById('address_line1');
const addressLine2Input = document.getElementById('address_line2');
const countrySelect = document.getElementById('country');
const cityInput = document.getElementById('city');
const regionInput = document.getElementById('region');
const postalCodeInput = document.getElementById('postal_code');

// Add event listeners
form.addEventListener('submit', validateForm);
emailInput.addEventListener('input', validateEmail);
phoneNumberInput.addEventListener('input', validatePhoneNumber);

// Validation functions
function validateForm(event) {
  event.preventDefault(); // Prevent form submission

  // Validate inputs
  const isFullNameValid = validateFullName();
  const isEmailValid = validateEmail();
  const isPhoneNumberValid = validatePhoneNumber();
  const isBirthDateValid = validateBirthDate();
  const isAddressValid = validateAddress();

  // If all inputs are valid, submit the form
  if (isFullNameValid && isEmailValid && isPhoneNumberValid && isBirthDateValid && isAddressValid) {
    form.submit();
  }
}

function validateFullName() {
  const fullName = fullNameInput.value.trim();
  return fullName.length > 0;
}

function validateEmail() {
  const email = emailInput.value.trim();
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const isValid = emailRegex.test(email);

  if (isValid) {
    emailError.textContent = '';
  } else {
    emailError.textContent = 'Please enter a valid email address.';
  }

  return isValid;
}

function validatePhoneNumber() {
	// Remove any non-digit characters from the input value
	  let phoneNumber = phoneNumberInput.value.replace(/\D/g, '');

	  // Truncate the input value if it exceeds 10 characters
	  if (phoneNumber.length > 10) {
	    phoneNumber = phoneNumber.slice(0, 10);
	    phoneNumberInput.value = phoneNumber;
	  }

	  const isValid = phoneNumber.length === 10;

	  if (isValid) {
	    phoneNumberError.textContent = '';
	  } else {
	    phoneNumberError.textContent = 'Please enter a valid 10-digit phone number.';
	  }

	  return isValid;
	}

function validateBirthDate() {
  const birthDate = new Date(birthDateInput.value);
  const today = new Date();
  const minDate = new Date(today.getFullYear() - 100, today.getMonth(), today.getDate());
  const maxDate = new Date(today.getFullYear() - 18, today.getMonth(), today.getDate());

  return birthDate >= minDate && birthDate <= maxDate;
}

function validateAddress() {
  const addressLine1 = addressLine1Input.value.trim();
  const addressLine2 = addressLine2Input.value.trim();
  const country = countrySelect.value;
  const city = cityInput.value.trim();
  const region = regionInput.value.trim();
  const postalCode = postalCodeInput.value.trim();

  return (
    addressLine1.length > 0 &&
    country !== 'Select Country' &&
    city.length > 0 &&
    region.length > 0 &&
    postalCode.length > 0
  );
}
</script>



</body>
</html>
