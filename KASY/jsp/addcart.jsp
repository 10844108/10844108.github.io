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
	ResultSet rs = null;
	sql="USE `kasy`";
	stmt.execute(sql);
	stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	request.setCharacterEncoding("UTF-8");  
	
	String list_Id=request.getParameter("list_Id");
	String new_cart_quentity=request.getParameter("cart_quentity");
	
	
	
	
	sql="SELECT * FROM `cart` WHERE `list_Id`='" + list_Id + "' AND `Id`='" + session.getAttribute("id") + "'";
	rs=stmt.executeQuery(sql);
	rs.last();
	if (rs.getRow() != 0)
	{
		%>
		<script>
			alert("此商品已加入購物車");
			location.replace("shopping.jsp");
		</script>
		<%
		return;
	}
	
	sql="SELECT * FROM `list` WHERE `list_Id`='" + list_Id + "'";	
	rs=stmt.executeQuery(sql);	
	rs.next();
	if (Integer.parseInt(new_cart_quentity) > Integer.parseInt(rs.getString("stock"))) 
	{
		%>
		<script>
			alert("庫存不足");
			location.replace("products_detail.jsp?list_Id=<%= list_Id %>");
		</script>
		<%	
		return;
	}	
	
	sql="INSERT `cart` (`Id`, `list_Id`, `cart_quentity`) VALUES (?, ?, ?)";  // 新增至購物車
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, (String) session.getAttribute("id"));
	pstmt.setString(2, list_Id);
	pstmt.setString(3, new_cart_quentity);		
	pstmt.execute();


    
	%>
		<script>
			alert("成功加入購物車");
			location.replace("shopping.jsp");
		</script>	
	<%	
	rs.close();
	stmt.close();
	con.close();
%>