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
    <link rel="stylesheet" href="../asset/css/server_member.css">
    <title>Server_Member</title>
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
				sql="SELECT * FROM `addmember`"; 
				ResultSet rs=con.createStatement().executeQuery(sql);
				rs=con.createStatement().executeQuery(sql);
	%>
        <div class=" member">
            <table border="1">
                <caption>
                    <h2>會員管理</h2>
                </caption>
                <tr class="con">
                    <td class="fir">會員</td>
                    <td class="fir">帳號</td>
                    <td class="fir">出生日期</td>
                    <td class="fir">電子郵件</td>
                    <td class="fir">連絡電話</td>
                    <td class="fir">通訊地址</td>
                    <td class="fir">管理</td>
                </tr>
				<% while(rs.next())
                {%>
                <tr class="con">
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(7));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    <td><%out.print(rs.getString(4));%></td>
                    <td><%out.print(rs.getString(5));%></td>
                    <td><%out.print(rs.getString(6));%></td>
                    <td>
                        <form method="POST" action="deletemember.jsp">
                            <button type="submit" name="id" class="delete" value="<%= rs.getString(7) %>">刪除</button>
                        </form>
                    </td>
                </tr>
				<%
				}
				%>
            </table>
        </div>
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


    </div>










</body>

</html>