
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Connection con;
        String movie = request.getParameter("movie"); 
        //out.print(movie);
        String date = request.getParameter("date"); 
        //out.print(date);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
            Statement st=con.createStatement();
            String value = "select show,total_seat,avail_seat from mBookTicket where mname='"+movie+"' AND datt='"+date+"'";
            ResultSet rs=st.executeQuery(value);       
            String showTimings = "<label for='show'></label><b>Select Show</b><br><select id='show' name='show' required ><option value='' disabled selected>Please Select</option><br><br>";
        	        
            while(rs.next()){
        
               showTimings += "<option value='" + rs.getString(1) + "'>"+rs.getString(1)+"</option>";
         
            }
         
            showTimings +=  "</select><br><br>";
            
            out.print(showTimings);
        }
        catch (ClassNotFoundException ex) {
            out.print(ex);
        }
        catch (SQLException ex) {
           out.print(ex);
        }
%>
