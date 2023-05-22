const email = document.getElementById('email');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirm_password');
const uniqueId = document.getElementById('username');
const telephoneNumber = document.getElementById('phone');
const signUpButton = document.getElementById('signup-button');
const confirmPasswordError = document.getElementById('confirm_password_error');


function validateRegPage() {
  if (email.value == '') {
    alert('Email is required');
  }
  else if (password.value == '') {
    alert('Password is required');
  }
  else if (/\S+/.test(email.value) === false) {
    alert('Email must not be blank');
    return false;
  }
  const emailRegex = /^\S+@\S+\.\S+$/;
  if (emailRegex.test(email.value) === false) {
    alert('Email format is not valid');
  }

  const regex = /^[0-9]*$/;
  if (regex.test(telephoneNumber.value) === false) {
    alert('phone must no contain any characterss')
  }



  else if (/\S+/.test(password.value) === false) {
    alert('Password must not be blank');
  }
  const passwordRegex = /^(?=.*\d).+$/;
  if (passwordRegex.test(password.value) === false) {
    alert('Password must contain at least one numeric value');
  }
  const passwordRegex1 = /^(?=.*[A-Z]).+$/;
  if (passwordRegex1.test(password.value) === false) {
    alert('Password must contain at least one uppercase letter');
  }
  const passwordRegex2 = /^(?=.*[!@#$%^&*]).+$/;
  if (passwordRegex2.test(password.value) === false) {
    alert('Password must contain at least one special character (!@#$%^&*)');
  }
  else
    return true;
  if (password.value.length < 8) {
    alert('Password must be at least 8 characters long');
  }

  if (confirmPassword.value === '') {
    alert('T13 Confirm Password - Confirm Password must not be blank');
  } else {
    return true;
  }

  
 

}






