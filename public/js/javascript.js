
//    Animated Jumbotron

let i = 0;
let txt = "Hey Adrian, Now I am playing around with an animated HEADER!!!"
let speed = 100;

function animate () {
    if (i < txt.length) {
        document.getElementById("animateHeader").innerHTML += txt.charAt(i);
        i++;
        setTimeout(animate, speed);
        
    }
};
animate();

