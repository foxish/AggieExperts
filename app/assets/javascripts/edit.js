var errorColor = "red";
var defaultColor = "#d3d3d3";
var maxLength = 1000;

function validateForm() {
    var divs = document.getElementsByTagName("input"), item, j = 0;
    for (var i = 0, len = divs.length; i < len; i++) {
        item = divs[i];
        if (item.id && item.id.indexOf("pub_url_") == 0) {
            j++;
            if(_validateUrl(item)) {
                alert('Publication URL ' + j + ' is of wrong format');
                return false;
            }
        }
    }

    if(_validateText(document.getElementById('id_name'))) {
        alert('Name cannot be empty');
        return false;
    } else if (_validateBio(document.getElementById('id_bio'))) {
        alert('Bio cannot be empty or more than ' + maxLength + ' characters');
        return false;
    } else if (_validatePhone(document.getElementById('id_phone'))) {
        alert('Phone number is of wrong format');
        return false;
    } else if (_validateEmail(document.getElementById('id_email'))) {
        alert('Email is of wrong format');
        return false;
    } else if (_validateUrl(document.getElementById('id_website'))) {
        alert('Website URL is of wrong format');
        return false;
    } else if (_validateKeywords()) {
        alert('You need to provide at least one keyword');
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

function validateBio(x) {
    if(_validateBio(x)) {
        x.style.borderColor = errorColor;
    } else {
        x.style.borderColor = defaultColor;
    }
}

function validateKeywords() {
    if (_validateKeywords()) {
        var divs = document.getElementsByTagName("input"), item;
        for (var i = 0, len = divs.length; i < len; i++) {
            item = divs[i];
            if (item.id && item.id.indexOf("key_word_") == 0) {
                item.style.borderColor = errorColor;
            }
        }
    } else {
        var divs = document.getElementsByTagName("input"), item;
        for (var i = 0, len = divs.length; i < len; i++) {
            item = divs[i];
            if (item.id && item.id.indexOf("key_word_") == 0) {
                item.style.borderColor = defaultColor;
            }
        }
    }
}

function _validateBio(x) {
    return _validateText(x) ? true : x.value.length > maxLength
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
    return (x.value==null | /^\s*$/.test(x.value)) ? true : false;
}

function _validateUrl(x) {
    var re = /^http(s?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/;
    return  (x.value==null | /^\s*$/.test(x.value)) ? false : !re.test(x.value);
}

function _validateKeywords() {
    var divs = document.getElementsByTagName("input"), item;
    for (var i = 0, len = divs.length; i < len; i++) {
        item = divs[i];
        if (item.id && item.id.indexOf("key_word_") == 0) {
            if (!_validateText(item)) {
                return false;
            }
        }
    }
    return true;
}