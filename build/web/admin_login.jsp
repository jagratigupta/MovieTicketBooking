<%-- 
    Document   : admin_login
    Created on : 17 Apr, 2019, 12:17:18 PM
    Author     : prate
--%>

<%@page import="java.io.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

            
            <% 
                
                String uname=request.getParameter("uname");
                String pass=request.getParameter("password");
                if("admin".equals(uname) && "12345".equals(pass))
        {
        //    request.getRequestDispatcher("admin_action.html").forward(request, response);
            response.sendRedirect("admin_action.html");
        }
        else
        {
            response.setContentType("text/html;charset=UTF-8");
            //PrintWriter out = response.getWriter();
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println(" <head>\n" +"<title>Admin Action</title>\n"+"<meta charset=\"UTF-8\">\n" +"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +"<link rel=\"stylesheet\" href=\"style.css\">\n" +"</head>");
            out.println("<title>Login Error</title>");            
            out.println("</head>");
            out.println("<body style=\"background-color: bisque\"><marquee class=\"pd\">\n" +"<h3>Invalid Details..<h3> \n" +"</marquee>");
            out.println("<h1>");
            out.println("<center><a href=\"admin_login.html\">Try Again</a></center>");
            out.println("</h1>");
            out.println("</body>");
            out.println("</html>");
        }
                
                %>
                
    
