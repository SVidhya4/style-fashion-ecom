# 👗 STYLE – Fashion E-Commerce Platform

STYLE is a dynamic fashion e-commerce web application built using Java (Servlets & JSP), HTML5, CSS, and Oracle Database, deployed on Apache Tomcat. It provides core online shopping features like user authentication, product browsing and cart management all in a clean and responsive UI.

![image](https://github.com/user-attachments/assets/7dbb3b94-7569-4250-b6a9-5cf495757e6d)
![image](https://github.com/user-attachments/assets/14045062-f14a-4813-a4e0-8ec3d9919fe1)

---

## 🌐 Features

- 🔐 User Signup/Login with session handling
- 🛍️ Product catalog with images, pricing, and categories
- 🛒 Add to Cart, View Cart, and Checkout functionality
- 📦 Admin panel for product & order management
- 📄 Dynamic pages built using JSP and JSTL
- 🍪 Browser cookies used for session tracking
- 🗂️ MVC Architecture with Servlets as Controllers
- 🧑‍💻 JDBC integration with Oracle Database

---

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3
- **Backend**: Java (Servlets, JSP, JSTL)
- **Database**: Oracle SQL
- **Web Server**: Apache Tomcat 9.x
- **Architecture**: MVC

---

## 🚀 How to Run Locally (Apache Tomcat)

### 📁 Prerequisites

- JDK 8 or higher
- Apache Tomcat 9.x
- Oracle Database (with user and schema created)
- IDE (Eclipse / IntelliJ / VS Code with Java support)

---


### 🧩 Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/SVidhya4/style-fashion-ecom.git
   cd style-fashion-ecom

2. **Import Project into IDE**

  -Open your IDE and import the project as a Dynamic Web Project (Eclipse) or Maven Web Project (if applicable).
  -Link Apache Tomcat in your server configurations.
  
3. **Configure Database Connection**
   
  -Open DBConnection.java (or equivalent)
  -Update your Oracle DB connection string, username, and password.
  ```
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String user = "your_db_user";
    String pass = "your_db_password";
  ```

4. **Deploy to Apache Tomcat**

  -Right-click on project > Run on Server
  -Or place the .war file in tomcat/webapps/ and start the server.

5. **Access Application**
  -on localhost
  ```
  http://localhost:8080/
