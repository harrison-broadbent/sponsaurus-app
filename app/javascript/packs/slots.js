// Javascript file for the Slots views.
console.log('loaded slots js')

// Copies the current url to the users clipboard,
// so that they can share their slots pages easily.

function copyShareURL() {
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
    btn.innerText = "Link copied to clipboard!"
}

// Copies code to embed the current url into another page.

function copyEmbedCode() {
    // creates a temporary element and copies from it.

    let temp_element = document.createElement('input'),
        text = window.location.href +  "/embed";

    let embed_code = `<iframe style="width: 80%; height: 400px; margin: 0 auto; border: none" src="${text}"></iframe>`

    document.body.appendChild(temp_element);
    temp_element.value = embed_code;
    temp_element.select();
    document.execCommand('copy');
    document.body.removeChild(temp_element);

    console.log("copied link!")

    let btn = document.getElementById("button__embed-link")
    btn.innerText = "Code copied to clipboard!"
}

if (document.getElementById("button__share-link")) {
    document.getElementById("button__share-link").addEventListener('click', copyShareURL)
    console.log("copied url")
}

if (document.getElementById("button__embed-link")) {
    document.getElementById("button__embed-link").addEventListener('click', copyEmbedCode)
    console.log("copied embed code")
}
