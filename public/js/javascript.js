//  JS for scrolling button
let scroll = document.getElementById("scrollTop");
scroll.addEventListener('click', function(){
  scrollTo({top: 0,
    behavior: "smooth"})
});
// Animated Jumbotron

let i = 0;
let txt = "The Hernandez Family, Missionaries to Guatemala."
let speed = 99;

function animate () {
    if (i < txt.length) {
        document.getElementById("animateHeader").innerHTML += txt.charAt(i);
        i++;
        setTimeout(animate, speed);

    }
};
animate();
