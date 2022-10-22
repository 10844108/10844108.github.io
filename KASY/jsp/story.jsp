<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
	  int counter;
	  String strNo = (String)application.getAttribute("counter");//讀application變數
	  counter = Integer.parseInt(strNo); //轉成整數
	  if (session.isNew())
	  counter++;                                        //計數器加1
	  strNo = String.valueOf(counter);    //轉成字串
	  application.setAttribute("counter", strNo);//寫application變數
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../asset/css/header_footer.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../asset/css/story.css">
  <title>About_us</title>
</head>

<body>

  <div class="header">
    <div class="guide">
      <a href="index.jsp" alt="">
        <img src="../asset/image/logo.jpg">
      </a>
    </div>



    
    <form id="content"  action="search.jsp">
      <input type="text" name="input" class="input1" id="search-input">
      <button type="reset" class="search" id="search-btn"><a href="search.jsp"></button>
  </form>

  <%
  try {
  //Step 1: 載入資料庫驅動程式 
      Class.forName("com.mysql.jdbc.Driver");
      try {
  //Step 2: 建立連線 	
          String url="jdbc:mysql://localhost/?serverTimezone=UTC";
          String sql="";
          Connection con=DriverManager.getConnection(url,"root","10844108");
          if(con.isClosed()){
             out.println("連線建立失敗");
		 %>
		 
	<div class="guide_icon">
      <div class="guide_linkicon">
        <div class="tooltip2"><a href="login.jsp"><img src="../asset/image/person1.png" alt=""></a>
          <span class="tooltiptext2">登入/註冊</span></div>
        <div class="tooltip2"><a href="index.jsp"><img src="../asset/image/home.png" alt=""></a>
          <span class="tooltiptext2">首頁</span></div>
        <div class="tooltip2"><a href="product.jsp"><img src="../asset/image/store.png" alt=""></a>
          <span class="tooltiptext2">商品總覽</span></div>
        <div class="tooltip2"><a href="shopping.jsp"><img src="../asset/image/shopping.png" alt=""></a>
          <span class="tooltiptext2">購物車</span></div>
      </div>
    </div>
		 
<%
          }else {
  //Step 3: 選擇資料庫   
             sql="USE `store`";
             con.createStatement().execute(sql);
  %>
  
		<div class="guide_icon">
            <div class="guide_linkicon">
                <div class="tooltip2"><a href="member_profile.jsp"><img src="../asset/image/person1.png" alt=""></a>
                    <span class="tooltiptext2">會員資料</span></div>
                <div class="tooltip2"><a href="index.jsp"><img src="../asset/image/home.png" alt=""></a>
                    <span class="tooltiptext2">首頁</span></div>
                <div class="tooltip2"><a href="product.jsp"><img src="../asset/image/store.png" alt=""></a>
                    <span class="tooltiptext2">商品總覽</span></div>
                <div class="tooltip2"><a href="shopping.jsp"><img src="../asset/image/shopping.png" alt=""></a>
                    <span class="tooltiptext2">購物車</span></div>
            </div>
        </div>
    
    
  </div>


  <div id="all">
    <div id="wong">
      <div class="us">
        <img src="../asset/image/wong.jpg" class="headpic">
        <div>
          <a href="https://instagram.com/yuan.__wv?utm_medium=copy_link"><img src="../asset/image/ig.png"
              class="ig"></a>
          <a href="https://www.facebook.com/profile.php?id=100003690625025"><img src="../asset/image/fb.png"
              class="ig"></a>
        </div>
      </div>
      <div class="word">
        10844208 資管二乙 翁淑媛<br>
        <pre>

    透過這次期末專案的機會，讓我學習到更多多媒體技
巧的應用！以往在瀏覽各種網站時並不會特別去注意其架
構或是版面樣式，但在學習多媒體課程之後開始會留意網
站的美觀，從中學習更好的設計方式。即使這次專案的呈
現並不完美，但從中獲得實際操作的機會我想是更可貴的
！當然了，也非常感謝後段同學們的協助！更重要的是，
透過專案的練習機會，讓我可以將課程中所學習的的技能
實際應用，好開心！！</pre>
      </div>
    </div>

    <div id="liu">
      <div class="us">
        <img src="../asset/image/liu.jpg" class="headpic">
        <div>
          <a href="https://instagram.com/puchiapu22_?utm_medium=copy_link"><img src="../asset/image/ig.png"
              class="ig"></a>
          <a href="https://www.facebook.com/linda.luu.127"><img src="../asset/image/fb.png" class="ig"></a>
        </div>
      </div>
      <div class="word">
        10844248 資管二乙 劉佳淳<br>
        <pre>

  對我來說，這次的期末專案難度更高，因為對於一個
網頁的需求，不僅僅是要有功能，美觀也是一個網頁完
成度的重點，而我剛好又是一個沒有甚麼藝術細胞的人，
這次期末完全突破了我自己的設計能力以及排版能力，
以前做後端的時候常會想著，感覺前端簡單很多，但實
際操作後發現真的是我太天真，前端有不容易的地方，
後端也有不容易的地方，或許這就是期末專案要甲乙班
合作的原因，透過組員去互相學習，便能使這次的期末
專案比上一次的更完整。</pre>
      </div>
    </div>
    <div id="jian">
      <div class="us">
        <img src="../asset/image/jian.jpg" class="headpic1">
        <div>
          <a href="https://instagram.com/summer_051129?utm_medium=copy_link"><img src="../asset/image/ig.png"
              class="ig"></a>
          <a href="https://www.facebook.com/profile.php?id=100009031638506"><img src="../asset/image/fb.png"
              class="ig"></a>
        </div>
      </div>
      <div class="word">
        10844108 資管二甲 姜瑋庭<br>
        <pre>

  以前在做前端網站時，我就希望未來有能力能夠建
立後端系統，但真正接觸到後端，才發現前後端整合
真的有難度，後端需要了解前端的設計，但大家在撰
寫程式及命名的方面都會有差異，因此需要將html轉
成JSP時，我們需要思考讓每張網頁都能夠相關聯，並
且建立資料庫，做出完整的後端系統。最後非常感謝
我的夥伴與乙班夥伴，大家都積極的討論，遇到問題也
迅速的回覆與解決，並且網頁也很快繳交，讓我們有充
足的時間撰寫，很開心這次能跟夥伴們一起合作，我們
將課堂所學實際運用在專題，做出屬於我們的ASY。
</pre>
      </div>
    </div>
    <div id="lin">
      <div class="us">
        <img src="../asset/image/lin.jpg" class="headpic1">
        <div>
          <a href="https://instagram.com/hsuan_0203?utm_medium=copy_link"><img src="../asset/image/ig.png"
              class="ig"></a>
          <a href="https://www.facebook.com/profile.php?id=100005805035425"><img src="../asset/image/fb.png"
              class="ig"></a>
        </div>
      </div>
      <div class="word">
        10844143 資管二甲 林其萱<br>
        <pre>

  在觸碰過前端後端的應用後，我深深感覺到後端比前端還難
的痛苦，尤其現在又在上網課，不懂的操作也不方便跟夥伴做
討論，上老師所要求的基礎知識中我在java上是最欠缺的，大
一下學過的很多java知識也都已經忘得差不多，所以這次期末
專案我很多時間複習之前所學的java知識，將這學期JSP課程
中所掌握的一些關於java的東西搞清楚。在這次專案中，乙班
的同學做前端的網頁，我們甲班就負責後端JSP內部對象及內部對
象所對應的一些程式操作，再來就是JSP與資料庫的關聯，怎麼樣
匯入資料庫…等，之前上課都是跟著老師按部就班學習，下課後也
沒有去鞏固老師所講的內容，導致現在花很多時間自學加複習之
前所學的內容，只希望這次能將後端連結功能做好。最後很感謝
我的夥伴、乙班的夥伴們，他們在溝通、討論、交網頁上都很有
效率，做事也很有能力，藉這個機會能跟同學們透過一些專案報
告提高自己團隊合作的能力，我覺得是很好的一個體驗！！
    </pre>
      </div>
    </div>
  </div>



  <div class="footer">




    <a href="mailto:xw789025@gmail.com">
      <div id="chat" class="animated-chat tada">?</div>
    </a>

    <div class="copyright">copyright&copy;KASY 2021<br>拜訪人數:<%=counter%>位</div>
    <nav class="navbtn2">
      <div class="item1">
        <a href="story.jsp">
          <h3>關於我們</h3>
        </a>

      </div>
      <div class="item2">
        <a href="question.jsp">
          <h3>常見問題</h3>
        </a>

      </div>
      
    </nav>
    <button onclick="topFunction()" id="topBtn">
      <img src="../asset/image/top.png">
    </button>
  </div>



  <script src="../asset/js/search.js"></script>
  <script src="../asset/js/searchfunction.js"></script>
  <script src="../asset/js/top.js"></script>

  <%
    //Step 6: 關閉連線
    con.close();
  }
  }
  catch (SQLException sExec) {
     out.println("SQL錯誤"+sExec.toString());
  
  }
  }
  catch (ClassNotFoundException err) {
  out.println("class錯誤"+err.toString());
  }
  %>

</body>

</html>