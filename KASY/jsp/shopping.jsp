<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<%
	  int counter;
	  String strNo = (String)application.getAttribute("counter");//讀application變數
	  counter = Integer.parseInt(strNo); //轉成整數
	  if (session.isNew())
	  counter++;                                        //計數器加1
	  strNo = String.valueOf(counter);    //轉成字串
	  application.setAttribute("counter", strNo);//寫application變數
%>
<%
	if (session.getAttribute("id") == null)
	{
		%>
			<script>
				alert("請先登入");
				location.replace("login.jsp");
			</script>
		<%
		return;
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../asset/css/shopping.css">
  <link rel="stylesheet" href="../asset/css/header_footer.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>shopping</title>




</head>

<body onclick="ShowTime()">
  <div class="header">
    <div class="guide">
      <a href="index.jsp" alt="">
        <img src="../asset/image/logo.jpg">
      </a>
    </div>



    <form id="content">
      <input type="text" name="input" class="input1" id="search-input">
      <button type="reset" class="search" id="search-btn"></button>
    </form>



    <div class="slogan">


      <h1><span>Have me.</span><br><br> <span>Have a lovely life.</span></h1>
    </div>

<%
		
		Class.forName("com.mysql.jdbc.Driver");
		
			String url="jdbc:mysql://localhost/?serverTimezone=UTC";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","10844108");
			
			Statement stmt=con.createStatement();
			ResultSet rs = null;
			
			sql="USE `kasy`";
			stmt.execute(sql);
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
						
			sql="SELECT * FROM `addmember` WHERE `Id`='" + session.getAttribute("id") + "'";
			rs=stmt.executeQuery(sql);		
			rs.next();
			
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
	%>
	<header id="site-header">
		<div class="container">
		  <h1 >(USER)'s Shopping cart</h1>
		</div>
    </header>
	<%						
			sql="SELECT * FROM `cart`, `list` WHERE `Id`='" + session.getAttribute("id") + "' AND `cart`.`list_Id` COLLATE utf8mb4_unicode_520_ci=`list`.`list_Id`";
			rs=stmt.executeQuery(sql);			
			rs.last();
			if (rs.getRow() == 0)
			{
	%>
	
	        <div align="center">
				<a href="product.jsp">
					<img src="../asset/image/noorder.png" style="width:50%; padding:2%" >
				</a>
			</div>
  
    <%
			}
			else 
			{
				rs=stmt.executeQuery(sql);	
				int index = 1;
				int total = 0;
				int discount=0;
				while (rs.next())
				{
    %>	
	
<!--加入購物車的商品開始-->
  <div class="container">

    <section id="cart"> 
      <article class="product">
        <header>
          <a class="remove">
            <img src="../asset/image/<%= rs.getString("image1") %>" alt="">

            <h3>Remove product</h3>
          </a>
        </header>

        <div class="content" style="height:100%">

          <h1><%= rs.getString("product_name") %></h1>
		  <h3>顏色:<%= rs.getString("color") %></h3>
		  <h3>尺寸:<%= rs.getString("size") %></h3>
		  <h3>數量：<%= rs.getString("cart_quentity") %></h3>
          <h3>價格 : NT$<%= rs.getString("price") %></h3>
        </div>
      

  </div>
  
    <%
					total += Integer.parseInt(rs.getString("cart_quentity")) * Integer.parseInt(rs.getString("price"));
				
				}
				if(total>=10000){
					discount=(int)(total*0.05);
				}
				int fare= 0;
				if(total>=3500){
					fare=0;
				}
				
	%>
<!--加入購物車的商結束-->
  <footer id="site-footer">
    <div class="container clearfix">

      <div class="left"><!--計算總金額-->
        <h2 class="subtotal"><span style="color: orangered;font-weight: bold;">商品總價: </span>&nbsp;<span>NT$<%= total %></span></h2>
        <h2 class="tax"><span style="color: orangered;font-weight: bold;">商品折扣:</span>&nbsp; <span>NT$<%= discount %></span></h2>
        <h2 class="shipping"><span style="color: orangered;font-weight: bold;">運費:</span>&nbsp; <span>NT$<%= fare %></span></h2>
      </div>

      <div class="right">
        <h1 class="total"><span style="color: orangered;font-weight: bold;">總金額: </span>&nbsp;<span>NT$<%= total-discount+fare %></h1>
        <a href="payment.jsp" class="btn">結帳</a>
      </div>

    </div>
  </footer>
			
			<%
			}
			%>


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
        
       
      </nav> <!--最下面的連結區結束-->
      <!--到TOP的按鈕開始-->
      <button onclick="topFunction()" id="topBtn">
        <img src="../asset/image/top.png">
      </button>
    </div>
  
 

  <!--到TOP的按鈕結束-->

<script src="../asset/js/shopping.js"></script>
<script src="../asset/js/search.js"></script>
<script src="../asset/js/searchfunction.js"></script>
<script src="../asset/js/top.js"></script>
<script src="../asset/js/qtychange.js"></script>
</body>

</html>
<script language="JavaScript">
    function ShowTime() {
        var NowDate = new Date();
        var h = NowDate.getHours();
        var m = NowDate.getMinutes();
        var s = NowDate.getSeconds();
        document.getElementById('showbox').innerHTML = h + '時' + m + '分' + s + '秒';
        setTimeout('ShowTime()', 1000);
    }
</script>