function fireTooltip() {
    if (document.querySelector('#small-carousel')) {
        let myCarousel = document.querySelector('#small-carousel');
        let carousel = new bootstrap.Carousel(myCarousel);
    }
}


//Loaded page
document.addEventListener('DOMContentLoaded', () => {
    fireTooltip();
}, false);