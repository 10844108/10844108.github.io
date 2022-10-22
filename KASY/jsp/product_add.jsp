<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"%>
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
	sql="USE `store`";
	con.createStatement().execute(sql);

	request.setCharacterEncoding("UTF-8");
	if(con.isClosed())
	{
	   out.println("連線建立失敗!");
	   return;
	}
	else {
			out.println("連線建立成功!");
	}

	String NO = request.getParameter("NO");
	String image1 = request.getParameter("image1");
	String image2 = request.getParameter("image2");
	String image3 = request.getParameter("image3");
	String image4 = request.getParameter("image4");
	String image5 = request.getParameter("image5");
	
	sql = "SELECT * FROM `product`";
	ResultSet rs=con.createStatement().executeQuery(sql);
	while (rs.next())
	{
		if (rs.getString("NO").equals("NO"))
		{
			%>
				<script>
					alert("商品編號重複");
					location.replace("goods_add.jsp");
				</script>
			<%
		}
	}
		
	if (image2 != null)
	{
		if (image3 != null)
		{
			if (image4 != null)
			{
				if(image5 != null)
				{
					sql = "INSERT `product` (`NO`, `Name`,`image1`,`image2`,`image3`,`image4`,`image5`,`introduce`,`price`,`size`,`color`,`quentity`,`type`,`produces`,`standard`,`apply`) VALUES";
					sql += "('" + NO + "', '" + request.getParameter("Name") + "', '"+image1+"','" + image2 + "','" + image3 + "','" + image4 + "','"+image5+"'";
					sql +=",'"+request.getParameter("price") + "', '" + request.getParameter("size") + "', '"+ request.getParameter("color") + "'"+request.getParameter("quentity") + "'"+ request.getParameter("type") + "'"+ request.getParameter("produce") + "'"
					+ request.getParameter("standard") + "'"+ request.getParameter("apply") + "'";
					
				}else{									
					sql = "INSERT `product` (`NO`, `Name`,`image1`,`image2`,`image3`,`image4`,`image5`,`introduce`,`price`,`size`,`color`,`quentity`,`type`,`produces`,`standard`,`apply`) VALUES";
					sql += "('" + NO + "', '" + request.getParameter("Name") + "', '"+image1+"','" + image2 + "','" + image3 + "','" + image4 + "','"+image5+"'";
					sql +=",'"+request.getParameter("price") + "', '" + request.getParameter("size") + "', '"+ request.getParameter("color") + "'"+request.getParameter("quentity") + "'"+ request.getParameter("type") + "'"+ request.getParameter("produce") + "'"
					+ request.getParameter("standard") + "'"+ request.getParameter("apply") + "'";
				}	
			}
			else 
			{
					sql = "INSERT `product` (`NO`, `Name`,`image1`,`image2`,`image3`,`image4`,`image5`,`introduce`,`price`,`size`,`color`,`quentity`,`type`,`produces`,`standard`,`apply`) VALUES";
					sql += "('" + NO + "', '" + request.getParameter("Name") + "', '"+image1+"','" + image2 + "','" + image3 + "','" + image4 + "','"+image5+"'";
					sql +=",'"+request.getParameter("price") + "', '" + request.getParameter("size") + "', '"+ request.getParameter("color") + "'"+request.getParameter("quentity") + "'"+ request.getParameter("type") + "'"+ request.getParameter("produce") + "'"
					+ request.getParameter("standard") + "'"+ request.getParameter("apply") + "'";
					
			
		}
		}
		else 
		{
					sql = "INSERT `product` (`NO`, `Name`,`image1`,`image2`,`image3`,`image4`,`image5`,`introduce`,`price`,`size`,`color`,`quentity`,`type`,`produces`,`standard`,`apply`) VALUES";
					sql += "('" + NO + "', '" + request.getParameter("Name") + "', '"+image1+"','" + image2 + "','" + image3 + "','" + image4 + "','"+image5+"'";
					sql +=",'"+request.getParameter("price") + "', '" + request.getParameter("size") + "', '"+ request.getParameter("color") + "'"+request.getParameter("quentity") + "'"+ request.getParameter("type") + "'"+ request.getParameter("produce") + "'"
					+ request.getParameter("standard") + "'"+ request.getParameter("apply") + "'";
					
	}
	}
	else 
	{
					sql = "INSERT `product` (`NO`, `Name`,`image1`,`image2`,`image3`,`image4`,`image5`,`introduce`,`price`,`size`,`color`,`quentity`,`type`,`produces`,`standard`,`apply`) VALUES";
					sql += "('" + NO + "', '" + request.getParameter("Name") + "', '"+image1+"','" + image2 + "','" + image3 + "','" + image4 + "','"+image5+"'";
					sql +=",'"+request.getParameter("price") + "', '" + request.getParameter("size") + "', '"+ request.getParameter("color") + "'"+request.getParameter("quentity") + "'"+ request.getParameter("type") + "'"+ request.getParameter("produce")+"'"
					+ request.getParameter("standard") + "'"+ request.getParameter("apply") + "'";
					
	}
		
	con.createStatement().execute(sql);	
	
	rs.close();
	con.close();
	
	response.sendRedirect("goods_all.jsp");
%>