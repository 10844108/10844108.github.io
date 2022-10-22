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
    <link rel="stylesheet" href="../asset/css/goods_add.css">
	<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <title>Goods_Add</title>
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
        <div id="add">
            <div id="all">
                <form method="POST" action="addgoods.jsp">
                    <br><br>
					<center>
                        <h2>商品新增</h2>
                    </center><br><br>
					
					<div class="div_input">
						<h3 class="ya">商品編號：
							<input type="text" name="list_Id" required>
						</h3><br>
					</div>
					
					<div class="div_input">
						<h3 class="ya">商品名稱：
							<input type="text" name="product_name" required>
						</h3><br>
					</div>
					
					<div class="div_input">
						<h3 class="ya">圖片：</h3>
					<div align="center">
						<table class="peach">
							<tr>
								
								<td><input id="input_file1_1" class="input_file" name="image1" type="file" required></td>
								<td><img id="img_file1_1" src="../asset/image/example.png" width="80" height="80"></td>
							</tr>
							<tr>
								<td><input id="input_file1_2" class="input_file" name="image2" type="file"></td>
								<td><img id="img_file1_2" src="../asset/image/example.png" width="80" height="80"></td>
							</tr>
							<tr>
								<td><input id="input_file1_3" class="input_file" name="image3" type="file"></td>
								<td><img id="img_file1_3" src="../asset/image/example.png" width="80" height="80"></td>                        
							</tr>
							<tr>
								<td><input id="input_file1_4" class="input_file" name="image4" type="file"></td>
								<td><img id="img_file1_4" src="../asset/image/example.png" width="80" height="80"></td>                        
							</tr>
							<tr>
								<td><input id="input_file1_5" class="input_file" name="image5" type="file"></td>
								<td><img id="img_file1_5" src="../asset/image/example.png" width="80" height="80"></td>                        
							</tr>
						</table>                    
					</div>
					
					
					<div class="div_input">
						<h3 class="ya">商品介紹：
							<input type="text" name="introduce" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品價格：
							<input type="text" name="price" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品尺寸：
							<input type="text" name="size" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品顏色：
							<input type="text" name="color" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品數量：
							<input type="text" name="stock" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品類別：</h3><br>				
							<select name="type" style="width: 167px; height: 21px;">
								<option value="全部商品">全部商品</option>
								<option value="鑄鐵鍋系列">鑄鐵鍋系列</option>
								<option value="造型陶器">造型陶器</option>
								<option value="調理配件">調理配件</option>
							</select>
					</div><br>
					<div class="div_input">
						<h3 class="ya">商品直徑：
							<input type="text" name="diameter" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品高度：
							<input type="text" name="height" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品容量：
							<input type="text" name="capacity" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">商品重量：
							<input type="text" name="weight" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">適用器具：
							<input type="text" name="apply" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">是否上架：
							<input type="text" name="add" required>
						</h3><br>
					</div>
					<div class="div_input">
						<h3 class="ya">供應商編號：
							<input type="text" name="supplier_Id" required>
						</h3><br>
					</div>
					
                    
					
					<br>
                   <br>
                  
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
								$("#img_file" + id).attr("src", "../asset/image/" + $(this).val().substr(12));
							})
						})
					</script>
                    
					<center>
                        <button id="add-button" type="submit">增加</button>
                    </center>
					
					</div>
                </form>
            </div>
        </div>
    </div>


</body>

</html>