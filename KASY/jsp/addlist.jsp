<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>addlist</title>
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
           sql="use `store`";
		   con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");     
		   String new_type=request.getParameter("type");
		   String new_product=request.getParameter("product");
		   String new_price=request.getParameter("price");
           String new_size=request.getParameter("size");
           String new_color=request.getParameter("color");
		   String new_produce=request.getParameter("produce"); 
		   String new_name=request.getParameter("name");
		   String new_img=request.getParameter("img");
		   String new_src=request.getParameter("src");
           String new_stock=request.getParameter("stock");
           String new_diameter=request.getParameter("diameter");
		   String new_height=request.getParameter("height");
		   String new_capacity=request.getParameter("capacity"); 
		   String new_weight=request.getParameter("weight");
		   String new_apply1=request.getParameter("apply1");
		   String new_apply2=request.getParameter("apply2");
           String new_apply3=request.getParameter("apply3");
           String new_apply4=request.getParameter("apply4");
		   String new_apply5=request.getParameter("apply5");
		   String new_apply6=request.getParameter("apply6"); 
		   String new_img1=request.getParameter("img1");
		   String new_img2=request.getParameter("img2");
		   String new_img3=request.getParameter("img3");
           String new_color1=request.getParameter("color1");
           String new_color2=request.getParameter("color2");
		   String new_add=request.getParameter("add");
		   String new_sale=request.getParameter("sale");
		   String new_hotimg=request.getParameter("hotimg"); 
		   String new_src2=request.getParameter("src2");
		   String new_src3=request.getParameter("src3");
		   String new_src4=request.getParameter("src4");
           String new_src5=request.getParameter("src5");
           String new_Id=request.getParameter("Id");
//Step 4: 執行 SQL 指令	
           sql="INSERT list (`type`, product`, `price`, `size`, `color`,`produce`,`name`,`img`,`src`,`stock`,`diameter`,`height`,`capacity`,`weight`,`apply1`,`apply2`,`apply3`,`apply4`,`apply5`,`apply6`,`img1`,`img2`,`img3`,`color1`,`color2`,`add`,`sale`,`hotimg`,`src2`,`src3`,`src4`,`src5`,`Id`) ";
           sql+="VALUES ('" + new_type + "', ";         
		   sql+="'"+new_product+"', ";         
           sql+="'"+new_price+"', ";
           sql+="'"+new_size+"', "; 
		   sql+="'"+new_color+"', ";
		   sql+="'"+new_produce+"', ";
		   sql+="'"+new_name+"', ";         
           sql+="'"+new_img+"', ";
           sql+="'"+new_src+"', "; 
		   sql+="'"+new_stock+"', ";
		   sql+="'"+new_diameter+"', ";
		   sql+="'"+new_height+"', ";         
           sql+="'"+new_capacity+"', ";
           sql+="'"+new_weight+"', "; 
		   sql+="'"+new_apply1+"', ";
		   sql+="'"+new_apply2+"', ";
		   sql+="'"+new_apply3+"', ";         
           sql+="'"+new_apply4+"', ";
           sql+="'"+new_apply5+"', "; 
		   sql+="'"+new_apply6+"', ";
		   sql+="'"+new_img1+"', ";
		   sql+="'"+new_img2+"', ";         
           sql+="'"+new_img3+"', ";
           sql+="'"+new_color1+"', "; 
		   sql+="'"+new_color2+"', ";
		   sql+="'"+new_add+"', ";        
           sql+="'"+new_sale+"', ";
           sql+="'"+new_hotimg+"', "; 
		   sql+="'"+new_src2+"', ";
		   sql+="'"+new_src3+"', ";
		   sql+="'"+new_src4+"', ";
		   sql+="'"+new_src5+"', ";
           sql+="'"+new_Id+"')";      
	   
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
		   response.sendRedirect("products_detail.jsp");
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
