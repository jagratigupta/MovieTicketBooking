
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con;
    String moviename = request.getParameter("moviename"); 
   // out.print("<h3>"+moviename+"</h3>");
      try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
           Statement st=con.createStatement();
        
           String value = "select mname,certi,genre,duration,director,stars,descrip from mMovieDetail where mname='"+moviename+"'";
           ResultSet rs=st.executeQuery(value);  
//           ResultSetMetaData rsmd=rs.getMetaData();  
//           int total=rsmd.getColumnCount();
        
 %>            
 <%--    <%    }
        }
        catch (ClassNotFoundException ex) {
            out.print(ex);
        }
        catch (SQLException ex) {
            out.print(ex);
        }

    

%> --%>
<html>
    <head>
        <title>Movie Detail</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <style>
        form input {
  border: none;
  background: transparent;
  border-bottom: 1px solid #fff;
  outline: none;
}
.container.container-rounded {
 border-radius: 10px; 
 box-shadow: 0 0 5px rgba(1, 1, 1, 0.7);
 background-color: gold;
 margin-top: 20px;
 padding: 5px; 
}
        </style>
    </head>
    <body style="background-color:rgb(255, 0, 0);">
    <center>
        <div class="atrcontainer" style="width:70%">
            <form action="buyticket.jsp" method="post">
<!--                <div class="imgcontainer1">
            <img src="1.png" alt="book ticket">
                </div>-->
                <div class="imgcontainer3">
                <img src="1.png" onerror="this.src='default.png'" width="450" height="150" />
                </div>
                <div class="container container-rounded" style="width:50%;">
                    <h2>MOVIE DETAIL</h2>
            <p align="left">
                <%
                    while(rs.next()){
                %>
                Movie Name: <input type="text" name="movie" value="<% out.print(rs.getString(1));%>" readonly>
            
              <p align="left">  Certificate: <input type="text" name="movie" value="<% out.print(rs.getString(2));%>" readonly>
                  <br>
               <p align="left"> Genre: <input type="text" name="movie" value="<% out.print(rs.getString(3));%>"readonly>
            <br>    
              <p align="left">  Duration: <input type="text" name="movie" value="<% out.print(rs.getString(4));%>"readonly>
            <br>
              <p align="left">  Director: <input type="text" name="movie" value="<% out.print(rs.getString(5));%>"readonly>
            <hr>
              <p align="left">  Stars: <input type="text" name="movie" value="<% out.print(rs.getString(6));%>"readonly>
            <hr>    
               <p align="left"> Description:<br><br> <input type="text" name="movie" value="<% out.print(rs.getString(7));%>" readonly style="width:450px; "> 
            <br>
            <hr>
             <%     }
                    }
                      catch (ClassNotFoundException ex) {
                          out.print(ex);
                      }
                      catch (SQLException ex) {
                          out.print(ex);
                      }



              %>
        <input type="submit" value="Book Ticket"> 
                </div>
            </form>
        </div>
        </center>
    </body>
</html>

