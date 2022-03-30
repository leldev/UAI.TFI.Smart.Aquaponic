var ready = (callback) => {
    if (document.readyState != "loading") callback();
    else document.addEventListener("DOMContentLoaded", callback);
}

var sa = {
    module: {},
    control: {},
    util: {}
};

sa.control = {
    password: '',
    username: '',
    name: '',
    lastname: '',
}

sa.util = {
    validateForm: () => {
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, (form) => {
                    form.addEventListener('submit', (event) => {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    },
    getRamdonPassword: () => {
        return Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
    },
}

sa.module.user = {
    setPassword: (selector) => {
        document.querySelector(selector).value = sa.util.getRamdonPassword();
    },
    createUsername: (nameSelector, lastnameSelector, target) => {
        var username = document.querySelector(target);
        var name = document.querySelector(nameSelector);
        var lastname = document.querySelector(lastnameSelector);

        username.value = (name.value.replace(/ /g, "") + '.' + lastname.value.replace(/ /g, "")).trim().toLowerCase();
    }
}