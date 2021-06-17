function toggleAlert() {
    _clickAlertCloseBtn();
    setTimeout(() => {
        _removeAlert(document.querySelector('.alert-flash'));
    }, 5000);
}

function _removeAlert(elt) {
    if (elt) {
        elt.style.top = '-6rem';
        elt.style.opacity = 0;
    }
}

function _clickAlertCloseBtn() {
    if (document.querySelector('.alert-flash .btn-close')) {
        let elt = document.querySelector('.alert-flash .btn-close');
        elt.addEventListener('click', (e) => {
            e.preventDefault();
            _removeAlert(e.srcElement.parentElement.parentElement);
        }, false);
    }
}


//Loaded page
document.addEventListener('DOMContentLoaded', () => {
    toggleAlert();
}, false);