<%-- 
    Document   : delete_movieFromDb
    Created on : Apr 21, 2019, 2:19:46 PM
    Author     : Invictus
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con;
                
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
                   Statement st=con.createStatement();
                   
                   String del_mov[]=request.getParameterValues("mname");
                    for(String s:del_mov)
                    {
                        if(st.executeUpdate("delete from mMovieDetail where MNAME='"+s+"'")>0)
                            out.print("<h3>"+s+" Deleted...</h3>");
                        else
                            out.print("<h3>Some Error occured while deleting "+s+"</h3>");
                    }
 //                    request.getRequestDispatcher("admin_action.html").forward(request, response);
                     response.sendRedirect("admin_action.html");
                } 
                catch (ClassNotFoundException ex) {
                  out.print(ex);
                }
                catch (SQLException ex) {
                   out.print(ex);
                }
        %>
    </body>
</html>
