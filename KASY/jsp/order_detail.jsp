<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../asset/css/order_detail.css">
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

<%
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","10844108");
		Statement stmt=con.createStatement();
		ResultSet rs=null;
		sql="USE `kasy`";
		con.createStatement().execute(sql);
		String order_id = request.getParameter("order_id");
		sql="SELECT * FROM `order_detail`, `list` WHERE `order_id`=" + order_id ;
		rs=con.createStatement().executeQuery(sql);		
		
				   
		rs.next();
%>

	
    <div id="right" style="height: 720px; width: 100%;">
            <div class="edit">
                <div class=" tab">
                    <table border="1">
					    
                        <caption>
						    <h2>訂單管理</h2><br>
                            <h2><a href="server_order.jsp">訂單編號: <%out.print(rs.getString(2));%></a></h2>
                        </caption>
                        
                        <tr class="con">
                            <td colspan="2">商品名稱</td>
                            <td>數量</td>
                            <td>單價</td>
                        </tr>
						<%
						    sql="SELECT * FROM `order_detail`, `list` WHERE `order_id`=" + order_id + " AND `order_detail`.`list_Id`=`list`.`list_Id`";
		                    rs=con.createStatement().executeQuery(sql);	
						    int total = 0;
							int discount=0;
							while (rs.next())
							{
						%>	
                        <tr class="con">
                            <td colspan="2" class="pro"><%= rs.getString("product_name") %></td>
                            <td class="pro"><%= rs.getString("cart_quentity") %></td>
                            <td class="pro"><%= rs.getString("price") %></td>
                        </tr>
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

                        <tr class="con">
                            <td colspan="2">小計</td>
                            <td colspan="2">
                                NT$<%=total%>
                            </td>
                        </tr>
                        <tr class="con">
                            <td colspan="2">運費</td>
                            <td colspan="2">
                                 NT$<%=fare%>
                            </td>
                        </tr>
                        <tr class="con">
                            <!--全館九折-->
                            <td colspan="2" class="count">折扣</td>
                            <td colspan="2" class="count">
                                 NT$<%=discount%>
                            </td>
                        </tr>
                     
                        <tr class="con">
                            <td colspan="2">訂單總額</td>
                            <td colspan="2">
                                 NT$<%=total-discount+fare%>
                            </td>
                        </tr>
						
						
						
                    </table>
                </div>
            </div>

        <br><br>
    </div>










</body>

</html>