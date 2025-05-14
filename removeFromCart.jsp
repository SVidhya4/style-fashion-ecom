<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>

<%
    String productId = request.getParameter("productid");
    String userId = request.getParameter("userid"); // Assuming you also pass userId

    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "your_db_username";
    String dbPassword = "your_db_password";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // SQL statement to remove the item from the cart
        String sql = "DELETE FROM cart WHERE productid = ? AND userid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        pstmt.setString(2, userId);

        // Execute the update
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("bag.jsp");
        } else {
            out.println("No item found to remove.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        // Clean up resources
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
