# 🌙 Eclipse IDE Setup Guide for BookHub

This guide will help you import, configure, and run the BookHub Spring MVC application in Eclipse IDE.

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### 1. Java Development Kit (JDK) 8 or higher
- Download from: https://www.oracle.com/java/technologies/javase-downloads.html
- Verify installation: Open terminal/command prompt and run:
  ```bash
  java -version
  ```

### 2. Eclipse IDE for Enterprise Java and Web Developers
- **Download**: https://www.eclipse.org/downloads/packages/
- **Recommended Version**: Eclipse IDE 2023-09 or later
- **Important**: Download "Eclipse IDE for Enterprise Java and Web Developers" (NOT the basic Eclipse IDE)
- This version includes:
  - Java EE Developer Tools
  - JST Server Adapters Extensions
  - Maven Integration (m2e)
  - Web Tools Platform (WTP)

### 3. Apache Maven
- Download from: https://maven.apache.org/download.cgi
- Follow installation instructions for your OS
- Add Maven to your system PATH
- Verify installation:
  ```bash
  mvn -version
  ```

### 4. Apache Tomcat 9.x
- Download from: https://tomcat.apache.org/download-90.cgi
- Extract to a folder on your system (e.g., `C:\apache-tomcat-9.0.x` or `/opt/tomcat`)
- Note the installation path for later use

### 5. Aiven PostgreSQL Database
- Sign up for free at: https://aiven.io
- Create a PostgreSQL service
- Note down your connection details (host, port, username, password, database name)

---

## 🚀 Step-by-Step Setup in Eclipse

### Step 1: Import the Project into Eclipse

#### Option A: Import as Existing Maven Project (Recommended)

1. **Open Eclipse IDE**

2. **Import the Project**
   - Go to: `File` → `Import...`
   - Expand `Maven` folder
   - Select `Existing Maven Projects`
   - Click `Next`

3. **Select Project Location**
   - Click `Browse...`
   - Navigate to the BookHub project folder (where `pom.xml` is located)
   - Click `Select Folder` or `Open`

4. **Verify and Import**
   - Eclipse will automatically detect the `pom.xml` file
   - Ensure the checkbox next to `/pom.xml` is checked
   - Click `Finish`

5. **Wait for Maven Dependencies**
   - Eclipse will download all Maven dependencies automatically
   - This may take a few minutes depending on your internet speed
   - You can see the progress in the bottom-right corner of Eclipse

#### Option B: Clone from Git (If you have the repository URL)

1. **Open Git Perspective**
   - Go to: `Window` → `Perspective` → `Open Perspective` → `Other...`
   - Select `Git` and click `Open`

2. **Clone Repository**
   - Click `Clone a Git repository`
   - Enter the repository URL
   - Follow the wizard to clone the repository

3. **Import as Maven Project**
   - After cloning, follow the steps in Option A to import as existing Maven project

---

### Step 2: Configure the Project

#### Verify Java Compiler Compliance Level

1. **Right-click** on the project in Project Explorer
2. Select `Properties`
3. Go to `Java Compiler`
4. Ensure `Compiler compliance level` is set to `1.8` or higher
5. Click `Apply and Close`

#### Update Maven Project (If needed)

1. **Right-click** on the project
2. Select `Maven` → `Update Project...`
3. Check the box next to your project name
4. Check `Force Update of Snapshots/Releases`
5. Click `OK`

---

### Step 3: Configure Database Connection

#### Update Database Properties File

1. **Navigate to**: `src/main/resources/database.properties`

2. **Double-click** to open the file

3. **Update with your Aiven PostgreSQL credentials**:
   ```properties
   # Aiven PostgreSQL Database Configuration
   db.driver=org.postgresql.Driver
   db.url=jdbc:postgresql://YOUR_AIVEN_HOST:YOUR_AIVEN_PORT/YOUR_DATABASE_NAME?sslmode=require
   db.username=YOUR_AIVEN_USERNAME
   db.password=YOUR_AIVEN_PASSWORD
   ```

4. **Replace the placeholders**:
   - `YOUR_AIVEN_HOST`: Your Aiven PostgreSQL host (e.g., `bookhub-db-project.aivencloud.com`)
   - `YOUR_AIVEN_PORT`: Your Aiven PostgreSQL port (e.g., `12345`)
   - `YOUR_DATABASE_NAME`: Database name (typically `defaultdb`)
   - `YOUR_AIVEN_USERNAME`: Username (typically `avnadmin`)
   - `YOUR_AIVEN_PASSWORD`: Your Aiven password

5. **Example**:
   ```properties
   db.driver=org.postgresql.Driver
   db.url=jdbc:postgresql://bookhub-db-abc123.aivencloud.com:12345/defaultdb?sslmode=require
   db.username=avnadmin
   db.password=your_secure_password
   ```

6. **Save the file**: Press `Ctrl+S` (or `Cmd+S` on macOS)

**Note**: The database tables will be created automatically by Hibernate on first run.

---

### Step 4: Configure Tomcat Server in Eclipse

#### Add Tomcat Server to Eclipse

1. **Open Servers View**
   - Go to: `Window` → `Show View` → `Servers`
   - If you don't see "Servers", go to: `Window` → `Show View` → `Other...` → `Server` → `Servers`

2. **Add New Server**
   - In the Servers view, click the link: `No servers are available. Click this link to create a new server...`
   - Or right-click in the Servers view → `New` → `Server`

3. **Select Tomcat Version**
   - Expand `Apache` folder
   - Select `Tomcat v9.0 Server`
   - Click `Next`

4. **Specify Tomcat Installation Directory**
   - Click `Browse...`
   - Navigate to your Tomcat installation directory (e.g., `C:\apache-tomcat-9.0.x`)
   - Click `Select Folder` or `Open`
   - Click `Finish`

#### Configure Server Settings (Optional but Recommended)

1. **Double-click** on the Tomcat server in the Servers view

2. **Server Locations** (Important for proper deployment):
   - Select: `Use Tomcat installation (takes control of Tomcat installation)`
   - Or: `Use workspace metadata (does not modify Tomcat installation)`

3. **Server Options**:
   - Check: `Serve modules without publishing` (for faster development)
   - Check: `Publish module contexts to separate XML files`

4. **Ports**:
   - Verify HTTP/1.1 port is `8080` (default)
   - If port 8080 is in use, you can change it to another port (e.g., `8081`)

5. **Save**: Press `Ctrl+S` to save the server configuration

6. **Close** the server configuration editor tab

---

### Step 5: Build the Project

#### Option A: Using Eclipse Maven Build

1. **Right-click** on the project in Project Explorer
2. Select `Run As` → `Maven build...`
3. In the "Goals" field, enter: `clean package`
4. Click `Run`
5. Wait for the build to complete (check Console view for progress)
6. You should see `BUILD SUCCESS` in the Console

#### Option B: Using Command Line in Eclipse

1. **Open Terminal in Eclipse**
   - Go to: `Window` → `Show View` → `Terminal`
   - Click the `Open a Terminal` icon (or press the down arrow next to it)
   - Select `Local Terminal`

2. **Run Maven Build**
   ```bash
   mvn clean package
   ```

3. **Verify Success**
   - You should see `BUILD SUCCESS` message
   - The WAR file will be created at: `target/BookHub.war`

---

### Step 6: Deploy and Run on Tomcat

#### Method 1: Add Project to Server (Recommended for Development)

1. **Right-click** on the Tomcat server in the Servers view
2. Select `Add and Remove...`
3. Select your project (`BookHub`) from the `Available` list
4. Click `Add >` to move it to the `Configured` list
5. Click `Finish`

6. **Start the Server**
   - Right-click on the Tomcat server in the Servers view
   - Select `Start` (or click the green "Start" button in the toolbar)
   - Wait for the server to start (check Console view for logs)
   - Look for message: `Server startup in [X] milliseconds`

7. **Access the Application**
   - Open your web browser
   - Navigate to: `http://localhost:8080/BookHub/books/`
   - You should see the BookHub home page!

#### Method 2: Deploy WAR File Manually

1. **Build the Project** (as described in Step 5)

2. **Copy WAR File**
   - Navigate to project's `target` folder
   - Find `BookHub.war`
   - Copy it to Tomcat's `webapps` folder (e.g., `C:\apache-tomcat-9.0.x\webapps\`)

3. **Start Tomcat** (outside Eclipse)
   - **Windows**: Run `<TOMCAT_HOME>\bin\startup.bat`
   - **macOS/Linux**: Run `<TOMCAT_HOME>/bin/startup.sh`

4. **Access the Application**
   - Open browser: `http://localhost:8080/BookHub/books/`

---

## 🎯 Using the Application

### Home Page
- **URL**: `http://localhost:8080/BookHub/books/`
- Two main options:
  - **Add New Book**: Create a new book entry
  - **View All Books**: See all books in the database

### Add Book Page
- **URL**: `http://localhost:8080/BookHub/books/addBook`
- Fill in the form:
  - **Book Title** (required)
  - **Author** (required)
  - **Price** (required, numeric value)
- Click `Save Book` to add to database
- Click `Cancel` to return to the book list

### View Books Page
- **URL**: `http://localhost:8080/BookHub/books/viewBooks`
- Displays all books in a table with:
  - Book ID
  - Title
  - Author
  - Price (formatted as currency)
- If no books exist, shows an empty state with "Add Your First Book" button

---

## 🔧 Troubleshooting

### Issue: "Maven dependencies not downloading"
**Solutions**:
- Check your internet connection
- Right-click project → `Maven` → `Update Project...` → Check `Force Update of Snapshots/Releases`
- Delete the `~/.m2/repository` folder (Maven local repository) and try again
- Check Eclipse Maven settings: `Window` → `Preferences` → `Maven` → `User Settings`

### Issue: "Project has build errors"
**Solutions**:
- Clean the project: `Project` → `Clean...` → Select your project → `Clean`
- Update Maven project: Right-click project → `Maven` → `Update Project...`
- Verify Java compiler compliance: Right-click project → `Properties` → `Java Compiler` → Set to 1.8
- Check for red X marks in Problems view and fix any compilation errors

### Issue: "Cannot connect to database"
**Solutions**:
- Verify your Aiven PostgreSQL service is running in Aiven Console
- Check database credentials in `src/main/resources/database.properties`
- Ensure the connection URL includes `?sslmode=require`
- Verify your IP is allowed (Aiven allows all IPs by default)
- Test connection using a PostgreSQL client (e.g., DBeaver, pgAdmin)

### Issue: "Tomcat fails to start"
**Solutions**:
- Check if port 8080 is already in use:
  - Windows: `netstat -ano | findstr :8080`
  - macOS/Linux: `lsof -i :8080` or `netstat -an | grep 8080`
- Stop any application using port 8080
- Or change Tomcat's port: Double-click server in Servers view → Edit HTTP/1.1 port
- Check Console view for detailed error messages
- Ensure JDK (not JRE) is configured in Eclipse

### Issue: "Server doesn't start or application doesn't deploy"
**Solutions**:
- Clean Tomcat work directory:
  - Right-click server in Servers view → `Clean...`
  - Or manually delete: `<workspace>/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/`
- Remove and re-add the project to server
- Verify server configuration: Double-click server → Check server locations
- Check Eclipse Error Log: `Window` → `Show View` → `Error Log`

### Issue: "404 Error - Page Not Found"
**Solutions**:
- Verify the URL is correct: `http://localhost:8080/BookHub/books/`
- Ensure the project is deployed: Check Servers view, project should be listed under Tomcat
- Check the application deployment status in the Servers view (should show [Started, Synchronized])
- Verify `web.xml` and Spring configuration files are correct
- Clean and rebuild the project
- Check Tomcat logs in Console view

### Issue: "JSP pages not rendering"
**Solutions**:
- Verify JSP files are in `src/main/webapp/WEB-INF/views/`
- Check view resolver configuration in `dispatcher-servlet.xml`
- Ensure servlet mappings are correct in `web.xml`
- Clean and republish the project to server

### Issue: "Hibernate/Database errors"
**Solutions**:
- Check Hibernate logs in Console view
- Verify database connection properties
- Ensure PostgreSQL JDBC driver is included in `pom.xml` (should be automatic)
- Check if database tables exist (Hibernate should create them automatically)
- Verify Hibernate configuration in `applicationContext.xml`

### Issue: "ClassNotFoundException or NoClassDefFoundError"
**Solutions**:
- Update Maven dependencies: Right-click project → `Maven` → `Update Project...`
- Clean and build: `Project` → `Clean...`
- Check Maven dependencies are properly downloaded: Verify `.m2/repository` folder
- Ensure deployment assembly includes Maven dependencies:
  - Right-click project → `Properties` → `Deployment Assembly`
  - Should include "Maven Dependencies" pointing to `WEB-INF/lib`

---

## 💡 Eclipse Tips and Tricks

### Useful Keyboard Shortcuts
- `Ctrl+Shift+T`: Open Type (quickly find and open any Java class)
- `Ctrl+Shift+R`: Open Resource (find any file)
- `Ctrl+Space`: Auto-complete
- `Ctrl+Shift+O`: Organize imports
- `Ctrl+Shift+F`: Format code
- `Alt+Shift+R`: Rename refactoring
- `F3`: Go to declaration
- `Ctrl+/`: Toggle comment
- `Ctrl+Shift+L`: Show all keyboard shortcuts

### Hot Deployment (Automatic Reload)
1. Double-click on Tomcat server in Servers view
2. Set "Publishing" to: `Automatically publish when resources change`
3. Save the configuration
4. Now, when you save Java files, Eclipse will automatically redeploy them

### Console Log Management
- To clear Console: Click the "Clear" button (page with red X icon)
- To scroll lock: Click the "Scroll Lock" button
- To show different consoles: Click the monitor icon dropdown

### Debug Mode
1. Set breakpoints: Double-click in the left margin of the code editor
2. Right-click server → `Debug`
3. Use Debug perspective: `Window` → `Perspective` → `Open Perspective` → `Debug`
4. Step through code using F5 (step into), F6 (step over), F7 (step return), F8 (resume)

### Code Formatting
1. Configure Java code style: `Window` → `Preferences` → `Java` → `Code Style` → `Formatter`
2. Format on save (optional): `Window` → `Preferences` → `Java` → `Editor` → `Save Actions`
   - Check "Perform the selected actions on save"
   - Check "Format source code"

---

## 📁 Project Structure in Eclipse

```
BookHub [com.bookhub:BookHub:war]
├── src/main/java
│   └── com.bookhub
│       ├── controller
│       │   └── BookController.java
│       ├── dao
│       │   ├── BookDAO.java
│       │   └── BookDAOImpl.java
│       └── entity
│           └── Book.java
├── src/main/resources
│   └── database.properties
├── src/main/webapp
│   ├── WEB-INF
│   │   ├── views
│   │   │   ├── home.jsp
│   │   │   ├── addBook.jsp
│   │   │   └── viewBooks.jsp
│   │   ├── web.xml
│   │   ├── dispatcher-servlet.xml
│   │   └── applicationContext.xml
│   └── index.jsp
├── JRE System Library [JavaSE-1.8]
├── Maven Dependencies
├── target (build output)
└── pom.xml
```

---

## 🎓 Additional Resources

### Eclipse Documentation
- [Eclipse IDE Documentation](https://www.eclipse.org/documentation/)
- [Eclipse Web Tools Platform (WTP)](https://www.eclipse.org/webtools/)
- [M2Eclipse (Maven Integration)](https://www.eclipse.org/m2e/)

### Spring Framework
- [Spring Framework Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/)
- [Spring MVC Documentation](https://docs.spring.io/spring-framework/docs/current/reference/html/web.html)

### Hibernate ORM
- [Hibernate Documentation](https://hibernate.org/orm/documentation/)
- [Hibernate Getting Started Guide](https://docs.jboss.org/hibernate/orm/current/quickstart/html_single/)

### PostgreSQL & Aiven
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Aiven Documentation](https://docs.aiven.io/)

### Apache Tomcat
- [Tomcat 9 Documentation](https://tomcat.apache.org/tomcat-9.0-doc/)

---

## 🤝 Need More Help?

1. **Check the existing documentation**:
   - [README.md](README.md) - Project overview
   - [QUICKSTART.md](QUICKSTART.md) - Quick start guide (VS Code focused)
   - [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) - Implementation details

2. **Review Eclipse Error Log**:
   - `Window` → `Show View` → `Error Log`
   - Look for detailed error messages

3. **Check Tomcat Logs**:
   - Console view in Eclipse
   - Or check logs in: `<TOMCAT_HOME>/logs/catalina.out`

4. **Verify Aiven Service**:
   - Log in to [Aiven Console](https://console.aiven.io/)
   - Check if your PostgreSQL service is running
   - Verify connection details

---

## ✅ Post-Setup Checklist

- [ ] Eclipse IDE for Enterprise Java is installed
- [ ] JDK 8+ is installed and configured in Eclipse
- [ ] Maven is installed and working
- [ ] Project imported successfully into Eclipse
- [ ] Maven dependencies downloaded (no red X marks on project)
- [ ] Database credentials configured in `database.properties`
- [ ] Tomcat 9 server added to Eclipse
- [ ] Project builds successfully (`mvn clean package`)
- [ ] Project deployed to Tomcat server
- [ ] Application accessible at `http://localhost:8080/BookHub/books/`
- [ ] Can add a book successfully
- [ ] Can view books successfully

---

## 🎉 Congratulations!

You have successfully set up the BookHub project in Eclipse IDE! You can now:
- Add new books to the system
- View all books in the database
- Modify the code and see changes in real-time
- Debug the application using Eclipse's powerful debugging tools

**Happy Coding!** 🚀📚
