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
  <link rel="stylesheet" href="../asset/css/payment.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <title>payment</title>




</head>

<body onclick="ShowTime()">
    <!--header開始-->
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
				sql="USE `kasy`";
				con.createStatement().execute(sql);						
				rs=con.createStatement().executeQuery(sql);
				
				sql="SELECT * FROM `addmember` WHERE `Id`='" + session.getAttribute("id") + "'";
				rs=stmt.executeQuery(sql);		
				rs.next();
				
	%>
		
		
      </div>
<!--header結束-->
<!--結帳區開始-->
  <div class="row_pay">
    <div class="col-75">
      <div>
        <form action="addpayment.jsp" name="reg">
        
          <div class="row_pay">
            <div class="col-50">
				<h1>付款人</h1><br><br><!--讓使用者輸入的地方-->
				<label for="fname"><i class="fa fa-user"></i>姓名</label>
				<input class="input_pay" type="text" id="fname" name="Name" value="<%= rs.getString("Name") %>" required>
				<label for="email"><i class="fa fa-envelope"></i> Email</label>
				<input class="input_pay" type="text" id="email" name="payment_email" value="<%= rs.getString("mail") %>" required>
				<label for="adr"><i class="fa fa-address-card-o"></i>地址</label>
				<input class="input_pay" type="text" id="adr" name="payment_address" value="<%= rs.getString("address") %>" required>
				<label for="city"><i class="fa fa-institution"></i>聯絡電話</label>
				<input class="input_pay" type="text" id="city" name="payment_phone" value="<%= rs.getString("phone") %>" required>
				<label for="num"><i class="fa fa-id-card"></i>卡片號碼</label>
				<input class="input_pay" type="text" id="ccnum" name="cardnumber" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="請輸入片號碼,如:1111-2222-3333-4444" required/>
				<label for="cvv"><i class="fa fa-credit-card"></i>驗證碼</label>
				<input class="input_pay" type="text" id="cvv" name="cvv" oninput = "value=value.replace(/[^\d]/g,'')" placeholder="請輸入卡片背面的驗證碼" /required/>
			</div>
			
			
			
			<div class="col-50">
                <h1>付款資訊</h1><br>
                <label for="fname">接受線上支付 Accepted Cards</label>
                <div class="icon-container">
					<i><img src="../asset/image/visa.png" style="width: 10%;height: 8.5%;"></i>
					<i><img src="../asset/image/mastercard.png" style="width: 10%;height: 8.5%;"></i>
					<i><img src="../asset/image/jcb.png " style="width: 10%;height: 8.5%;"></i>
                </div>
			<label for="cname"><i class="fa fa-product-hunt"></i>商品名稱</label>
			<div class="content" style="height:80%;padding:5%;background-color:white">
	<%						
			sql="SELECT * FROM `cart`, `list` WHERE `Id`='" + session.getAttribute("id") + "' AND `cart`.`list_Id` COLLATE utf8mb4_unicode_520_ci=`list`.`list_Id`";
			rs=stmt.executeQuery(sql);			
			rs.last();
			if (rs.getRow() == 0)
			{
	%>
	
	        <div align="center">
				<a href="product.jsp">
					<img src="../asset/image/noorder.png" style="width:30%; padding:2%" >
				</a>
			</div>
  
    <%
			}
			else 
			{
				rs=stmt.executeQuery(sql);	
				int index = 1;
				int total = 0;
				while (rs.next())
				{
    %>	
  
            
              
			   
				    <h2><%= rs.getString("product_name") %></h2>
				    <h3>顏色 : <%= rs.getString("color") %></h3>
				    <h3>尺寸 : <%= rs.getString("size") %></h3>
				    <h3>數量：<%= rs.getString("cart_quentity") %></h3>
				    <h3>價格 : NT$<%= rs.getString("price") %></h3><br>
				<%
						total += Integer.parseInt(rs.getString("cart_quentity")) * Integer.parseInt(rs.getString("price"));
					}
					int discount = 0;
					if(total>=10000){
						discount=(int)(total*0.05);
					}
					int fare= 0;
					if(total>=3500){
						fare=0;
					}
	            %>
					<h2>商品總價 : NT$<%= total %></h2>
					<h2>商品折扣 : NT$<%= discount %></h2>
					<h2>運費 : NT$<%= fare %></h2>
					<h2>總金額 : NT$<%= total-discount+fare %></h2>
			    </div>
		<%
			}
		%>
				
          </div>
         </div>
              <!--完成結帳-->         
          <div style="display:flex;justify-content:center;margin:5% 0%">
		  
          <input type="submit" value="完成結帳" class="btn"   onclick="Doublecheck()" >
          <input type="reset" value="重新填寫" class="btn"  >
          </div>
        </form>
		
      </div>
    </div>
    
  </div>
  
<!--結帳區結束-->

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
       <a href="story.jsp"> <h3>關於我們</h3></a>

      </div>
      <div class="item2">
        <a href="question.jsp"><h3>常見問題</h3></a>

      </div>
      
    </nav>
    <button onclick="topFunction()" id="topBtn">
      <img src="../asset/image/top.png">
    </button>
  </div>



<!--到TOP的按鈕結束-->

<script src="../asset/js/search.js"></script>
<script src="../asset/js/searchfunction.js"></script>
<script src="../asset/js/top.js"></script>
<script src="../asset/js/paymentcheck.js"></script>
<script src="../asset/js/confirmForm.js"></script>
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