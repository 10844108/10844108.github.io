var elements = document.getElementsByClassName("column1");


      var i;


      function listView() {
        for (i = 0; i < elements.length; i++) {
          elements[i].style.width = "83%";

        }
      }


      function gridView() {
        for (i = 0; i < elements.length; i++) {
          elements[i].style.width = "50%";
        }
      }

      var container = document.getElementById("btnContainer");
      var btns = container.getElementsByClassName("btn");
      for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function () {
          var current = document.getElementsByClassName("active");
          current[0].className = current[0].className.replace(" active", "");
          this.className += " active";
        });
      }