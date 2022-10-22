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
  <link rel="stylesheet" href="../asset/css/products_detail.css">
  <link rel="stylesheet" href="../asset/css/products_detail2.css">
  

  <title>products_detail</title>

</head>
<script>
  function add(){   
    if (session.getAttribute("id") == null)
    {
          alert("請先登入");
          location.replace("login.jsp");
      return;
    }
  }
</script>


<body>
 
  <!--header開始-->
  <div class="header">
    <div class="guide">
      <a href="index.html" alt="">
        <img src="../asset/image/logo.jpg">
      </a>
    </div>



    <form method="GET" id="content" action="search.jsp">
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
		  Statement stmt = null;
          Connection con=DriverManager.getConnection(url,"root","10844108");
		  sql="USE `kasy`";
          con.createStatement().execute(sql);
   //Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
			
			String list_Id = request.getParameter("list_Id");
		    sql = "SELECT * FROM list WHERE `list_Id`= '"+ list_Id + "' AND `add`='V'";
			
			
			
			ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
            rs.last();
            rs = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           
          if(con.isClosed()){
             out.println("連線建立失敗");
		 
		 %>
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
		 <%
          }else {
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
			  
		<%
		  }
		  
  //Step 3: 選擇資料庫   
             sql="USE `kasy`";
             con.createStatement().execute(sql);
   //Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	   
             while(rs.next()){
				 
				
    %>

<!--header結束-->

<div>
    <div>
		<h1  style="font-size:70px; font-weight:bold;color: #4c3131;padding: 10px 0px; text-align:center;">商品介紹</h1>
    </div><br>
    
    <!-- The four columns -->
    <div class="goods" style="display:flex;justify-content:space-around;align-items: center;">
		<div class="row4">
			<div class="column4">
			  <img class="demo_cursor" src="../asset/image/<%=rs.getString(16)%>" onclick="currentSlide(1)" alt="1" style="width: 450px;"> 
			</div>
		</div>
		
    <form action="addcart.jsp" method="post">
		<div class="goods_info" >
			<div class="row5" >
			<div  style="background-color: #ffff;border-radius: 15%;width: 700px;height: 100%;">
				
				<div>
					<h2 name="product_name"style="text-align:center;padding:5px 0px;"><%out.println(rs.getString(3));%></h2>
					<hr style="height:8px;" color="pink" width="95%"><br>
					<p style="font-size: 20px; font-style:italic; font-weight: bold;margin-left: 2%;margin-top: -1%;" name="introduce" ><%out.println(rs.getString(7));%></p><br>
				    <p><span class="price" name="price" style="color: red; font-size:24px;margin-left: 2%;">NT$<%out.println(rs.getString(4));%></span></p><br>
				    <p><span class="price" name="cart_size" style="font-size:22px; background: rgb(206, 181, 181);margin-left: 2%;" >尺寸</span>&nbsp;&nbsp;<%out.println(rs.getString(5));%></p><br>
				    <p><span class="price" name="cart_color" style="font-size:22px; background: rgb(206, 181, 181);margin-left: 2%;">顏色</span>&nbsp;&nbsp;<%out.println(rs.getString(6));%></p><br>
				    <p><span class="price" style="font-size:22px; background: rgb(206, 181, 181);margin-left: 2%;">數量</span>&nbsp;&nbsp;
				    <input type="text" name="cart_quentity" style="width:20%;" placeholder="請輸入購買數量" maxlength="20" required></p><br>
                    <p><span class="price" name="stock" style="font-size:22px; background: rgb(206, 181, 181);margin-left:2%">庫存數量:</span>&nbsp;&nbsp;<%out.println(rs.getString(14));%></p><br>
                    <hr style="height:2px" color="rgb(197, 175, 159)" width="95%"><br>
				<div class=" ck_btn" style="display:flex;justify-content:space-around; ">
					
					<input type="hidden" name="list_Id" value="<%= list_Id %>">
					
					<button type="submit" class="cart" style="text-align:center; align-items: center; font-size: 24px; letter-spacing: 2px; padding :3px;cursor: pointer;border-radius:10px" onclick="add()" >
					
					<img src="../asset/image/shopping.png" style="width: 30px; height="25px;">加入購物車</button>
	</form>	
					
				</div>
				</div>
            </div>
            </div>
        </div>
    </div>
</div><br><br>

  
  

  
  

 
<div class="behind">
    <div class="tab">
       <button class="tablink" onclick="openPage('aa',this)" id="tabcontent">商品詳情</button>
       <button class="tablink" onclick="openPage('bb',this)">付款與運送</button>
       <button class="tablink" onclick="openPage('cc',this)">商品評價</button>
   </div>

   <div id="aa" class="tabcontent">
        <div class="rightimfor">
            <h1>商品特色</h1>
            <p>
               <%out.println(rs.getString(7));%>
            </p> 
			<br>
			<h1>商品規格</h1>
			<p>
			直徑(含柄): <%out.println(rs.getString(8));%><br>
			高度(含蓋): <%out.println(rs.getString(9));%><br>
			容量: <%out.println(rs.getString(10));%><br>
			重量: <%out.println(rs.getString(11));%></p>
			<br>
			<h1>商品適用器具</h1>
			<p><%out.println(rs.getString(12));%></p>
        </div>
    </div>

    <div id="bb" class="tabcontent">
        <div class="rightimfor">
            <h1>付款與運送</h1>
            <h2>付款方式</h2>
            <p>
                超商貨到付款<br>
                信用卡付款<br>
                LINE Pay <br><br>
				全館滿一萬元，打95折
				

            <h2>運送方式</h2>
            <p>
                全家取貨付款，每筆NT$60，滿NT$3500(含以上)免運費<br>
                7-11取貨付款，每筆NT$60，滿NT$3500(含以上)免運費<br>
            </p>
        </div>	
    </div>
	
	
	
	
	<form style="padding:5px 20px 10px 30px" action="add.jsp" method="get">
    <div id="cc" class="tabcontent">
        <div class="pic" style="margin-top:20px;text-align:left">					
            <div class="apple">
            <h1 >4.8/5</h1>
            <p>共2則評論</p>
            </div>			
            
            <ul class="starul">
                <li>★★★★★<b>(1)</b></li>
                <li>★★★★☆<b>(1)</b></li>
                <li>★★★☆☆<b>(0)</b></li>
                <li>★★☆☆☆<b>(0)</b></li>
                <li>★☆☆☆☆<b>(0)</b></li>
            </ul>
            <button type="button" class="reviwe" onclick="rew_show()">撰寫評論</button>
                
			
                <div id="rew_write" class="rew_writeclass">
				
                
    
                    <label >姓名</label>
                    <input type="text" name="Name" required /><br> 
                
                    
                    <label>評分(1-5星等)</label>
                    <input type="text" name="star" name="star" required /> 
					
                    
                 
                    <br>
                    <label style="margin-top:10px">商品名稱</label>
                    <select name="product_name" required>
                      <option value="" style="font-size: 20px; font-weight: bold;">琺瑯鑄鐵鍋具</option>
                      <option value="雙魚戲荷琺瑯鑄鐵媽咪鍋22cm">雙魚戲荷琺瑯鑄鐵媽咪鍋22cm</option>
                      <option value="典藏琺瑯鑄鐵圓鍋">典藏琺瑯鑄鐵圓鍋</option>
                      <option value="典藏琺瑯鑄鐵媽咪鍋">典藏琺瑯鑄鐵媽咪鍋</option>
                      <option value="萬用窈窕琺瑯鑄鐵鍋">萬用窈窕琺瑯鑄鐵鍋</option>
                      <option value="典藏琺瑯鑄鐵慢燉鍋">典藏琺瑯鑄鐵慢燉鍋</option>
                      <option value="典藏琺瑯圓鐵鍋">典藏琺瑯圓鐵鍋</option>
                      <option value="琺瑯鑄鐵山茶花鍋">琺瑯鑄鐵山茶花鍋</option>
                      <option value="" style="font-size: 20px; font-weight: bold;">造型瓷器
                      </option>
                      <option value="珠光薔薇英式午茶杯">珠光薔薇英式午茶杯</option>
                      <option value="日式清酒壺組">日式清酒壺組</option>
                      <option value="珠光薔薇花瓶500ml">珠光薔薇花瓶500ml</option>
                      <option value="韓式飯碗">韓式飯碗</option>
                      <option value="深圓盤">深圓盤</option>
                      <option value="蛋蛋馬克杯">蛋蛋馬克杯</option>
                      <option value="花蕾系列心型盤4入">花蕾系列心型盤4入</option>
                      <option value="新采和風系列湯匙2入">新采和風系列湯匙2入</option>
                      <option value="花型盤附中式湯匙">花型盤附中式湯匙</option>
                      <option value="" style="font-size: 20px; font-weight: bold;">調理配件
                      </option>
                      <option value="法式隔熱墊">法式隔熱墊</option>
                      <option value="V鏟杓">V鏟杓</option>
                      <option value="不鏽鋼矽膠餐夾">不鏽鋼矽膠餐夾</option>
                      <option value="南瓜鏟">南瓜鏟</option>
                      <option value="鍋耳防燙握把2入">鍋耳防燙握把2入</option>
                      <option value="長形烤盤">長形烤盤</option>
                      <option value="楓木砧板">楓木砧板</option>
                      <option value="鍋把套">鍋把套</option>
                    </select>
                   
                    <br>

                    <label style="margin-top:10px">標題</label>
                    <input type="retext" name="subject" style="width:40%" placeholder="20字以內" maxlength="20" required> 
                    <br>
    
                    <label style="position:relative;top:-80px">內容</label>
                    <input type="hidden" name="list_Id" value="<%=rs.getString("list_Id")%>">
					
					
                    <textarea name="message" style="width:70%;height:100px;margin-top:10px"placeholder="250字以內" maxlength="250" required></textarea>
                    <button type="submit" class="rewpost">送出</button>
                    
                  </form>
                   </div>
                   <hr style="margin-top:10px">   
				   
	<%
	  
      String sql2="SELECT * FROM `board` WHERE `list_Id`= '"+ list_Id + "'";
      ResultSet rb = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql2); 
	  
      while(rb.next()){
    %>   
				   
    
                <div class="rew">
				
				
                    <ul class="rewul">
                        <li>姓名: <%out.println(rb.getString(3));%></li>
                        <li>商品: <%out.println(rb.getString(4));%></li>
                        <li>評分(1-5星等): <%out.println(rb.getString(5));%></li>
                    </ul>
                    <div class="rewtxt">
                        <h4>標題: <%out.println(rb.getString(6));%></h4>
                        <p>內容: <%out.println(rb.getString(7));%></p>
                    </div>
					
                    <p class="time"><%out.println(rb.getString(8));%></p>
                </div>


		<%}%>
                
            </div>
        </div>
</div	  
	  
  <!--到TOP的按鈕結束-->
  
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
          <a href="Process.jsp"><h3>常見問題</h3></a>
  
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
	<script src="../asset/js/addheart.js"></script>
	<script src="../asset/js/addshoppingcart.js"></script>
	<script src="../asset/js/produce.js"></script>
	<script src="../asset/js/Form.js"></script>
	<script src="../asset/js/contact.js"></script>
	<script src="../asset/js/star.js"></script>

 <%
           }
  //Step 6: 關閉連線
  con.close();
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