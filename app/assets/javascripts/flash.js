function toggleAlert() {
    setTimeout(() => {
        _removeAlert(document.querySelector('.alert-flash'));
    }, 3000);
}

function _removeAlert(elt) {
    if (elt) {
        eltHeight = `-${elt.offsetHeight}px`;
        elt.style.bottom = eltHeight;
        elt.style.opacity = 0;
    }
}


//Loaded page
document.addEventListener('DOMContentLoaded', () => {
    toggleAlert();
}, false);