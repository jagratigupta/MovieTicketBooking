
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%//@page import="java.util.Date;"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.ParseException "%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        Connection con;
        String movie = request.getParameter("movie"); 
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
            Statement st=con.createStatement();
            String value = "select datt,show from mBookTicket where mname='"+movie+"'";
            ResultSet rs=st.executeQuery(value);     

            String showdate="<label for='date'></label><b>Select Date</b><br><select id='datt' name='datt' required onchange='sendInfo()'><option value='' disabled selected>Please Select</option><br><br>";
            SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");  
            while(rs.next()){
                java.sql.Date date=rs.getDate(1);
                String strDate = formatter.format(date); 
                showdate +="<option value='"+strDate+ "'>"+strDate+"</option>";
            }
            showdate +=  "</select><br><br>";
            out.print(showdate);
        }
        catch (ClassNotFoundException ex) {
            out.print(ex);
        }
        catch (SQLException ex) {
           out.print(ex);
        }
%>
