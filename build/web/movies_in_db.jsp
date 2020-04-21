<%-- 
    Document   : delete_movie
    Created on : 17 Apr, 2019, 5:22:07 PM
    Author     : prate
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Movie</title>
        <link rel="stylesheet" href="style.css">
        <script type="text/javascript">
        function func()
   {
   if(window.history.previous) 
   {
   window.navigate('admin_action.html');
   }
   }
    function toast() {
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
   </script>
    </head>
        <body style="background-color:rgb(255, 0, 0);">
    <center>
        <div class="atrcontainer" style="width:50%">
            <div id="snackbar">Movies deleted successfully !</div>
        <h1>Select the movies to be deleted!</h1>
        
         <%  
                Connection con;
                
                try {
                   Class.forName("oracle.jdbc.driver.OracleDriver");
                   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
                   Statement st=con.createStatement();
                   String value = "select mname from mMovieDetail";
                   ResultSet rs=st.executeQuery(value);  
                   ResultSetMetaData rsmd=rs.getMetaData();  
                       int total=rsmd.getColumnCount();
                       String table = "<table style='text-align: center; border: 1px solid black; padding: 2px;'><tr>";  
                       table += "<th> Select </th>";
                            for(int i=1;i<=total;i++){ 
                                table += "<th>"+rsmd.getColumnName(i)+"</th>";  
                            }  
                       table += "</tr>";

                        while(rs.next()){
                            table +="<tr>";
                                table += "<td><input type='checkbox' name='mname' value = '"+rs.getString(1)+"'></td>";
                                table +="<td>"+rs.getString(1)+"</td>";
                            table +="</tr>";
                       }   
                        
                       out.print("<body onunload='func()'><form action='delete_movieFromDb.jsp' method='post' style='text-align: center;'>"+table+"</table>");
                       out.print("<input type='submit' value='Delete Selected' onclick='toast()'></form></body>");
//                       String del_mov[]=request.getParameterValues("mname");
//                    for(String s:del_mov)
//                    {
//                        st.executeUpdate("delete from moviedetails where NAME='"+s+"'");
//                    }
                } 
                catch (ClassNotFoundException ex) {
                  out.print(ex);
                }
                catch (SQLException ex) {
                   out.print(ex);
                }
            %>  
        </div>
    </center>
    </body>
</html>
