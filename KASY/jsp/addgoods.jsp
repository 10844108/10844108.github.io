<!-- Step 0: import library -->
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<html>
<head>
<title>addgoods</title>
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
           sql="use `kasy`";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
		   String new_list_Id=request.getParameter("list_Id");	
		   String new_type=request.getParameter("type");	   
           String new_producet_name=request.getParameter("product_name");
		   String new_price=request.getParameter("price");
		   String new_size=request.getParameter("size");
		   String new_color=request.getParameter("color");
		   String new_introduce=request.getParameter("introduce");
           String new_diameter=request.getParameter("diameter");
		   String new_height=request.getParameter("height");
		   String new_capacity=request.getParameter("capacity");
		   String new_weight=request.getParameter("weight");
		   String new_add=request.getParameter("add");
           String new_apply=request.getParameter("apply");
		   String new_stock=request.getParameter("stock");
		   String new_sale=request.getParameter("sale");
		   String new_image1=request.getParameter("image1");
		   String new_image2=request.getParameter("image2");
		   String new_image3=request.getParameter("image3");
		   String new_image4=request.getParameter("image4");
		   String new_image5=request.getParameter("image5"); 
           String new_supplier_Id=request.getParameter("supplier_Id");
		    java.sql.Date new_listdate=new java.sql.Date(System.currentTimeMillis());
		   
			
		  
		   
//Step 4: 執行 SQL 指令	
			sql="INSERT list (`list_Id`,`type`,`product_name`,`price`,`size`,`color`,`introduce`,`diameter`,`height`,`capacity`,`weight`,`apply`,`add`,`stock`,`sale`,`image1`,`image2`,`image3`,`image4`,`image5`,`supplier_Id`,`listdate`)";
			sql+="VALUES ('" + new_list_Id + "', ";
			sql+="'"+new_type+"', ";
			sql+="'"+new_producet_name+"', ";
			sql+="'"+new_price+"', ";
			sql+="'"+new_size+"', ";
			sql+="'"+new_color+"', ";
			sql+="'"+new_introduce+"', ";
			sql+="'"+new_diameter+"', ";
			sql+="'"+new_height+"', ";
			sql+="'"+new_capacity+"', ";
			sql+="'"+new_weight+"', ";
			sql+="'"+new_apply+"', ";	
			sql+="'"+new_add+"', ";
            sql+="'"+new_stock+"', ";
            sql+="'"+new_sale+"', "; 
			sql+="'"+new_image1+"', ";
			sql+="'"+new_image2+"', ";
			sql+="'"+new_image3+"', ";		   
            sql+="'"+new_image4+"', ";
            sql+="'"+new_image5+"', "; 
		    sql+="'"+new_supplier_Id+"', ";
            sql+="'"+new_listdate+"')";      
	   
           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
		   response.sendRedirect("goods_add.jsp");
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
