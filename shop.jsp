<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shop</title>
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

    <div class="container">
      <div class="filter-section">
        <h1>FILTERS</h1>
    
        <div class="filter-group">
            <h3>Gender</h3>
            <label><input type="checkbox" name="gender" value="Men"> Men</label>
            <label><input type="checkbox" name="gender" value="Women"> Women</label>
            <label><input type="checkbox" name="gender" value="Boys"> Boys</label>
            <label><input type="checkbox" name="gender" value="Girls"> Girls</label>
        </div>
    
        <div class="filter-group">
            <h3>Categories</h3>
            <label><input type="checkbox" name="category" value="Tops"> Tops (142479)</label>
            <label><input type="checkbox" name="category" value="Thermal Tops"> Thermal Tops (2917)</label>
            <label><input type="checkbox" name="category" value="Swim Tops"> Swim Tops (319)</label>
        </div>
    
        <div class="filter-group">
            <h3>Brand</h3>
            <label><input type="checkbox" name="brand" value="LULU & SKY"> LULU & SKY (6267)</label>
            <label><input type="checkbox" name="brand" value="BAESD"> BAESD (4137)</label>
            <label><input type="checkbox" name="brand" value="StyleCast"> StyleCast (3596)</label>
            <label><input type="checkbox" name="brand" value="DressBerry"> DressBerry (3409)</label>
            <label><input type="checkbox" name="brand" value="Trendyol"> Trendyol (3170)</label>
            <label><input type="checkbox" name="brand" value="Poshyaa"> Poshyaa (2466)</label>
            <label><input type="checkbox" name="brand" value="Tokyo Talkies"> Tokyo Talkies (2246)</label>
            <label><input type="checkbox" name="brand" value="Friskers"> Friskers (2075)</label>
            <label>+ 1725 more</label>
        </div>
    
        <div class="filter-group">
            <h3>Price</h3>
            <label><input type="radio" name="price" value="0-10000"> &#8377;0 - &#8377;10,000+</label>
        </div>
    
        <div class="filter-group">
            <h3>Color</h3>
            <label><input type="checkbox" name="color" value="Black"> Black (22986)</label>
            <label><input type="checkbox" name="color" value="White"> White (16183)</label>
            <label><input type="checkbox" name="color" value="Blue"> Blue (13756)</label>
            <label><input type="checkbox" name="color" value="Pink"> Pink (13329)</label>
            <label><input type="checkbox" name="color" value="Green"> Green (10871)</label>
            <label><input type="checkbox" name="color" value="Red"> Red (5676)</label>
            <label><input type="checkbox" name="color" value="Yellow"> Yellow (5667)</label>
            <label>+ 39 more</label>
        </div>
    
        <div class="filter-group">
            <h3>Discount Range</h3>
            <label><input type="checkbox" name="discount" value="10%"> 10% and above</label>
            <label><input type="checkbox" name="discount" value="20%"> 20% and above</label>
            <label><input type="checkbox" name="discount" value="30%"> 30% and above</label>
            <label><input type="checkbox" name="discount" value="40%"> 40% and above</label>
            <label><input type="checkbox" name="discount" value="50%"> 50% and above</label>
            <label><input type="checkbox" name="discount" value="60%"> 60% and above</label>
            <label><input type="checkbox" name="discount" value="70%"> 70% and above</label>
            <label><input type="checkbox" name="discount" value="80%"> 80% and above</label>
            <label><input type="checkbox" name="discount" value="90%"> 90% and above</label>
        </div>
    </div>
    
  <%@ page import="java.sql.*" %>
  <%
  String errorProductId = request.getParameter("productId");
  String errorMessage = request.getParameter("errorMessage");
  
  // Database connection parameters
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String username = "System";
  String password = "Sri2004";
  
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  
  try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url, username, password);
  
      // SQL query to fetch product details
      String sql = "SELECT * FROM products";
      stmt = conn.createStatement();
      rs = stmt.executeQuery(sql);
  %>
  
  <div id="productList" class="product-list">
      <%
          while (rs.next()) {
              String productId = rs.getString("PRODUCTID");
              String productName = rs.getString("PRODUCTNAME");
              String productDescription = rs.getString("PRODUCTDESCRIPTION");
              double price = rs.getDouble("PRICE");
              double oldPrice = rs.getDouble("OLDPRICE");
              String imageUrl = rs.getString("IMAGEURL");
              double rating = rs.getDouble("RATING");
      %>
      
      <!-- Product Card -->
      <div class="product-card" id="product-<%= productId %>">
          <div class="product-image">
              <img src="<%= imageUrl %>" alt="<%= productName %>">
          </div>
          <div class="product-info">
              <span class="rating">
                  <%= rating %> &#9733; | 10 reviews
              </span>
              <h3><%= productName %></h3>
              <p class="price">
                  Rs. <%= price %>
                  <span class="old-price">Rs. <%= oldPrice %></span>
              </p>
              <form id="addToCartForm-<%= productId %>" method="POST" action="addToCart.jsp">
                  <input type="hidden" name="productId" value="<%= productId %>" />
                  <input type="hidden" name="uname" value="<%= session.getAttribute("uname") %>" />
              </form>
  
              <!-- Button to trigger form submission -->
              <button class="btn-add-to-cart" onclick="submitAddToCart('<%= productId %>')">Add to Cart</button>
  
              <!-- Message container for error display -->
              <% if (errorProductId != null && errorProductId.equals(productId)) { %>
                  <div class="message" style="margin-top: 10px; color: red; font: 12px;">
                      <p><%= errorMessage %></p>
                  </div>
              <% } %>
  
          </div>
      </div>
      <% } %>
  </div>
  
  <script>
      function submitAddToCart(productId) {
          // Set the product ID in the corresponding form
          document.getElementById('addToCartForm-' + productId).submit();
      }
  </script>
  

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

    
    </div>

    <footer>
      <div class="footer-items">
        <div class="footer-item">
          <h3>ONLINE SHOPPING</h3>
          <a href="/">Men</a>
          <a href="/">Women</a>
          <a href="/">Kids</a>
          <a href="/">Home & Living</a>
          <a href="/">Beauty</a>
          <a href="/">Gift Card</a>
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
  
  </body>
</html>
