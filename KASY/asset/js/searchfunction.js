function myFunction() {
    var input1, filter, ul, li, a, i, txtValue;
    input1 = document.getElementById("input1");
    filter = input1.value.toUpperCase();
    ul = document.getElementById("search-btn");
    li = ul.getElementsByTagName(".PN");
    for (i = 0; i < li.length; i++) {
      a = li[i].getElementsByTagName("h4")[0];
      txtValue = a.textContent || a.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        li[i].style.display = "";
      } else {
        li[i].style.display = "none";
      }
    }
  }