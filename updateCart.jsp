<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "your_db_username";
    String dbPassword = "your_db_password";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        String productid = request.getParameter("productid");
        String size = request.getParameter("size");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the cart in the database
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        String updateSQL = "UPDATE cart SET PSIZE = ?, QUANTITY = ? WHERE PRODUCTID = ?";
        pstmt = conn.prepareStatement(updateSQL);
        pstmt.setString(1, size);
        pstmt.setInt(2, quantity);
        pstmt.setString(3, productid);

        int updatedRows = pstmt.executeUpdate();
        if (updatedRows > 0) {
            response.sendRedirect("bag.jsp");
        } else {
            out.println("Error updating cart.");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
