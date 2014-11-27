var errorColor = "red";
var defaultColor = "#d3d3d3";

function validateForm() {
    if(_validateText(document.getElementById('id_name'))) {
        alert('Name cannot be empty');
        return false;
    } else if (_validatePhone(document.getElementById('id_phone'))) {
        alert('Phone number is of wrong format');
        return false;
    } else if (_validateEmail(document.getElementById('id_email'))) {
        alert('Email is of wrong format');
        return false;
    } else {
        return true;
    }
}

function validateEmail(email) {
    if(_validateEmail(email)) {
        email.style.borderColor = errorColor;
    } else {
        email.style.borderColor = defaultColor;
    }
}

function validatePhone(phone) {
    if(_validatePhone(phone)) {
        phone.style.borderColor = errorColor;
    } else {
        phone.style.borderColor = defaultColor;
    }
}

function validateUrl(url) {
    if(_validateUrl(url)) {
        url.style.borderColor = errorColor;
    } else {
        url.style.borderColor = defaultColor;
    }
}

function validateText(x) {
    if(_validateText(x)) {
        x.style.borderColor = errorColor;
    } else {
        x.style.borderColor = defaultColor;
    }
}

function _validateEmail(x) {
    var re = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    return !re.test(x.value);
}

function _validatePhone(x) {
    var re = /^\d{10}$/;
    return !re.test(x.value);
}

function _validateText(x) {
    return (x.value==null | x.value=="") ? true : false;
}

function _validateUrl(x) {
    var re = /^http(s?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/;
    return  (x.value==null | x.value=="") ? false : !re.test(x.value);
}