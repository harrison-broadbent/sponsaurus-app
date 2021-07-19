// Copies the current url to the users clipboard,
// so that they can share their slots pages easily.

function shareURL() {
    // creates a temporary element and copies from it.

    let temp_element = document.createElement('input'),
        text = window.location.href;

    document.body.appendChild(temp_element);
    temp_element.value = text;
    temp_element.select();
    document.execCommand('copy');
    document.body.removeChild(temp_element);

    console.log("copied link!")

    let btn = document.getElementById("button__share-link")
    btn.className += " -bg-color-light-green"
    btn.innerText = "Copied to clipboard!"
}

document.getElementById("button__share-link").addEventListener('click', shareURL)
console.log("loaded slots.js")