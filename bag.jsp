<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.* , java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <link rel="stylesheet" href="stylee.css" />
    
</head>

<body>
    <!-- Header [ START ] -->
    <header>
        <nav>
          <div class="navbar-logo">
            Style
          </div>
          <div class="navbar-links">
            <a href="shop.jsp">Men</a>
            <a href="shop.jsp">Women</a>
            <a href="shop.jsp">Kids</a>
            
            <a href="shop.jsp" ><span>Thrift</span>
              <sup>New</sup>
            </a>
          </div>
          <div class="navbar-search">
            <span class="search-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                height="20px"
                viewBox="0 0 24 24"
                width="20px"
                fill="#282c3f"
              >
                <path d="M0 0h24v24H0V0z" fill="none" />
                <path
                  d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"
                />
              </svg>
            </span>
            <input
              type="text"
              placeholder="Search for products, brands and more"
            />
          </div>
          <div class="navbar-icons">
            <div class="navbar-icon">
              <span class="profile-icon"></span>
                  <!-- Show profile icon if user is logged in -->
                  <a href="<%= (session.getAttribute("uname") != null) ? "profile.jsp" : "login.jsp" %>">
                
                
                      <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#5f6368">
                          <path d="M0 0h24v24H0V0z" fill="none" />
                          <path d="M12 5.9c1.16 0 2.1.94 2.1 2.1s-.94 2.1-2.1 2.1S9.9 9.16 9.9 8s.94-2.1 2.1-2.1m0 9c2.97 0 6.1 1.46 6.1 2.1v1.1H5.9V17c0-.64 3.13-2.1 6.1-2.1M12 4C9.79 4 8 5.79 8 8s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 9c-2.67 0-8 1.34-8 4v3h16v-3c0-2.66-5.33-4-8-4z"/>
                      </svg>
                  </a>
                  <% if (session.getAttribute("uname") != null) { %>
                    <span class="title"><%= session.getAttribute("uname") %></span>
                <% } else { %>
                    <span class="title">Profile</span>
                <% } %>
                
          </div>
          
            <div class="navbar-icon">
  
              <span class="wishlist-icon">
                
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  height="24px"
                  viewBox="0 0 24 24"
                  width="24px"
                  fill="#5f6368"
                >
                  <path d="M0 0h24v24H0V0z" fill="none" />
                  <path
                    d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"
                  />
                </svg>
              </span>
              
              <span class="title">Wishlist</span>
            </div>
            <div class="navbar-icon">
              <span class="bag-icon">
                <a href="bag.jsp">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  enable-background="new 0 0 24 24"
                  height="24px"
                  viewBox="0 0 24 24"
                  width="24px"
                  fill="#5f6368"
                >
                  <g>
                    <rect fill="none" height="24" width="24" />
                    <path
                      d="M18 6h-2c0-2.21-1.79-4-4-4S8 3.79 8 6H6c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm-6-2c1.1 0 2 .9 2 2h-4c0-1.1.9-2 2-2zm6 16H6V8h2v2c0 .55.45 1 1 1s1-.45 1-1V8h4v2c0 .55.45 1 1 1s1-.45 1-1V8h2v12z"
                    />
                  </g>
                </svg></a>
              </span>
              <span class="title">Bag</span>
            </div>
          </div>
        </nav>
      </header>
      <!-- Header [ END ] -->

<%
    // Check if the user is logged in
    String userId = (session != null) ? (String) session.getAttribute("uname") : null;

    if (userId == null) {
      response.sendRedirect("login.jsp?redirect=bag.jsp");
      return;
        
    }

    // Database connection details
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbUser = "your_db_user";
    String dbPassword = "your_db_password";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int totalMRP = 0;
    int totalDiscount = 0;
    int finalPayment = 0;
    int totalItem = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Query to fetch cart items
        String sql = "SELECT p.productid, p.productname, p.productdescription, p.price, p.oldprice, p.imageurl, c.psize, c.quantity " +
                     "FROM cart c JOIN products p ON c.productid = p.productid " +
                     "WHERE c.userid = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        rs = pstmt.executeQuery();

        if (!rs.isBeforeFirst()) {
%>
<div class="empty-bag">
  <div class="content">
    <h1>Hey! <br>Your bag feels light</h1>
    <p>Your cart is empty. Shop now!!.</p>
  </div>
  
</div>
<%
  } else {
                while (rs.next()) {
                    String productId=rs.getString("productid");
                    String productName = rs.getString("productname");
                    String productDescription = rs.getString("productdescription");
                    double price = rs.getDouble("price");
                    double oldPrice = rs.getDouble("oldprice");
                    String imageUrl = rs.getString("imageurl");
                    int quantity = rs.getInt("quantity");
                    String size = rs.getString("psize");

                    // Calculations
                    totalMRP += oldPrice * quantity;
                    totalDiscount += (oldPrice - price) * quantity;
                    finalPayment += price * quantity;
                    totalItem++;
        %>
        <div class="cart-container">
          <!-- Left Side: Cart Items -->
          <div class="cart-items">
        <div class="bag-item-container">
          <div class="item-left-part">
              <img class="bag-item-img" src="<%= imageUrl %>" />
          </div>
          <div class="item-right-part">
              <div class="company"><h2><%= productName %></h2></div>
              <div class="item-name"><h4><%= productDescription %></h4></div>
      
              <!-- Size Selection -->
              <div class="size-container">
                  <label for="size-select">Size:</label>
                  <select id="size-select-<%= productId %>" name="size" onchange="submitCartUpdate('productId %>')">
                      <option value="S" <%= productId.equals("S") ? "selected" : "" %>>S</option>
                      <option value="M" <%= productId.equals("M") ? "selected" : "" %>>M</option>
                      <option value="L" <%= productId.equals("L") ? "selected" : "" %>>L</option>
                      <option value="XL" <%= productId.equals("XL") ? "selected" : "" %>>XL</option>
                  </select>
              </div>
      
              <!-- Quantity Selection -->
              <div class="quantity-container">
                  <label for="quantity-select">Qty:</label>
                  <input type="number" id="quantity-select-<%= productId %>" name="quantity" value="<%=quantity %>" min="1" max="10" onchange="submitCartUpdate('<%= productId %>')">
              </div>
      
              <div class="price-container">
                  <span class="current-price"><h3>₹ <%= price %></h3><span>
                  <span class="original-price">₹ <%= oldPrice %></span>
                  <span class="discount-percentage">
                    (<%= Math.round((oldPrice - price) / oldPrice * 100) %> % OFF)
                </span>
                
              </div>
              <div class="return-period">
                  <span class="return-period-days">14 days</span> return available
              </div>
              <div class="delivery-details">
                Delivery by <span class="delivery-details-days">
                    <%
                        Calendar cal = Calendar.getInstance();
                        cal.add(Calendar.DATE, 7); // Add 7 days to the current date
                        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yy");
                        String deliveryDate = sdf.format(cal.getTime());
                        out.print(deliveryDate);
                    %>
                </span>
            </div>
          </div>
      
          <!-- Form to send the update -->
          <form id="cart-form-<%= productId %>" action="updateCart.jsp" method="post">
              <input type="hidden" name="productid" value="<%=productId%>">
              <input type="hidden" name="size" id="form-size-<%= productId %>" value="<%= size %>">
              <input type="hidden" name="quantity" id="form-quantity-<%= productId%>" value="<%= quantity %>">
          </form>
      
          <div class="remove-from-cart" style="font-weight: bold; font-size:10px" onclick="removeFromBag('<%= productId %>', '<%= userId %>')">X</div>
          
      </div>
      
      <script>
        function submitCartUpdate(productid) {
            // Get size and quantity from dropdowns
            const size = document.getElementById('size-select-' + productid).value;
            const quantity = document.getElementById('quantity-select-' + productid).value;
        
            // Update hidden form fields with the selected size and quantity
            document.getElementById('form-size-' + productid).value = size;
            document.getElementById('form-quantity-' + productid).value = quantity;
        
            // Submit the form to update the cart
            document.getElementById('cart-form-' + productid).submit();
        }
    </script>
    
      
        <%
                }
            
        %>
    </div>

    <!-- Right Side: Price Details -->
    <div class="bag-details-container">
        <div class="price-header" style="color: #7500ab;"><h2>PRICE DETAILS (<%= totalItem %> Items)</h2></div>
        <div class="pricing">
        <div class="price-item">
            <span class="price-item-tag">Total MRP</span>
            <span class="price-item-value">₹ <%= totalMRP %></span>
        </div>
        <div class="price-item">
            <span class="price-item-tag">Discount on MRP</span>
            <span class="price-item-value priceDetail-base-discount">-₹ <%= totalDiscount %></span>
        </div>
        <div class="price-item">
            <span class="price-item-tag">Convenience Fee</span>
            <span class="price-item-value">₹ 99</span>
        </div>
      </div>
        <hr />
        <div class="price-footer">
            <span class="price-item-tag">Total Amount</span>
            <span class="price-item-value">₹ <%= finalPayment + 99 %></span>
        </div>
        <a href="order.jsp">
          <button class="btn-place-order">PLACE ORDER</button>
      </a>
    </div>
</div>


<%
            }
    } catch (ClassNotFoundException e) {
        out.println("Database Driver not found: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
</div> <!-- This closes bag-details-container -->
</div>
<!-- Footer [ START ] -->
<footer>
    <div class="footer-items">
      <div class="footer-item">
        <h3>ONLINE SHOPPING</h3>
        <a href="/">Men</a>
        <a href="/">Women</a>
        <a href="/">Kids</a>
        <a href="/">Thrift</a>

      </div>
      <div class="footer-item">
        <h3>CUSTOMER POLICIES</h3>
        <a href="/">Contact Us</a>
        <a href="/">FAQ</a>
        <a href="/">T&C</a>
        <a href="/">Terms of Use</a>
        <a href="/">Track Orders</a>
        <a href="/">Shipping</a>
        <a href="/">Cancellation</a>
        <a href="/">Returns</a>
        <a href="/">Privacy Policy</a>

      </div>
      <div class="footer-item">
        <h3>USEFUL LINKS</h3>
        <a href="/">Blog</a>
        <a href="/">Careers</a>
        <a href="/">Site Map</a>

      </div>
    </div>
    <div class="copyright">Style @ 2024</div>
  </footer>
  <!-- Footer [ END ] -->
<script>
    function removeFromBag(productId,userId) {
        // Handle remove from cart logic
        console.log("Product ID: " + productId);
        console.log("User ID: " + userId);

        window.location.href = 'removeFromCart.jsp?productid=' + productId+'&userid='+userId;
    }
</script>

</body>

</html>
