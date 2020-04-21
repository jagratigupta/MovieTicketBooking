
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
  
            
            <% 
                Connection con; 
                String name=request.getParameter("name");
                String certi=request.getParameter("certificate");
                String genre=request.getParameter("genre");
                String duration=request.getParameter("duration");
                String dir=request.getParameter("director");
                String star=request.getParameter("stars");
                String desc=request.getParameter("description");
                try {
                   Class.forName("oracle.jdbc.driver.OracleDriver");
                   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
                   Statement st=con.createStatement();
                   out.print(name);
                   String q="insert into mMovieDetail values('"+name+"','"+certi+"','"+genre+"','"+duration+"','"+dir+"','"+star+"','"+desc+"')";
                   st.execute(q);
            //      request.getRequestDispatcher("admin_action.html").forward(request, response);
            out.print(name);
            response.sendRedirect("admin_action.html");
                }
                catch (ClassNotFoundException ex) {
                  // Logger.getLogger(myyDb.class.getName()).log(Level.SEVERE, null, ex);
                  out.print(ex);
                }
                catch (SQLException ex) {
                   out.print(ex);
                }
                %>
           </body>
 </html>     
    
