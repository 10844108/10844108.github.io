<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<%
	if (session.getAttribute("id") == null)
	{
		%>
			<script>
				alert("請先登入");
				location.replace(serverlog.jsp");
			</script>
		<%
		return;
	}
%>
	<%

	Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    String sql="";
	Connection con=DriverManager.getConnection(url,"root","10844108");
	sql="USE `kasy`";
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
	
	
	String list_Id = request.getParameter("list_Id");
	String add = request.getParameter("add");
    	
	sql="UPDATE `list` SET `product_name`='" + request.getParameter("product_name")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `type`='" + request.getParameter("type")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);	
	
	sql="UPDATE `list` SET `price`='" + request.getParameter("price")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `size`='" + request.getParameter("size")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `color`='" +request.getParameter("color")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `introduce`='" + request.getParameter("introduce")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `diameter`='" + request.getParameter("diameter")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `height`='" + request.getParameter("height")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `capacity`='" + request.getParameter("capacity")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `weight`='" + request.getParameter("weight")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `apply`='" + request.getParameter("apply")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `add`='" + request.getParameter("add")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `stock`='" + request.getParameter("stock")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	sql="UPDATE `list` SET `supplier_Id`='" + request.getParameter("supplier_Id")+"' WHERE `list_Id`='"+list_Id+"'";
	con.createStatement().execute(sql);
	
	
	
	con.close();
	

	response.sendRedirect("goods_all.jsp");	
%>