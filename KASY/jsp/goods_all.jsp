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
    <link rel="stylesheet" href="../asset/css/goods_all.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <title>Goods_All</title>
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

    <div id="right" style="height: 1000px; width: 230%;">
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","10844108");
		Statement stmt=con.createStatement();
		ResultSet rs=null;
		sql="USE `kasy`";
		con.createStatement().execute(sql);
				
		sql="SELECT * FROM `list`";
		rs=con.createStatement().executeQuery(sql);
		
		
		
	%>
        <div class=" member">
            <table border="1">
                <br><caption>
                    <h2>商品管理</h2>
                </caption><br>
                <tr class="con">
					<td class="fir">商品編號</td>
                    <td class="fir">商品名稱</td>
                    <td class="fir">商品類別</td>
                    <td class="fir">商品圖片</td>
                    <td class="fir">商品介紹</td>
                    <td class="fir">商品價格</td>
                    <td class="fir">商品尺寸</td>
					<td class="fir">商品顏色</td>
                    <td class="fir">商品數量</td>
                    <td class="fir">商品直徑</td>
					<td class="fir">商品高度</td>
					<td class="fir">商品容量</td>
                    <td class="fir">商品重量</td>
                    <td class="fir">適用器具</td>
                    <td class="fir">供應商編號</td>
					<td class="fir">是否上架</td>
                </tr>
                <!--1-->
				
				<%
				int index = 1;
				while (rs.next())
				{
				%>
                <tr class="con">
                    <form method="POST" action="updateproduct.jsp">
					 <td><%= rs.getString("list_Id") %></td>
					 <input type="hidden" name="list_Id" value="<%= rs.getString("list_Id") %>">
                        <td><input type="text" name="product_name" value="<%= rs.getString("product_name") %>"></td>
                        <td>
							<select name="type" value="<%= rs.getString("type") %>">
							<option value="鑄鐵鍋系列" <%= (rs.getString("type").equals("鑄鐵鍋系列") ? "selected" : "") %>>
								鑄鐵鍋系列
							</option>						                           
                            <option value="造型陶器" <%= (rs.getString("type").equals("造型陶器") ? "selected" : "") %>>
                                造型陶器
                            </option>
                            <option value="調理配件" <%= (rs.getString("type").equals("調理配件") ? "selected" : "") %>>
								調理配件
                            </option>
                        </select>
						</td>
                        <td>	

                        <div>
                            
							<input type="hidden" id="image<%= index %>_1" name="image1" value="<%= rs.getString("image1") %>" required>
                            <img id="img_file<%= index %>_1" src="../asset/image/<%= rs.getString("image1") %>" width="80" height="80">
                        </div>

                        <div>
                           <%
								if (rs.getString("image2") == null || rs.getString("image2").equals(""))
								{
							%>	
									<input type="hidden" id="image<%= index %>_2" name="image2" value="<%= rs.getString("image2") %>">
									<img id="img_file<%= index %>_2" src="../asset/image/example.png" width="80" height="80">
							<%
								}
								else 
								{
							%>
									<input type="hidden" id="image<%= index %>_2" name="image2">
									<img id="img_file<%= index %>_2" src="../asset/image/<%= rs.getString("image2")%>" width="80" height="80">
							<%
								}
							%>
                        </div>

                        <div>
                            <%
								if (rs.getString("image3") == null || rs.getString("image3").equals(""))
								{
							%>		
									<input type="hidden" id="image<%= index %>_3" name="image3" value="<%= rs.getString("image3") %>">							
									<img id="img_file<%= index %>_3" src="../asset/image/example.png" width="80" height="80">
							<%
								}
								else 
								{
							%>
									<input type="hidden" id="image<%= index %>_3" name="image3">	
									<img id="img_file<%= index %>_3" src="../asset/image/<%= rs.getString("image3")%>" width="80" height="80">
							<%
								}
							%>
                        </div>

                        <div>
                            <%
								if (rs.getString("image4") == null || rs.getString("image4").equals(""))
								{
							%>			
									<input type="hidden" id="image<%= index %>_4" name="image4" value="<%= rs.getString("image4") %>">								
									<img id="img_file<%= index %>_4" src="../asset/image/example.png" width="80" height="80">
							<%
								}
								else 
								{
							%>
									<input type="hidden" id="image<%= index %>_4" name="image4">	
									<img id="img_file<%= index %>_4" src="../asset/image/<%= rs.getString("image4")%>" width="80" height="80">
							<%
								}
							%>
                        </div>
						
						<div>
                            <%
								if (rs.getString("image5") == null || rs.getString("image5").equals(""))
								{
							%>			
									<input type="hidden" id="image<%= index %>_5" name="image5" value="<%= rs.getString("image5") %>">								
									<img id="img_file<%= index %>_5" src="../asset/image/example.png" width="80" height="80">
							<%
								}
								else 
								{
							%>
									<input type="hidden" id="image<%= index %>_5" name="image5">	
									<img id="img_file<%= index %>_5" src="../asset/image/<%= rs.getString("image5")%>" width="80" height="80">
							<%
								}
							%>
                        </div>
                    </td>
						
						
						
						
						
						
						
								
						
                        <td><input type="text" name="introduce" value="<%=rs.getString("introduce")%>"></td>
                        <td><input type="text" name="price" value="<%=rs.getString("price")%>"></td>
						<td><input type="text" name="size" value="<%=rs.getString("size")%>"></td>
						<td><input type="text" name="color" value="<%=rs.getString("color")%>"></td>
						<td><input type="text" name="stock" value="<%=rs.getString("stock")%>"></td>
						<td><input type="text" name="diameter" value="<%=rs.getString("diameter")%>"></td>
						<td><input type="text" name="height" value="<%=rs.getString("height")%>"></td>    
						<td><input type="text" name="capacity" value="<%=rs.getString("capacity")%>"></td>
						<td><input type="text" name="weight" value="<%=rs.getString("weight")%>"></td>
						<td><input type="text" name="apply" value="<%=rs.getString("apply")%>"></td> 
						<td><input type="text" name="supplier_Id" value="<%=rs.getString("supplier_Id")%>"></td>		
						
		  						
                    <%
						if (rs.getString("add").equals("V"))
						{
					%>
							<td style="text-align:center;"><input id="add<%= index %>" type="checkbox" name="add" value="V" class="verysmall add" checked></td>
					<%
						}
						else 
						{
					%>
							<td style="text-align:center;"><input id="add<%= index %>" type="checkbox" name="add" value="X" class="verysmall add"></td>
					<%
						}
					%> 
					   

					   <td>
						<button type="submit" class="delete" value="修改">修改</button><br><br>
						
					 </form>
					 
						
                           
                            
							
						<form method="post" action="deleteproduct.jsp"><!--刪除商品-->	
						
                            <button type="submit" class="delete" value="<%= rs.getString("list_Id") %>" name="list_Id">刪除</button>
						</td>
                        </form>
						
                   
                </tr>
                
               
               <%
					index++;
				}
				%> 
            </table>
        </div>
    </div>

	<script language="JavaScript">
        function ShowTime() {
            var NowDate = new Date();
            var h = NowDate.getHours();
            var m = NowDate.getMinutes();
            var s = NowDate.getSeconds();
            document.getElementById('showbox').innerHTML = h + '時' + m + '分' + s + '秒';
            setTimeout('ShowTime()', 1000);
        }

        $(function () {
            $(".input_file").change(function () {				
			    var id = $(this).attr("id").substr(10);
				
				if ($(this).val() != "")
				{
					$("#img_file" + id).attr("src", "../asset/image/" + $(this).val().substr(12));
					$("#image" + id).val($(this).val().substr(12));
				}                
            })
			
			$(".add").change(function(){
				if ($(this).prop("checked"))
				{
					$(this).val("V");
				}
				else 
				{
					$(this).val("X");
				}
			})
        })
    </script>


</body>

</html>