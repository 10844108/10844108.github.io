<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.io.*"%>
<%
	if (session.getAttribute("id") == null)
	{
		%>
			<script>
				alert("請先登入");
				location.replace("serverlog.jsp");
			</script>
		<%
		return;
	}

	String list_Id = request.getParameter("list_Id");

	Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    String sql="";    
    Connection con=DriverManager.getConnection(url,"root","10844108");
	Statement stmt=con.createStatement();
	ResultSet rs = null;
	sql="USE `kasy`";
	stmt.execute(sql);
	//stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	
	sql="DELETE FROM `list` WHERE `list_Id`='" + list_Id + "'"; // 判斷庫存
	stmt.execute(sql);	
	
	response.sendRedirect("goods_all.jsp");
	
	stmt.close();
	con.close();
%>