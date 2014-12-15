var errorColor = "red";
var defaultColor = "#d3d3d3";
var maxLengthBio = 1000;
var maxLengthPub = 300;
var maxLengthWord = 30;
var default_regex = /\s*\w+\s*?\w+?\s*?\w+/;
var phone_num_regex = /^\d{10}$/;
var email_regex = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
var url_regex = /^$|http(s?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/;

function validateBio(x) {
    return setElementBorder(!(default_regex.test(x.value) && x.value.length <= maxLengthBio), x);
}

function validateName(x) {
    return setElementBorder(!(default_regex.test(x.value) && x.value.length <= maxLengthWord), x);
}

function validatePhone(x) {
    return setElementBorder(!phone_num_regex.test(x.value), x);
}

function validateEmail(x) {
    return setElementBorder(!email_regex.test(x.value), x);
}

function validateUrl(x) {
    return setElementBorder(!url_regex.test(x.value), x);
}

function validateKeywords() {
    var divs = document.getElementsByTagName("input"), item, keywords = [], flag = true;
    for (var i = 0, len = divs.length; i < len; i++) {
        item = divs[i];
        if (item.id && item.id.indexOf("key_word_") == 0) {
            keywords.push(item);
            flag = flag && validateName(item);
        }
    }

    for (var i = 0, len = keywords.length; i < len; i++) {
        setElementBorder(flag, keywords[i]);
    }
    return flag;
}

function validatePublications() {
    var divs = document.getElementsByTagName("textarea"), item, pub = [], url = [], flag = false;
    for (var i = 0, len = divs.length; i < len; i++) {
        item = divs[i];
        if (item.id && item.id.indexOf("pub_title_") == 0) {
            pub.push(item);
        } else if (item.id && item.id.indexOf("pub_url_") == 0) {
            url.push(item);
        }
    }

    for (var i = 0, len = pub.length; i < len; i++) {
        flag = flag || validateUrl(url[i]);
        if(!(url[i].value == '' && pub[i].value == '')) {
            flag = setElementBorder(!(default_regex.test(pub[i].value) && pub[i].value.length <= maxLengthPub), pub[i])|| flag;
        } else {
            setElementBorder(false, pub[i]);
        }
    }
    return flag;
}

function validateForm() {
    if (validateName(document.getElementById('id_name'))) {
        alert('Name cannot be empty or more than ' + maxLengthWord + ' characters');
        return false;
    } else if (validateBio(document.getElementById('id_bio'))) {
        alert('Bio has to be between 3 - ' + maxLengthBio + ' characters in length');
        return false;
    } else if (validatePhone(document.getElementById('id_phone'))) {
        alert('Phone number is of wrong format');
        return false;
    } else if (validateEmail(document.getElementById('id_email'))) {
        alert('Email is of wrong format');
        return false;
    } else if(validateUrl(document.getElementById('id_website'))) {
        alert('Website is of wrong format');
        return false;
    } else if(validateKeywords()) {
        alert('You need to provide at least one keyword');
        return false;
    } else if(validatePublications()) {
        alert('Publications is of wrong format');
        return false;
    } else {
        return true;
    }
}

function validateAdminForm() {
    if (validateEmail(document.getElementById('tb_add_user'))) {
        alert('Email is of wrong or invalid format');
        return false
    }
}

function setElementBorder(error, elem) {
    elem.style.borderColor = error ? errorColor : defaultColor;
    return error;
}