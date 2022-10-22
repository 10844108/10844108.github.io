<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.io.*"%>
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

	    Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		String sql="";
		Connection con=DriverManager.getConnection(url,"root","10844108");
		Statement stmt=con.createStatement();
		ResultSet rs=null;    
		sql="USE `kasy`";
		request.setCharacterEncoding("UTF-8");
		con.createStatement().execute(sql);
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);  
           
		String new_cardnumber=request.getParameter("cardnumber");
        String new_cvv=request.getParameter("cvv");
		java.util.Date date = new java.util.Date();        
        java.sql.Date today = new java.sql.Date(date.getTime());
		   
		sql="SELECT * FROM `order` WHERE `Id`='" + session.getAttribute("id") + "'";	   
		rs=stmt.executeQuery(sql);
		rs.last();
		
		sql="SELECT * FROM `cart`, `order_detail` , `list` WHERE `cart`.`list_Id` COLLATE utf8mb4_unicode_520_ci=`order_detail`.`list_Id` AND `list`.`list_Id` COLLATE utf8mb4_unicode_520_ci=`order_detail`.`list_Id`";	
		rs=stmt.executeQuery(sql);	
		rs.next();
		
			while(rs.next())
			{
				if (Integer.parseInt(rs.getString("cart_quentity")) > Integer.parseInt(rs.getString("stock"))) 
				{
					%>
					<script>
						alert("庫存不足");
						location.replace("shopping.jsp");
					</script>
					<%	
					return;
				}	
			}
			
		sql="INSERT INTO `order` (`Id`, `order_name`, `order_phone`, `order_email`, `order_address`, `order_cardnumber`,`order_cvv`,`order_date`) VALUES (?, ? , ?, ?, ?, ?, ?, ?)";  // 新增訂單
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String) session.getAttribute("id"));
		pstmt.setString(2, new String(request.getParameter("Name")));
		pstmt.setString(3, new String(request.getParameter("payment_phone")));
		pstmt.setString(4, new String(request.getParameter("payment_email")));
		pstmt.setString(5, new String(request.getParameter("payment_address")));
		pstmt.setString(6, new_cardnumber);
		pstmt.setString(7, new_cvv);
		pstmt.setDate(8, today);
		pstmt.execute();
			
		sql="SELECT * FROM `order` ORDER BY `order_id` DESC";  // 取訂單編號
		rs=stmt.executeQuery(sql);
		rs.next();
		String order_id = rs.getString("order_id");
			
		sql="SELECT * FROM `cart` WHERE `Id`='" + session.getAttribute("id") + "'";  // 取購物車資訊
		rs=stmt.executeQuery(sql);
		String sql2="";		
		ResultSet rs2=null;
			while (rs.next())
			{
				sql2="INSERT INTO `order_detail` (`order_id`, `list_Id`, `cart_quentity`) VALUES ('" + order_id + "', '" + rs.getString("list_Id") + "', '" + rs.getString("cart_quentity") + "')";  // 將購物車資料新增訂單詳細資料
				con.createStatement().execute(sql2);
				
				sql2="SELECT * FROM `list` WHERE `list_Id`='" + rs.getString("list_Id") + "'";  // 取庫存和銷量資料
				rs2=con.createStatement().executeQuery(sql2);			
				rs2.next();
				
				int stock = Integer.parseInt(rs2.getString("stock")) - Integer.parseInt(rs.getString("cart_quentity"));
				int sale = Integer.parseInt(rs2.getString("sale")) + Integer.parseInt(rs.getString("cart_quentity"));
				
				sql2="UPDATE `list` SET `stock`='" + stock + "', `sale`='" + sale + "' WHERE `list_Id`='" + rs.getString("list_Id") + "'";  // 更新庫存和銷量資料
				con.createStatement().execute(sql2);
			}
			
		sql="DELETE FROM `cart` WHERE `Id`='" + session.getAttribute("id") + "'";  // 刪除該會員的購物車資料
		stmt.execute(sql);
			
		rs.close();
		con.close();
			
		response.sendRedirect("member_profile.jsp");
%>