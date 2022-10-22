<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<%
	if (session.getAttribute("id") == null)
	{
		%>
			<script>
				alert("管理者介面，管理員請先登入");
				location.replace("serverlog.jsp");
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../asset/css/server_page.css">
    <link rel="stylesheet" href="../asset/css/server_order.css">
    <title>Server_Order</title>
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
<%
		
	        Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost/?serverTimezone=UTC";
			String sql="";
			Connection con=DriverManager.getConnection(url,"root","10844108");
			Statement stmt=con.createStatement();
			ResultSet rs=null;
			sql="USE `kasy`";
			con.createStatement().execute(sql);	
				
			sql="SELECT * FROM `order`"; 
			rs=con.createStatement().executeQuery(sql);
			
			
	%>
	
        <div class=" member">
            <table border="1">
                <caption>
                    <h2>訂單管理</h2>
                </caption>
                <tr class="con">
                    <td class="fir">編號</td>
                    <td class="fir">日期</td>
                    <td class="fir">訂購人</td>
                    <td class="fir">地址</td>
                    <td class="fir">電子郵件</td>
                    <td class="fir">聯絡電話</td>
                    <td class="fir">管理</td>
                </tr>		
			<% while(rs.next())
                {
			%>
                <tr class="con">
                    <td><a href="order_detail.jsp?order_id=<%= rs.getString("order_id") %>"><%= rs.getString("order_id") %></a></td>
                    <td><%= rs.getString("order_date") %></td>
                    <td><%= rs.getString("order_name") %></td>
                    <td><%= rs.getString("order_address") %></td>
                    <td><%= rs.getString("order_email") %></td>
                    <td><%= rs.getString("order_phone") %></td>
                    <td>
                        <form method="POST" action="deleteorder.jsp">
							<input type="hidden" name="order_id" value="<%= rs.getString("order_id")%>"/>
                            <button type="submit" name="delete" class="delete">刪除</button>
                        </form>
                    </td>
                </tr>	
			<%
				}
			%>
            </table>
        </div>
		
    </div>


</body>

</html>