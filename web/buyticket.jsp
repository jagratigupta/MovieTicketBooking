<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mname=request.getParameter("movie");
    //out.print(mname);
   
    Connection con;
      try {
           Class.forName("oracle.jdbc.driver.OracleDriver");
           con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","charu123");
           Statement st=con.createStatement();
        
 //          String value = "select mname,datt,show,total_seat,avail_seat from mBookTicket where mname='"+mname+"'";
           String moviename = "select mname from mMovieDetail";
           ResultSet rs=st.executeQuery(moviename);  
//           ResultSetMetaData rsmd=rs.getMetaData();  
//           int total=rsmd.getColumnCount();
         
  
    %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<script>
            var request;  
            function sendInfoo(){ 
                var Movie = document.getElementById("Movie").value;
                var url="after_movie_detail.jsp?movie="+Movie;  

                if(window.XMLHttpRequest){  
                    request=new XMLHttpRequest();  
                } 

                try{  
                    request.onreadystatechange=getInfo;  
                    request.open("GET",url,true);  
                    request.send();  
                    
                }  
                catch(e){  
                    alert("Unable to connect to server");  
                }  
            }
            
            function getInfo(){  
                if(request.readyState===4){  
                    var val=request.responseText;  
                    document.getElementById('showDate').innerHTML=val;  
                }  
            } 
  
  
            var request1;  
            function sendInfo(){ 
                var datt = document.getElementById("datt").value;
                var movie = document.getElementById("Movie").value;
                console.log(datt,movie)
                var url="after_date_detail.jsp?date="+datt+"&movie="+movie; 

                if(window.XMLHttpRequest){  
                    request1=new XMLHttpRequest();  
                } 

                try{  
                    request1.onreadystatechange=getInfo2;  
                    request1.open("GET",url,true);  
                    request1.send();  
                }  
                catch(e){  
                    alert("Unable to connect to server");  
                }  
            }
            
            function getInfo2(){  
                if(request1.readyState==4){  
                    var val=request1.responseText;  
                    document.getElementById('showTimings').innerHTML=val;  
                }  
            }
</script>
<html>
    <head>
        <title>Book Ticket</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    </head>
    <body onload="showDate()" style="background-color:rgb(255, 0, 0);">
    <center>
        <div class="atrcontainer" style="width:80%">
           <form action="booking_receipt.jsp" method="post">
            <div class="imgcontainer1">
            <img src="tic_book.png" alt="book ticket">
            </div>
            
            <p align="left">
                <%
                   if(mname!=null){
                %>
                <script>
                    function showDate(){
                        if(document.getElementById('Movie').nodeType == 1){
                            sendInfoo();
                        }
                    }
                </script>
                 Movie Name: <input type="text" name="movie" value="<% out.print(mname);%>" id="Movie" readonly>
                <%    
                    
                   }
                   else{
                      
                %>
                <label for="movie"></label>
                <b>Select Movie</b><br><select id="Movie" name="movie" required onchange="sendInfoo()">
                    <option value="" disabled selected>Please Select</option><br><br>
 	        <%	  
                      while(rs.next()){ 
  
                %>

<!--                <option value='"+rs.getString(1)+"'><%// out.print(rs.getString(1));%></option>-->
                    <option value<=% rs.getString(1) ;%><% out.print(rs.getString(1));%></option>

                <%
                      }
//                      String Mv =request.getParameter(Movie);
//                       if(Mv!=null){
//                        out.print(Mv);
//                       }
                %>
                </select><br><br>
               <% //  }
                      
                     }
               %>
    <div id="showDate">
         
    </div>
            
    <div id="showTimings">
         
    </div>
<!--        <label for="date"><b>Select Date</b><br></label>
        <input type="date" onload="getDate()" id="date" name="date" required><br><br>-->
        
<!--        <label for="show"></label>
                <b>Select Show*</b><br><select name="Movie" required><option value="" disabled selected>Please Select</option>
 		<option value="1">12:30 PM</option>
 		<option value="2">3:30 PM</option>
                <option value="3">6:30 PM</option>
                </select><br><br>-->
        <label for="seats"><b>Number of Seats</b><br></label>
        <input type="number" name="seats" min="1"  required><br><br>
<%     
      }
      catch (ClassNotFoundException ex) {
         out.print(ex);
      }
      catch (SQLException ex) {
         out.print(ex);
      }



%>
        <input type="submit" value="Book Ticket"></p>
            </form>
        </div>
        </center>
    </body>
</html>

