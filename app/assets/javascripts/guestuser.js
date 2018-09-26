$(document).on("turbolinks:load", function(){
    var emailField = document.getElementsByClassName('email-field')[0];
    var passwordField = document.getElementsByClassName('password-field')[0];
    var guestUserBtn = document.getElementsByClassName('guest-user-btn')[0];

    guestUserBtn.addEventListener("click", function(){  
        emailField.value = 'guestuser@gmail.com'
        passwordField.value =  'jessica' 
    })
})