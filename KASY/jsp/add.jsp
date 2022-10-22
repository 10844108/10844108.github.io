<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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

<html>
<head>
<title>add</title>
</head>

<body>
<%

try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","10844108");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use kasy";
           con.createStatement().execute(sql);
           request.setCharacterEncoding("UTF-8");  
		   String new_list_Id=request.getParameter("list_Id");
           String new_Name=request.getParameter("Name");   
           String new_product_name=request.getParameter("product_name");
           String new_star=request.getParameter("star");
           String new_subject=request.getParameter("subject");
           String new_message=request.getParameter("message");
			java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());

//Step 4: 執行 SQL 指令	
           sql="INSERT board(`list_Id`,`Name`, `product_name`, `star`, `subject`, `message`,`boarddate`) ";
           sql+="VALUES ('" + new_list_Id + "', ";
		   sql+="'"+new_Name+"', ";
           sql+="'"+new_product_name+"', ";
           sql+="'"+new_star+"', ";
           sql+="'"+new_subject+"', "; 
		   sql+="'"+new_message+"', "; 			   
           sql+="'"+new_date+"')";       

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		
		  
           response.sendRedirect("products_detail.jsp?list_Id="+ new_list_Id );
		  
		  
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
</body>
</html>
