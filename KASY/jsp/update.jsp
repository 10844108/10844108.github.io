<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
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
%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","10844108");
String sql="USE `kasy`";
request.setCharacterEncoding("UTF-8"); 
con.createStatement().execute(sql);

if(session.getAttribute("id") != null ){
    if((request.getParameter("id"))!=null){
		sql = "UPDATE `addmember` SET `Name`='"+new String(request.getParameter("name"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);
		sql = "UPDATE `addmember` SET `birthday`='"+new String(request.getParameter("birthday"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);
		sql = "UPDATE `addmember` SET `phone`='"+(request.getParameter("phone"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);
		sql = "UPDATE `addmember` SET `mail`='"+(request.getParameter("mail"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);
		sql = "UPDATE `addmember` SET `address`='"+new String(request.getParameter("address"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);	
		sql = "UPDATE `addmember` SET `Pwd`='"+(request.getParameter("pwd"))+"' WHERE `Id`='"+session.getAttribute("id")+"'";
		con.createStatement().execute(sql);
		con.close();//結束資料庫連結
		%>
		<script>
				alert("更新成功");
				location.replace("member_profile.jsp");
		</script>
<%
		
	}
	else{
	  con.close();//結束資料庫連結	
	  %>
		<script>
			alert("更新失敗");
			location.replace("member_profile.jsp");
	    </script>
<%
	}
}
else{
	con.close();//結束資料庫連結
}
%>
