<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
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
                <a href="shop.jsp"><span>Thrift</span><sup>New</sup></a>
            </div>
            <div class="navbar-search">
                <input type="text" placeholder="Search for products, brands and more" />
            </div>
            <div class="navbar-icons">
                <div class="navbar-icon">
                    <a href="profile.jsp">Profile</a>
                </div>
                <div class="navbar-icon">
                    <a href="wishlist.jsp">Wishlist</a>
                </div>
                <div class="navbar-icon">
                    <a href="bag.jsp">Bag</a>
                </div>
            </div>
        </nav>
    </header>
    <!-- Header [ END ] -->

    <!-- Order Placed Confirmation [ START ] -->
    <div class="order-confirmation">
        <div class="confirmation-box">
            <h1>Order Placed!</h1>
            <p>Thank you for your purchase. Your order has been successfully placed and is on its way.</p>
            <p>Order Number: <strong>#123456789</strong></p>
            <a href="shop.jsp" class="btn">Continue Shopping</a>
        </div>
    </div>
    <!-- Order Placed Confirmation [ END ] -->

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
        </div>
    </footer>
    <!-- Footer [ END ] -->
</body>
</html>
