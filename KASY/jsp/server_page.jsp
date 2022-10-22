<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","10844108");
String sql="USE `store`";
con.createStatement().execute(sql);
if(session.getAttribute("id") != null ){
    sql = "SELECT * FROM `addserver` WHERE `id`='" +session.getAttribute("id")+"';"; 
	ResultSet rs =con.createStatement().executeQuery(sql);
	String id="", pwd="";
	//讀出id, pwd當成使用者要更改時的內定值
	while(rs.next()){
	    id=rs.getString("id");
		pwd=rs.getString("pwd");
	}
    con.close();//結束資料庫連結
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../asset/css/server_page.css">
    <title>Server_Page</title>
</head>

<body>

    <div id="left">
        <div id="content-left">

            <a href="server_page.jsp"><img src="../asset/image/logo.jpg" width="150px" height="140px" id="photo"></a>
            <br>
            <!--管理者ID-->
            <center>KASY0000</center>
            <br>
            <hr>
            <div id="content-select">
                <br>
                <center>
                    <p class="h"><a href="server_member.jsp">會員管理</a></p>
                </center>
                <br>
                <center>
                    <p class="h"><a href="server_order.jsp">訂單管理</a></p>
                </center>
                <br>
                <center>
                    <p class="h"><a href="goods_all.jsp">商品管理</a></p>
                </center>
                <br>
                <center>
                    <p class="h"><a href="goods_add.jsp">商品新增</a></p>
                </center>
                <br>
            </div>
            <hr>
            <div class="select-buttom">
                <form method="POST" action="serverlog.jsp">
                    <hr>
                    <button type="submit" id="serverout">登出</button>
                    <hr>
                </form>
            </div>
        </div>
    </div>
    <div id="right" style="height: 720px; width: 100%;">
        <img src="../asset/image/server.png" id="server">
    </div>












</body>

</html>