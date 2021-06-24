function reloadFromBackBtn() {
    perfEntries = performance.getEntriesByType("navigation");

    if (perfEntries[0].type === "back_forward" || perfEntries[0].type === "navigate") {
        document.location.reload(true);
    }
}


//Loaded page
document.addEventListener('DOMContentLoaded', () => {
    reloadFromBackBtn();
}, false);
