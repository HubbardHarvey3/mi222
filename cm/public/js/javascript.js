//  JS for scrolling button
let scroll = document.getElementById("scrollTop");
let scrollTopContainer = document.getElementById("scrollTopContainer");
scroll.addEventListener('click', function(){
  scrollTo({top: 0,
    behavior: "smooth"})
});

// JS for detecting scrollY position and adding opacity to Top Button

 window.addEventListener('scroll', function(){
   let topbutton = window.scrollY
   if (topbutton > 0) {
     scrollTopContainer.classList.add("show");
     scrollTopContainer.classList.remove("hidden");
   } else {
     scrollTopContainer.classList.remove("show")
     scrollTopContainer.classList.add("hidden")
   }
 })

// Hamburger Drop Down and Font Awesome Icon Size

let hamburger = document.getElementById('hamburger');
let dropdownmenu = document.getElementById('dropdownmenu')


hamburger.addEventListener('click', function(){
  dropdownmenu.classList.toggle('showNav')
  dropdownmenu.classList.toggle('hideNav')
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
