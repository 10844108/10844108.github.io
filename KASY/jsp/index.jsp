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
    <link rel="stylesheet" href="../asset/css/index.css">
    <title>Index</title>
</head>

<body>

    <div class="header">
        <div class="guide">
            <a href="index.jsp" alt="">
                <img src="../asset/image/logo.jpg">
            </a>
        </div>

        <form id="content" action="search.jsp">
            <input type="text" name="input" class="input1" id="search-input">
            <button type="reset" class="search" id="search-btn"><a href="search.jsp"></button>
        </form>



        <%
		try {
		Class.forName("com.mysql.jdbc.Driver");
		try {
			String url="jdbc:mysql://localhost/?serverTimezone=UTC";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","10844108");
			

        //Step 3: 選擇資料庫   
                sql="USE `kasy`";
                con.createStatement().execute(sql);
                //Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
                
                 
 
                ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
                rs=con.createStatement().executeQuery(sql);
				
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
			}
			else {
				sql="USE `kasy`";
				con.createStatement().execute(sql);		
				
				//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
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




    <!--廣告-->
    <div class="slideshow-container">

        <div class="mySlides fade">
            <img src="../asset/image/ad1.png" class="photo">
        </div>

        <div class="mySlides fade">
            <img src="../asset/image/ad3.png" class="photo">
        </div>

        <div class="mySlides fade">
            <img src="../asset/image/ad2.png" class="photo">
        </div>

        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>

    </div>

    <div style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
    </div>
    <!--熱門商品-->
    <div id="hotbody">
        <div id="hottop">熱門商品</div>
        <div id="hot">
            <%
            sql="SELECT * FROM `list` WHERE `add`='V' AND `type`='鑄鐵鍋系列' ORDER BY `sale` DESC";						
            rs=con.createStatement().executeQuery(sql);	
            rs.next();
            %>
            <div class="inside">
                <img src="../asset/image/top1.png" class="hotpic">
                <a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><img src="../asset/image/<%=rs.getString(16)%>"
                        class="pic"></a>
                <h3><a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><%=rs.getString(3)%></h3>
            </div>
            <%
            sql="SELECT * FROM `list` WHERE `add`='V' AND `type`='造型陶器' ORDER BY `sale` DESC";						
            rs=con.createStatement().executeQuery(sql);	
            rs.next();
            %>
            <div class="inside">
                <img src="../asset/image/top2.png" class="hotpic">
                <a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><img src="../asset/image/<%=rs.getString(16)%>"
                        class="pic"></a>
                <h3><a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><%=rs.getString(3)%></h3>
            </div>
            <%
            sql="SELECT * FROM `list`WHERE `add`='V' AND `type`='調理配件' ORDER BY `sale` DESC";						
            rs=con.createStatement().executeQuery(sql);	
            rs.next();
            %>
            <div class="inside">
                <img src="../asset/image/top3.png" class="hotpic">
                <a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><img src="../asset/image/<%=rs.getString(16)%>"
                        class="pic"></a>
                <h3><a href="products_detail.jsp?list_Id=<%= rs.getString(1)%>"><%=rs.getString(3)%></h3>
            </div>
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


    <script src="../asset/js/ad.js"></script>
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