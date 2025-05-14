<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="stylee.css"> <!-- Assuming stylee.css is your main stylesheet -->
</head>
<body>
  <%
  String redirect = request.getParameter("redirect");
  %>

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

    <!-- Main content area -->
    <main class="login-container">
        <section class="login-banner">
            <!-- Image Banner for offer -->
            <img src="images/50off.png" alt="Flat 500 off banner">
        </section>

        <section class="login-form">
                        <%
            String error = request.getParameter("error");
            if ("invalid".equals(error)) {
        %>
            <div class="error-message">
                <p>Incorrect username or password. Please try again.</p>
            </div>
        <%
            }
        %>
            <form action="user.jsp" method="post" >
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-wrapper">
                      <input type="text" id="username" name="username" required />
                    </div>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <div class="input-wrapper">
                    <input type="password" id="password" name="password" required />
                  </div>
              </div>

                <div class="terms">
                    <p>By continuing, I agree to the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></p>
                </div>
                <input type="hidden" name="redirect" value="<%= redirect != null ? redirect : "index.jsp" %>">

                <button type="submit" class="btn-primary">Continue</button>

                <p class="signup-text">New User? <a href="signup.jsp">SignUp</a></p>
            </form>
        </section>
    </main>

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
</body>
</html>
