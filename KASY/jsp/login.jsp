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
		try {
		Class.forName("com.mysql.jdbc.Driver");
		try {
			String url="jdbc:mysql://localhost/?serverTimezone=UTC";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","10844108");
			if(con.isClosed())
				out.println("連線建立失敗");
			else {
				sql="USE `kasy`";
				con.createStatement().execute(sql);						
				ResultSet rs=con.createStatement().executeQuery(sql);
				rs=con.createStatement().executeQuery(sql);
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
    <link rel="stylesheet" href="../asset/css/log.css">

    <title>Login</title>
</head>

<div class="header">
    <div class="guide">
        <a href="index.jsp" alt="">
            <img src="../asset/image/logo.jpg">
        </a>
    </div>



   

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
    
	

<body onclick="ShowTime()">
    <!---會員登入-->
    <div id="log-board">
        <p id="log-top">會員登入</p>
        <div　id="log-content">
            <form method="POST" action="check.jsp">
                <p class="word">帳號：<input type="text" name="id" id="acc" placeholder="輸入帳號.." required></p>
                <p class="word">密碼：<input type="password" name="pwd" id="pass" placeholder="輸入密碼.." required></p>
                <br>
                <input type="submit" name="submit" value="登入" id="login-button">
                <input type="reset" name="reset" value="重新填寫" id="reset-button">
                <br>
            </form>
            <button onclick="document.getElementById('id01').style.display='block'" class="add-button">點擊我註冊會員！</button>

            <div id="id01" class="modal">

                <form class="modal-content animate" method="post" action="addmember.jsp">
                    <fieldset class="data">
                        <legend>
                            <br><br>
                            <h2>會員註冊</h2>
                        </legend>
                        <div class="box">							
                            <div class="form2">
                                <h3>姓名：</h3>
                                <input type="text" name="name" placeholder="請填寫本名.." required>
                            </div>
                            <div class="form2">
                                <h3>出生日期：</h3>
                                <input type="date" name="birthday" required>
                            </div>
                            <div class="form2">
                                <h3>聯絡電話：</h3>
                                <input type="text" name="phone" required>
                            </div>
                            <div class="form2">
                                <h3>電子信箱：</h3>
                                <input type="email" name="mail" required>
                            </div>
                            <div class="form2">
                                <h3>通訊地址：</h3>
                                <input type="text" name="address" required>
                            </div>
                            <div class="form2">
                                <h3>帳號：</h3>
                                <input type="text" name="id" required>
                            </div>
                            <div class="form2">
                                <h3>密碼：</h3>
                                <input type="password" name="pwd" required>
                            </div>
                        </div>
                        <div class="box">
                            <button class="register-button" type="submit">註冊</button>
                            <button class="register-button"
                                onclick="document.getElementById('id01').style.display='none'">取消</button>
                        </div>
                    </fieldset>
                </form>
            </div>
            <br>
            <button id="server-button" onclick="location.href='serverlog.jsp'">
                <h3>管理者從這裡登入</h3>
            </button>
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
    <script src="../asset/js/register.js"></script>
<%
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