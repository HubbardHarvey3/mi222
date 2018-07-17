
    // Animated Jumbotron

let i = 0;
let txt = "Now I am playing around with an animated HEADER!!!  Also, look at the blinking cursor that follows the text!"
let speed = 99;

function animate () {
    if (i < txt.length) {
        document.getElementById("animateHeader").innerHTML += txt.charAt(i);
        i++;
        setTimeout(animate, speed);
        
    }
};
animate();

