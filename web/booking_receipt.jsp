
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Booking receipt</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
        <style>
            body {
              font-family: Arial;
            }

            .coupon {
              border: 5px dotted #bbb;
              width: 80%;
              border-radius: 15px;
              margin: 0 auto;
              max-width: 600px;
            }

            .container {
              padding: 2px 16px;
              background-color: #f1f1f1;
            }

            .promo {
              background: #ccc;
              padding: 3px;
            }

            .expire {
              color: red;
            }
        </style>
    </head>
    <body style="background-color:rgb(255, 0, 0);">
    
<%
             Connection con;
      try {
            String avail_seat="";
            int avail_seat_intt=0;
            int seat_intt;
            int pay;
            String input="";
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
            Statement st=con.createStatement();
            Statement st1=con.createStatement();
            String mname=request.getParameter("movie");
            String datt=request.getParameter("datt");
            String show=request.getParameter("show");
            String seat=request.getParameter("seats");
            seat_intt= Integer.parseInt(seat);
           
            String chk = "select total_seat,avail_seat from mBookTicket where mname='"+mname+"' AND datt='"+datt+"' AND show='"+show+"'";
            ResultSet rs=st.executeQuery(chk);  
            
            while(rs.next()){ 
                 avail_seat=rs.getString(2);
                 avail_seat_intt = Integer.parseInt(avail_seat);		
            }
              st.close();
          //  int total_price;
            
            // Get an array of Cookies associated with the this domain
            Cookie [] cookies = request.getCookies();
            if( cookies != null ) {
                for (int i = 0; i < cookies.length; i++) {
                    if(cookies[i].getName().equals("cname") && cookies[i].getValue()!= null) {
                          String uname=cookies[i].getValue();
                         %>
                            <centre>
                              <div class="coupon">
                              <div class="container">
                                <h3>BOOKING RECEIPT</h3>
                              </div>
                              <img src="popcorn.jpg" alt="popcorn" style="width:80%;">
                    
                              <div class="container" style="background-color:white">
                                <h2><b><%out.print(mname); %></b></h2> 
                                <p><b>Show :</b> <% out.print(show); %></p>
                                <p><b>Day :</b> <% out.print(datt); %></p>
                              </div>
                              <div class="container">
                                 <p>Seats : <span class="promo"><% out.print(seat);%></span></p>
                                 <% if(seat_intt <= avail_seat_intt){
                                      input="insert into muserbooking values('"+uname.toString()+"','"+mname+"','"+datt+"','"+show+"','"+seat+"');";
                                      out.print(datt);
//                                      st1.execute(input);
//                                      st1.close();
                                      pay = 200*seat_intt;
                                 %>
                                
                                <p><b>Amount :</b> <% out.print(pay); %></p>
                                <%    
                                    }
                                    else{
                                %>
                                <p>seats not available</p>
                                <%
                                    }
                                %>
                                
                               </div>
                               </div>
                            </centre>

                         <%
                             break;
                    }else{
                        out.print("login first");
                        %>
                        <script>
                            redirect();
                            function redirect(){
                                window.location.replace("login.html");
                            }
                        </script> 
                        <%
                      
                    }
                     
                }                                
            }
        }
        catch (ClassNotFoundException ex) {
         out.print(ex);
         
      }
      catch (SQLException ex) {
         out.print(ex);
      }
      catch (Exception ex) {
         out.print(ex);
      }



%>
    </body>
</html>
