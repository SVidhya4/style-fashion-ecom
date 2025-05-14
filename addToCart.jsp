<%@ page import="java.sql.*, javax.servlet.http.*, java.net.URLEncoder" %>

<%
    // Initialize variables
    String username = (String) session.getAttribute("uname"); // Retrieve username from session
    String productId = request.getParameter("productId");
    String message = ""; // To display success or error message

    // Database connection details
    String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "System";
    String dbPassword = "Sri2004";

    Connection conn = null;
    PreparedStatement stmt = null;
    Statement createTableStmt = null; // Separate Statement for table creation
    ResultSet rs = null;

    // Check if the form is submitted
    if (productId == null || productId.isEmpty()) {
        message = "Invalid product information.";
    } else if (username == null || username.isEmpty()) {
        // Redirect to login.jsp if user is not logged in
        response.sendRedirect("login.jsp?redirect=shop.jsp");
        return; // Exit the JSP
    } else {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);


            // Now handle adding to cart if the productId is present
            String checkCartQuery = "SELECT * FROM cart WHERE userid = ? AND productid = ?";
            stmt = conn.prepareStatement(checkCartQuery);
            stmt.setString(1, username);
            stmt.setString(2, productId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                int existingQuantity = rs.getInt("quantity");
                int newQuantity = existingQuantity + 1; // Increment the quantity

                // Update the cart
                String updateCartQuery = "UPDATE cart SET quantity = ? WHERE userid = ? AND productid = ?";
                stmt = conn.prepareStatement(updateCartQuery);
                stmt.setInt(1, newQuantity);
                stmt.setString(2, username);
                stmt.setString(3, productId);

                int updatedRows = stmt.executeUpdate();
                if (updatedRows > 0) {
                    message = "Quantity updated in your cart!";
                }
            } else {
                // Insert the product into the cart
                String insertQuery = "INSERT INTO cart (userid, productid, quantity) VALUES (?, ?, ?)";
                stmt = conn.prepareStatement(insertQuery);
                stmt.setString(1, username);
                stmt.setString(2, productId);
                stmt.setInt(3, 1); // Default quantity is 1 when first added

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                    message = "Product successfully added to your cart!";
                } else {
                    message = "Error: Unable to add product to cart.";
                }
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (stmt != null) try { stmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }
    // Redirect to shop.jsp with the message (if needed)
    response.sendRedirect("shop.jsp?productId=" + productId + "&errorMessage=" + URLEncoder.encode(message, "UTF-8"));

%>
