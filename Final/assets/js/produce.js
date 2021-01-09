var slideIndex = 1;
showSlides(slideIndex);


function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}


function rew_show() {
  document.getElementById("rew_write").classList.toggle("show");
}		
function rew_show2() {
  document.getElementById("rew_write2").classList.toggle("show");
}	
function rew_show3() {
  document.getElementById("rew_write3").classList.toggle("show");
}			
function rew_show4() {
  document.getElementById("rew_write4").classList.toggle("show");
}	
function rew_show5() {
  document.getElementById("rew_write5").classList.toggle("show");
}	

