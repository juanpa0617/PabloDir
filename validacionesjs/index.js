const pass = document.getElementById("password");
const rpass = document.getElementById("rpassword");
const icons = document.querySelectorAll(".eye-password");

icons.forEach(icon => {
    icon.addEventListener("click", e => {
        if (pass.type === "password" && rpass.type === "password") {
            pass.type = "text";
            rpass.type = "text";
            icons.forEach(icon => {
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            });
        } else {
            pass.type = "password";
            rpass.type = "password";
            icons.forEach(icon => {
                icon.classList.add('fa-eye');
                icon.classList.remove('fa-eye-slash');
            });
        }
    });
});

let id = (id) => document.getElementById(id);

let classes = (classes) => document.getElementsByClassName(classes);

let name = id("name");
let lastname = id("lastname");
let birthdate = id("birthdate");
let country = id("country");
let state = id("state");
let postal = id("postal");
let email = id("email");
let password = id("password");
let rpassword = id("rpassword");
let terminos = id("checkbox");
let form = id("form");

form.addEventListener("submit", (e) => {
    e.preventDefault();

    engine(name, 0, "Please enter your name");
    engine(lastname, 1, "Please enter your lastname");
    engine(birthdate, 2, "Please enter your birthdate");
    engine(country, 3, "Please select your country");
    engine(state, 4, "Please enter your state");
    engine(postal, 5, "Please enter your postal code");
    engine(email, 6, "Please enter your email");
    engine(password, 7, "Please enter your password");
    engine(rpassword, 8, "Please enter your password");
    engineCheckbox(terminos, 9, "Please accept terms and conditions");
});

let engine = (element, serial, message) => {
    let Erromsg = element.nextElementSibling;
    let failureIcon = classes("failure-icon")[serial];
    let successIcon = classes("success-icon")[serial];

    if (password.value)

    if (element.tagName.toLowerCase() === "select") {
        if (element.value === "seleccionar") {
            Erromsg.innerHTML = message;
            element.style.border = "2px solid red";
            failureIcon.style.opacity = "1";
            successIcon.style.opacity = "0";
            return;
        }
    }

    if (element.value.trim() === "") {
        Erromsg.innerHTML = message;
        element.style.border = "2px solid red";
        failureIcon.style.opacity = "1";
        successIcon.style.opacity = "0";
    } else {
        Erromsg.innerHTML = "";
        element.style.border = "2px solid green";
        failureIcon.style.opacity = "0";
        successIcon.style.opacity = "1";
    }
};

let engineCheckbox = (checkbox, serial, message) => {
    let Erromsg = checkbox.nextElementSibling;
    let failureIcon = classes("failure-icon")[serial];
    let successIcon = classes("success-icon")[serial];

    if (!checkbox.checked) {
        Erromsg.innerHTML = message;
        failureIcon.style.opacity = "1";
        successIcon.style.opacity = "0";
    } else {
        Erromsg.innerHTML = "";
        failureIcon.style.opacity = "0";
        successIcon.style.opacity = "1";
    }
};
