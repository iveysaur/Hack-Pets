function get(url, callback) {
    var xhr = new XMLHttpRequest;
    xhr.onload = function() {
        callback(JSON.parse(xhr.responseText));
    };
    xhr.open("GET", url);
    xhr.setRequestHeader("x-x", document.cookie.substring(2));
    xhr.send();
}

function post(url, obj, callback) {
    var xhr = new XMLHttpRequest;
    xhr.onload = function() {
        callback(JSON.parse(xhr.responseText));
    };
    xhr.open("POST", url);
    xhr.setRequestHeader("x-x", document.cookie.substring(2));
    xhr.send(JSON.stringify(obj));
}

