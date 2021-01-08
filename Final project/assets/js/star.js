window.onload = function(){
    var star = document.getElementById("star");
      var star_li = star.getElementsByTagName("li");
      var star_word = document.getElementById("star_word");
     
      var i=0;
      var j=0;
      var len = star_li.length;
      var word = ['1','2','3',"4","5"]
     
      for(i=0; i<len; i++){
        star_li[i].index = i;
                                   
          star_li[i].onmouseover = function(){
                    star_word.style.display = "block";
                  star_word.innerHTML = word[this.index]+" / 5 ";
                  for(i=0; i<len; i++){
                      if(i<=this.index)
                      {
                          star_li[i].className = "act";	

                      }
                     else
                     {
                             star_li[i].className = "";
                     }
                }
                     
          }
         

      }

  }