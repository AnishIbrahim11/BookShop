# 📚 BookHub - Spring MVC Web Application

A complete Spring MVC web application for managing books using Hibernate and Aiven PostgreSQL database. Users can add books with title, author, and price, and view all books in the system.

## 📖 Documentation

- **[HOW_TO_RUN.md](HOW_TO_RUN.md)** - Quick reference for running the project
- **[QUICKSTART.md](QUICKSTART.md)** - Get started in 5 minutes!
- **[ECLIPSE_SETUP.md](ECLIPSE_SETUP.md)** - Complete guide to setup and run in Eclipse IDE
- **[IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md)** - Detailed implementation overview
- **[database-setup.sql](database-setup.sql)** - SQL script for manual database setup

## 🚀 Features

- **Add Books**: Add new books with title, author, and price
- **View Books**: Display all books in a beautiful table format
- **Spring MVC**: Full MVC architecture with Spring Framework
- **Hibernate ORM**: Database operations using Hibernate
- **Aiven PostgreSQL**: Cloud-hosted PostgreSQL database with SSL support
- **JSP Views**: Modern and responsive UI with JSP pages

## 📋 Prerequisites

Before running this application, make sure you have the following installed:

1. **Java Development Kit (JDK) 8 or higher**
   - Download from: https://www.oracle.com/java/technologies/javase-downloads.html
   - Verify installation: `java -version`

2. **Apache Maven**
   - Download from: https://maven.apache.org/download.cgi
   - Verify installation: `mvn -version`

3. **Aiven PostgreSQL Database**
   - Sign up for free at: https://aiven.io
   - Create a PostgreSQL service
   - Note down your connection details (host, port, username, password, database name)

4. **Apache Tomcat 9.x**
   - Download from: https://tomcat.apache.org/download-90.cgi
   - Extract to a folder on your system

5. **IDE (Choose one)**
   - **Eclipse IDE**: See [ECLIPSE_SETUP.md](ECLIPSE_SETUP.md) for complete Eclipse setup guide
   - **Visual Studio Code**: See instructions below

## 🛠️ IDE Setup Guides

### Eclipse IDE (Recommended for Enterprise Java)
For a complete step-by-step guide on setting up this project in Eclipse IDE, see:
👉 **[ECLIPSE_SETUP.md](ECLIPSE_SETUP.md)**

This guide covers:
- Importing the Maven project into Eclipse
- Configuring Tomcat server in Eclipse
- Building and deploying the application
- Debugging and troubleshooting in Eclipse
- Eclipse-specific tips and tricks

### Visual Studio Code Setup

### Install Required Extensions

Open VS Code and install these extensions:

1. **Extension Pack for Java** (by Microsoft)
   - Includes Java language support, debugging, testing, Maven, and more
   
2. **Spring Boot Extension Pack** (by VMware)
   - Provides Spring Boot support and tools

3. **Tomcat for Java** (by Wei Shen)
   - Allows you to manage and run Tomcat server from VS Code

4. **Maven for Java** (usually included in Extension Pack for Java)

### How to Install Extensions:
1. Open VS Code
2. Click on Extensions icon (or press `Ctrl+Shift+X`)
3. Search for each extension name
4. Click "Install"

## 📦 Database Setup

### Step 1: Create Aiven PostgreSQL Service

1. **Sign up for Aiven (if you haven't already)**
   - Visit https://aiven.io
   - Create a free account
   - Verify your email

2. **Create a PostgreSQL Service**
   - Log in to Aiven Console
   - Click "Create Service"
   - Select "PostgreSQL"
   - Choose a cloud provider and region
   - Select a service plan (free tier available)
   - Give your service a name (e.g., "bookhub-db")
   - Click "Create Service"
   - Wait for the service to start (typically 5-10 minutes)

3. **Get Connection Details**
   - Once the service is running, go to the "Overview" tab
   - You'll find:
     - **Host**: (e.g., bookhub-db-project.aivencloud.com)
     - **Port**: (e.g., 12345)
     - **User**: (typically "avnadmin")
     - **Password**: (click to reveal)
     - **Database**: (typically "defaultdb")
   - Keep these details handy for the next step

### Step 2: Configure Database Credentials

Update the database credentials in `src/main/resources/database.properties`:

```properties
# Aiven PostgreSQL Database Configuration
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://YOUR_AIVEN_HOST:YOUR_AIVEN_PORT/YOUR_DATABASE_NAME?sslmode=require
db.username=YOUR_AIVEN_USERNAME
db.password=YOUR_AIVEN_PASSWORD
```

Replace the placeholders with your actual Aiven PostgreSQL credentials:
- `YOUR_AIVEN_HOST`: Your Aiven PostgreSQL host
- `YOUR_AIVEN_PORT`: Your Aiven PostgreSQL port
- `YOUR_DATABASE_NAME`: Your database name (e.g., "defaultdb")
- `YOUR_AIVEN_USERNAME`: Your Aiven username
- `YOUR_AIVEN_PASSWORD`: Your Aiven password

**Example:**
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://bookhub-db-project.aivencloud.com:12345/defaultdb?sslmode=require
db.username=avnadmin
db.password=your_secure_password_here
```

**Note:** 
- The `sslmode=require` parameter ensures secure SSL connection to Aiven
- The application will automatically create the `books` table on first run thanks to Hibernate's `hibernate.hbm2ddl.auto=update` setting
- No need to manually create the database or tables!

## 🏃 Running the Application in VS Code

### Method 1: Using Tomcat for Java Extension

#### Step 1: Add Tomcat Server to VS Code

1. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on macOS)
2. Type "Tomcat: Add Tomcat Server"
3. Select your Tomcat installation directory
4. Name it (e.g., "Tomcat 9")

#### Step 2: Build the WAR File

1. Open integrated terminal in VS Code (`Ctrl+` ` or View > Terminal)
2. Navigate to project root directory
3. Run Maven build command:

```bash
mvn clean package
```

This will create a WAR file at `target/BookHub.war`

#### Step 3: Deploy and Run

1. Press `Ctrl+Shift+P`
2. Type "Tomcat: Run on Tomcat Server"
3. Select the WAR file from `target/BookHub.war`
4. Tomcat will start and deploy your application

#### Step 4: Access the Application

Open your browser and navigate to:
```
http://localhost:8080/BookHub/books/
```

**Note:** On first run, the application will connect to your Aiven PostgreSQL database and automatically create the necessary tables.

### Method 2: Using Maven and External Tomcat

#### Step 1: Build the Project

```bash
mvn clean package
```

#### Step 2: Deploy WAR File Manually

1. Copy the WAR file from `target/BookHub.war`
2. Paste it into Tomcat's `webapps` folder (e.g., `C:\apache-tomcat-9.x\webapps\`)

#### Step 3: Start Tomcat

**On Windows:**
```bash
# Navigate to Tomcat bin directory
cd C:\apache-tomcat-9.x\bin
# Start Tomcat
startup.bat
```

**On macOS/Linux:**
```bash
# Navigate to Tomcat bin directory
cd /path/to/apache-tomcat-9.x/bin
# Make scripts executable
chmod +x *.sh
# Start Tomcat
./startup.sh
```

#### Step 4: Access the Application

Open your browser and navigate to:
```
http://localhost:8080/BookHub/books/
```

### Method 3: Using Maven Tomcat Plugin (Quick Development)

For quick development and testing, you can use the Maven Tomcat plugin.

#### Step 1: Add Plugin to pom.xml

The pom.xml can be updated with Tomcat Maven plugin for easier development. However, the current setup already supports standard deployment.

#### Step 2: Run with Maven

```bash
mvn tomcat7:run
```

(Note: This requires adding the tomcat7-maven-plugin to pom.xml)

## 📱 Application Usage

### Home Page
- Access the home page at `/books/`
- Two buttons: "Add New Book" and "View All Books"

### Add Book Page
- Click "Add New Book" or navigate to `/books/addBook`
- Fill in the form:
  - Book Title (required)
  - Author (required)
  - Price (required, numeric)
- Click "Save Book" to add to database
- Click "Cancel" to return to view books page

### View Books Page
- Click "View All Books" or navigate to `/books/viewBooks`
- Displays all books in a table with:
  - Book ID
  - Title
  - Author
  - Price
- If no books exist, shows empty state with "Add Your First Book" button

## 🔧 Troubleshooting

### Issue: "Unable to connect to database"
**Solution:**
- Verify your Aiven PostgreSQL service is running
- Check database credentials in `database.properties`
- Ensure the connection URL includes `?sslmode=require`
- Verify your IP is allowed (Aiven allows all IPs by default)
- Check that the PostgreSQL JDBC driver is included in pom.xml

### Issue: "SSL connection failed"
**Solution:**
- Ensure your connection URL has `?sslmode=require` parameter
- Aiven requires SSL connections for security
- Update to the latest PostgreSQL JDBC driver if needed

### Issue: "Port 8080 already in use"
**Solution:**
- Stop any application using port 8080
- Or change Tomcat's port in `server.xml` (in Tomcat's `conf` folder)

### Issue: "Class not found" or "404 error"
**Solution:**
- Clean and rebuild: `mvn clean package`
- Ensure WAR file is properly deployed to Tomcat's webapps folder
- Check Tomcat logs in `logs/catalina.out` for detailed errors

### Issue: "JSP not rendering"
**Solution:**
- Verify JSP files are in `src/main/webapp/WEB-INF/views/`
- Check view resolver configuration in `dispatcher-servlet.xml`
- Ensure servlet mappings are correct in `web.xml`

## 📁 Project Structure

```
BookHub/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── bookhub/
│   │   │           ├── controller/
│   │   │           │   └── BookController.java
│   │   │           ├── dao/
│   │   │           │   ├── BookDAO.java
│   │   │           │   └── BookDAOImpl.java
│   │   │           └── entity/
│   │   │               └── Book.java
│   │   ├── resources/
│   │   │   └── database.properties
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/
│   │       │   │   ├── home.jsp
│   │       │   │   ├── addBook.jsp
│   │       │   │   └── viewBooks.jsp
│   │       │   ├── web.xml
│   │       │   ├── dispatcher-servlet.xml
│   │       │   └── applicationContext.xml
│   │       └── index.jsp
├── pom.xml
└── README.md
```

## 🎯 Technology Stack

- **Java 8+**: Programming language
- **Spring Framework 5.3.20**: MVC and dependency injection
- **Hibernate 5.6.9**: ORM framework
- **Aiven PostgreSQL**: Cloud-hosted PostgreSQL database with SSL
- **JSP & JSTL**: View layer
- **Maven**: Build and dependency management
- **Apache Tomcat 9**: Application server

## 📝 Configuration Files

### web.xml
- Configures Spring DispatcherServlet
- Sets up context configuration
- Defines servlet mappings

### dispatcher-servlet.xml
- Configures Spring MVC
- Sets up view resolver for JSP
- Enables component scanning for controllers

### applicationContext.xml
- Configures Hibernate SessionFactory
- Sets up DataSource with connection pooling
- Enables transaction management
- Configures DAO component scanning

### database.properties
- Database connection settings
- Aiven PostgreSQL credentials and URL
- SSL connection configuration

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements!

## 📄 License

This project is open source and available for educational purposes.

## 🆘 Support

For issues and questions:
1. Check the Troubleshooting section above
2. Review Tomcat logs in `logs/catalina.out`
3. Verify Aiven PostgreSQL connection and credentials
4. Ensure all dependencies are properly installed
5. Check Aiven service status in the Aiven Console

## 🎓 Learning Resources

- [Spring Framework Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/)
- [Hibernate Documentation](https://hibernate.org/orm/documentation/)
- [Maven Guide](https://maven.apache.org/guides/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Aiven Documentation](https://docs.aiven.io/)

---

Happy Coding! 🚀📚"# BookShop" 
