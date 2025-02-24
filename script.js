const selectedPoints = [];
const imageContainer = document.getElementById("imageContainer");

const images = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg"];
images.forEach((src, index) => {
    let img = new Image();
    img.src = "/static/images/" + src;
    let canvas = document.createElement("canvas");
    let ctx = canvas.getContext("2d");
    
    img.onload = () => {
        canvas.width = 300;
        canvas.height = 200;
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
    };

    canvas.addEventListener("click", function (event) {
        const rect = canvas.getBoundingClientRect();
        selectedPoints[index] = { x: event.clientX - rect.left, y: event.clientY - rect.top };
    });

    imageContainer.appendChild(canvas);
});

document.querySelector("form").addEventListener("submit", function () {
    document.getElementById("points").value = JSON.stringify(selectedPoints);
});
