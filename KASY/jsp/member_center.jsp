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
		response.sendRedirect("login.jsp");
		return;
	}	
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
    <link rel="stylesheet" href="../asset/css/profile.css">

    <title>Member_center</title>
</head>

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
</div>


<body>
	<%

    Class.forName("com.mysql.jdbc.Driver");
 	
	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
	String sql="";
	Connection con=DriverManager.getConnection(url,"root","10844108");
	ResultSet rs = null;
	if(con.isClosed())
	   out.println("連線建立失敗");
	else 
	{ 
		sql="USE `kasy`";
		con.createStatement().execute(sql);

		sql="SELECT * FROM `addmember` WHERE Id='" + session.getAttribute("id") + "'";
		rs=con.createStatement().executeQuery(sql);

		if (! rs.next())
		{
			%>
			<script>
				alert("not login!!");
				location.replace("login.jsp");
			</script>
			<%
			return;
		}
		
		rs=con.createStatement().executeQuery(sql);
		   
		rs.next();
	}
	%>
    <!--會員中心(登入後所呈現的畫面)-->
    <!--會員資料-->
    <br><br>
    <div>
        <div class="edit">
            <div class=" tab">
                <table border="1">
                    <caption>
                        <h2>會員資料</h2>
                    </caption>
                    <tr class="con">
                        <td width="120">姓名</td>
                        <td colspan="3"><%out.print(rs.getString(2));%></td>
                    </tr>
                    <tr class="con">
                        <td width="100">帳號</td>
                        <td colspan="3"><%out.print(rs.getString(7));%></td>
                    </tr>
                    <tr class="con">
                        <td>連絡電話</td>
                        <td colspan="3"><%out.print(rs.getString(4));%></td>
                    </tr>
                    <tr class="con">
                        <td>電子郵件</td>
                        <td colspan="3"><%out.print(rs.getString(5));%></td>
                    </tr>
                    <tr class="con">
                        <td>通訊地址</td>
                        <td colspan="3"><%out.print(rs.getString(6));%></td>
                    </tr>
                </table>
            </div>

            <div class="edit2">
                <button name="submit" type="submit" class="edit1"
                    onclick="document.getElementById('id01').style.display='block'">
                    編輯</button>

                <form method="POST" action="">
                    <button type="submit" name="logout" class="edit1">登出</button>
                </form>
            </div>



        </div>
    </div>
    <div id="id01" class="modal">
        <form class="modal-content animate" action="update.jsp" method="post">
            <fieldset class="data">
                <legend><br><br>
                    <h2>編輯會員資料</h2>
                </legend>
                <div class="box">
                    <div class="list">
                        <h4>姓名：</h4>
                        <input name="name" type="text" value="<%= rs.getString("Name") %>" required>
                    </div>
                    <div class="list">
                        <h4>出生日期：</h4>
                        <td><%=rs.getString("Birthday")%></td>
                    </div>
                    <div class="list">
                        <h4>聯絡電話：</h4>
                        <input type="text" name="phone" value="<%= rs.getString("Phone") %>" required>
                    </div>
                    <div class="list">
                        <h4>電子郵件：</h4>
                        <input type="email" name="mail" value="<%= rs.getString("Mail") %>" required>
                    </div>
                    <div class="list">
                        <h4>通訊地址：</h4>
                        <input type="text" name="address" value="<%= rs.getString("Address") %>" required>
                    </div>
                    <div class="list">
                        <h4>帳號：</h4>
                        <input type="text" name="acc" value="<%= rs.getString("Id") %>" required>
                    </div>
                    <div class="list">
                        <h4>密碼：</h4>
                        <input type="password" name="pwd" value="<%= rs.getString("Pwd") %>" required>
                    </div>
                </div>
                <div class="box">
                    <input type="hidden" name="id" value="<%= rs.getString("Id")%>">
                    <button class="edit-button" type="submit">修改</button>
                    <button class="edit-button" type="reset"
                        onclick="document.getElementById('id01').style.display='none'">取消</button>
                </div>
            </fieldset>
        </form>
    </div>



    <br><br>
    <!--無訂單-->
	
    <div>
        <center><a href="product.jsp"><img src="../asset/image/noorder.png" style="width: 900px; height: 500px;"></a>
        </center>
    </div>
	
	
    <br><br>

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
            <div class="item3">
                <a href="https://www.lecreuset.com.tw/">
                    <h3>關於 LE CREUSET </h3>
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
</body>

</html>