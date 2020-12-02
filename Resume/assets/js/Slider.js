//自動2秒一次
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");//取得所有 class 為 “mySlides” 的元素：
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  /*圖片消失*/
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  slides[slideIndex-1].style.display = "block"; /*圖片出現*/
  
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}