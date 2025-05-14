<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<html>
<head>
    <link rel="stylesheet" href="login.css" />
</head>
<body>
<%
    // Retrieve form data
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String redirectPage = request.getParameter("redirect");

    if (username != null && password != null) {
        try {
            // Set up database connection
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Sri2004");

            // Query to validate the user
            String query = "SELECT * FROM users WHERE userid = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            boolean isValidUser = rs.next();

            if (isValidUser) {
                // Valid user, start session and set username
                session.setAttribute("uname", username);

                // Redirect to the original page or a default page
                if (redirectPage != null && !redirectPage.isEmpty() && !redirectPage.equals("login.jsp")) {
                    response.sendRedirect(redirectPage);
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                // Invalid credentials, redirect back to login with error message
                response.sendRedirect("login.jsp?error=invalid&redirect=" + redirectPage);
            }

            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>
