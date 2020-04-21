
<!DOCTYPE html>
<html lang="en">
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<head>
  <title>After Login Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  
  <style>
      .jumbotron { color:white; background-color:red;max-height:25%; } 
      .imagg {width:50px; height:50px;  margin: -50px 0px 0px 300px; }
      .navbar {
      margin-top: -80px;
      border-radius: 0;
      background-color:gold;
    }
    .navbar-toggle .icon-bar {
  display: block;
  width: 22px;
  height: 2px;
  background-color: #cccccc;
  border-radius: 1px;
}
.row.content {height: 500px}
.sidenav {
      padding-top: 20px;
      background-color:whitesmoke;
      height: 100%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: gold;
      color: white;
      padding: 15px;
    }
    .row .text-center {padding-top: 50px;}

    </style>
<body>
    <% 
         //   request.getRequestDispatcher("login.html").include(request, response);
        try {
          //a   out.print("inside try");
            Cookie ck[]=request.getCookies();  
         //   out.print("after ck");
            String id="";
            if(ck!=null){  
              for(int i=0;i<ck.length;i++){
                if(ck[i].getName().equals("cname")){
             //       out.print(ck[i]);
                   id=ck[i].getValue();
                }
              }  
      %>
    
    <div class="jumbotron">
        <div class="container text-center">
          <h1>Movie Ticket Booking</h1>   
          <p>Online movie ticket</p>
        </div>
        <div class="imagg">
            <img src="1.png" class="img-responsive" alt="Responsive image" >
            <p>Text</p> 
        </div>
        <div id="wel" style="text-align:right;color:darkslateblue;padding-right:20px;">
            <%
                out.print("<h3>"+"Welcome  "+id+" :)</h3>");
            %>
        </div>
    </div>
      
    
        <%  
             }
            }
        catch (Exception e){
          out.print("aaaaaaaaaaa");
         }  
         %> 
    <nav class="navbar navbar">
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>                       
                </button>
                
              </div>
              <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                  <li><a href="#">ABOUT</a></li>
                  <li class="active"><a href="#">HOME</a></li>
                  <li><a href="allMovies.html">ALL MOVIES</a></li>
                  <li><a href="buyticket.jsp">BOOK TICKETS</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                  <li><a href="LogoutServlet"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
              </div>
            </div>
     </nav>
    <div class="container-fluid text-center"> 
        <div class="row content">
        <div class="col-sm-2 sidenav" style="background-color:darkslateblue;color:white;">
            <h2>UPCOMING</h2>
            <img src="super30.jpg" class="img-responsive" alt="Responsive image" width="400" height="300">
            
        </div>
        <div class="col-sm-8 "> 
              <!-- Container (Portfolio Section) -->
<div class="container-fluid text-center bg-grey ">
        <h2>NOW SHOWING</h2><br>
        <div class="row text-center">
          <div class="col-sm-4">
            <div class="thumbnail">
              <img src="kesari.jpg" alt="kesari" width="400" height="300">
            </div>
          </div>
          <div class="col-sm-4">
                <div class="thumbnail">
                  <img src="gullyboy.jpg" alt="Paris" width="400" height="300">
                </div>
              </div>
          <div class="col-sm-4">
            <div class="thumbnail">
              <img src="junglee.jpg" alt="New York" width="400" height="300">
            </div>
          </div>
        </div>
      </div>
      
        </div>    
        <div class="col-sm-2 sidenav" style="background-color:darkslateblue;color:white;">
            <h2>UPCOMING</h2>
            <img src="bharat.jpg" class="img-responsive" alt="Responsive image" width="400" height=auto;>
            
        </div>
        </div>
    </div>
      <footer class="container-fluid text-center">
            <p>Footer Text</p>
      </footer>
        
</body>
