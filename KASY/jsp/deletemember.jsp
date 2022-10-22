<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*, java.util.*, java.io.*"%>
<html>
    <head>
        <title>deletemember</title>
    </head>
    <body>
       
	   <%  
//Step 1: 載入資料庫驅動程式 		
        try {
            Class.forName("com.mysql.jdbc.Driver");	  
            try {
//Step 2: 建立連線
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","10844108");   				
	        	if(con.isClosed())
                    out.println("連線建立失敗");
                else
                    {
						
//Step 3: 選擇資料庫	
                    con.createStatement().execute("USE `kasy`");
//Step 4: 執行 SQL 指令
                    String 	sql = "DELETE  FROM `addmember` WHERE `Id`='"+request.getParameter("id")+"'";
					con.createStatement().execute(sql);
                    //SQL語法，將辛普森同學刪除
					
                    response.sendRedirect("server_member.jsp");
//Step 6: 關閉連線                                      
					con.close();
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
