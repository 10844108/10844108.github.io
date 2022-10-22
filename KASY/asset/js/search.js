const input1 = document.getElementById("search-input");
const searchBtn = document.getElementById("search-btn");

const expand = () => {
  searchBtn.classList.toggle("close");
  input1.classList.toggle("square");
};

searchBtn.addEventListener("click", expand);





