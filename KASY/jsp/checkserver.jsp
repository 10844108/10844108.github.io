<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con=DriverManager.getConnection(url,"root","10844108");
String sql="USE `kasy`";
con.createStatement().execute(sql);

if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
    sql = "SELECT * FROM `addserver` WHERE `Id`= ?  AND `Pwd`= ?"  ; 
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("pwd"));
    ResultSet rs =pstmt.executeQuery();
    
    if(rs.next()){            
        session.setAttribute("id",request.getParameter("id"));
		con.close();//結束資料庫連結
        response.sendRedirect("server_page.jsp") ;
    }
    else{
		con.close();//結束資料庫連結
        response.sendRedirect("serverlog.jsp");
	}
}
else
	response.sendRedirect("serverlog.jsp");
%>
