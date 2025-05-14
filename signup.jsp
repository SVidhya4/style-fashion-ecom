
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up | Your Thrift Store</title>
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

    <div class="signup-container">
      <div class="signup-box">
        <h2>Sign Up</h2>
        <form action="signup.jsp" method="POST">
          <!-- Full Name Input -->
          <div class="input-group">
            <label for="name">Full Name</label>
            <input type="text" id="full_name" name="name" placeholder="Enter your full name" required />
          </div>
          <!-- Email Input -->
          <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required />
          </div>
          <!-- Mobile Number Input -->
          <div class="input-group">
            <label for="phone">Mobile Number</label>
            <input type="tel" id="phone" name="phone" placeholder="+91 | Enter your mobile number" required />
          </div>
          <!-- Date of Birth Input -->
          <div class="input-group">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" required />
          </div>
          <!-- Gender Input -->
          <div class="input-group">
            <label for="gender">Gender</label>
            <select id="gender" name="gender" required>
              <option value="">Select your gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
          <!--Location Input-->
          <div class="input-group">
            <label for="location">Location</label>
            <input type="text" id="location" name="location" placeholder="Enter your Location" required />
          </div>
          <!-- Username Input -->
          <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Create a username" required />
          </div>
          <!-- Password Input -->
          <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required />
          </div>
          <!-- Confirm Password Input -->
          <div class="input-group">
            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your password" required />
          </div>
          <!-- Terms and Conditions -->
          <div class="terms">
            <input type="checkbox" id="terms" name="terms" required />
            <label for="terms"> I agree to the <a href="/terms">Terms of Use</a> & <a href="/privacy">Privacy Policy</a></label>
          </div>
          <!-- Sign Up Button -->
          <div class="submit-btn">
            <button type="submit">Sign Up</button>
          </div>
        </form>
      </div>
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
    <%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.Statement, java.sql.SQLException, java.sql.ResultSet" %>

<%
  String method = request.getMethod();

  if ("POST".equalsIgnoreCase(method)) {
    String fullName = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (fullName != null && email != null && phone != null && dob != null && gender != null && username != null && password != null) {
      try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Sri2004");

        // Check if the table already exists
        String checkTableSQL = "SELECT table_name FROM all_tables WHERE table_name = 'USERS'";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(checkTableSQL);

        if (!rs.next()) {
          // Table doesn't exist, so create it
          String createTableSQL = "CREATE TABLE users ("
                + "fname VARCHAR2(100), "
                + "email VARCHAR2(100), "
                + "phone VARCHAR2(15), "
                + "date_of_birth DATE, "
                + "gender VARCHAR2(10), "
                + "userid VARCHAR2(50) UNIQUE, "
                + "password VARCHAR2(50))";

          stmt.execute(createTableSQL);
        }

        // Insert the user's data
        String insertQuery = "INSERT INTO users (fname, email, phone, date_of_birth, gender, userid, password) VALUES (?, ?, ?, TO_DATE(?,'YYYY-MM-DD'), ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(insertQuery);
        ps.setString(1, fullName);
        ps.setString(2, email);
        ps.setString(3, phone);
        ps.setString(4, dob); // Ensure date format is correct
        ps.setString(5, gender);
        ps.setString(6, username);
        ps.setString(7, password);

        int result = ps.executeUpdate();
        if (result > 0) {
          // Redirect to registered.jsp upon successful registration
          response.sendRedirect("login.jsp");
        } else {
          out.println("<p>Error occurred during registration. Please try again.</p>");
        }

        conn.close();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
      }
    }
  }
%>


  </body>
</html>
