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
  <link rel="stylesheet" href="../asset/css/search.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>search</title>
</head>

<body>
  <%
  try {
    //Step 1: 載入資料庫驅動程式 
        Class.forName("com.mysql.jdbc.Driver");
        try {
    //Step 2: 建立連線 	
            String url="jdbc:mysql://localhost/?serverTimezone=UTC";
            String sql="";
            Connection con=DriverManager.getConnection(url,"root","10844108");
            if(con.isClosed())
               out.println("連線建立失敗");
            else {
    //Step 3: 選擇資料庫   
               sql="USE `kasy`";
               con.createStatement().execute(sql);
               //Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
               
               String name=request.getParameter("input");

               sql="SELECT * FROM list WHERE product_name LIKE '%"+name+"%' ";
               ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
               rs=con.createStatement().executeQuery(sql);
    %>
   <!--header開始-->
   <div class="header">
    <div class="guide">
      <a href="index.jsp" alt="">
        <img src="../asset/image/logo.jpg">
      </a>
    </div>



    <form method="GET" id="content" action="search.jsp">
      <input type="text" name="input" class="input1" id="search-input">
      <button type="reset" class="search" id="search-btn"><a href="search.jsp"></button>
    </form>


    



    <div class="guide_icon">
      <div class="guide_linkicon">
        <div class=tooltip2><a href="login.jsp"><img src="../asset/image/person1.png" alt=""></a>
        <span class="tooltiptext2">登入/註冊</span></div>
        <div class=tooltip2><a href="index.jsp"><img src="../asset/image/home.png" alt=""></a>
        <span class="tooltiptext2">首頁</span></div>
        <div class=tooltip2><a href="product.jsp"><img src="../asset/image/store.png" alt=""></a>
        <span class="tooltiptext2">商品總覽</span></div>
        <div class=tooltip2><a href="shopping.jsp"><img src="../asset/image/shopping.png" alt=""></a>
        <span class="tooltiptext2">購物車</span></div>
      </div>
    </div>
  </div>
<!--header結束-->
  


  <div>
    <div class="fli">

      <h2>以下為"<%out.println(name);%>"的搜尋結果</h2>



      <div class="custom-select" style="width:200px;">
        <select>
          <option value="0">自訂篩選</option>
          <option value="1">價高到低</option>
          <option value="2">價地到高</option>
          <option value="3">熱銷推薦</option>
          <option value="4">我的最愛</option>

        </select>
      </div>
    </div>



    <div id="btnContainer">
      <button class="btn" onclick="listView()"><i class="fa fa-bars"></i>List</button>
      <button class="btn active" onclick="gridView()"><i class="fa fa-th-large"></i> Grid</button>
    </div>
    <br>

    <div class="row1">
      <%while(rs.next()){ %>
      <div class="column1">
        
        <img src="../asset/image/<%= rs.getString(16)%>" alt="pot" style="width:90px">

        <p><span class="capital"><%out.println(rs.getString(3));%></span><br><span class="capital"> <%out.println(rs.getString(4));%></span></p>
        <p><span class="capital">顏色:</span><%out.println(rs.getString(6));%></p>
        <div class="star">
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star checked"></span>
          <span class="fa fa-star"></span>
          <span class="fa fa-star"></span>
        </div>
        <button class="button1"><a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>">點我看更多!</a></button>
        
      </div>
      <%}%>
    </div>



<!--Footer開始-->
<div class="footer">




   
  <!--會漂浮的問號:按了可以寄信-->
      <a href="mailto:xw789025@gmail.com"><div id="chat" class="animated-chat tada" >?</div></a>
      <!--漂浮小問號結束-->
      <!--後端的計數器-->
      
      <div class="copyright">copyright&copy;KASY 2021<br>拜訪人數:<%=counter%>位</div>
     <!--最下面的連結區開始-->
      <nav class="navbtn2">
        <div class="item1">
          <a href="story.jsp"><h3>關於我們</h3></a>
  
        </div>
        <div class="item2">
          <a href="question.jsp"><h3>常見問題</h3></a>
  
        </div>
        <div class="item3">
          <a href="https://www.lecreuset.com.tw/l"><h3>關於 LE CREUSET</h3></a>
  
        </div>
       
      </nav> <!--最下面的連結區結束-->
      <!--到TOP的按鈕開始-->
      <button onclick="topFunction()" id="topBtn">
        <img src="../asset/image/top.png">
      </button>
    </div>
  
  
  
  <!--到TOP的按鈕結束-->



<script src="../asset/js/search.js"></script>
  <script src="../asset/js/searchfunction.js"></script>
  <script src="../asset/js/top.js"></script>
<script src="../asset/js/searchpage.js"></script>
<script src="../asset/js/searchpage_diplay.js"></script>

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