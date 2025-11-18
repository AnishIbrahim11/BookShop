# 🚀 How to Run BookHub Project

Quick reference guide for running the BookHub Spring MVC application in different IDEs.

## 📚 Available Setup Guides

Choose your preferred IDE:

### 🌙 Eclipse IDE
**Comprehensive Guide**: [ECLIPSE_SETUP.md](ECLIPSE_SETUP.md)
- Step-by-step Eclipse setup instructions
- Tomcat server configuration in Eclipse
- Debugging and troubleshooting tips
- Best practices for Eclipse development

### 💻 Visual Studio Code
**Quick Start**: See "VS Code Setup" section in [README.md](README.md)
- Extension installation guide
- Tomcat plugin setup
- Quick deployment instructions

---

## ⚡ Quick Start (5 Steps)

### 1. Prerequisites
- Java JDK 8+
- Apache Maven
- Apache Tomcat 9.x
- Aiven PostgreSQL database

### 2. Configure Database
Edit `src/main/resources/database.properties`:
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://YOUR_HOST:YOUR_PORT/YOUR_DB?sslmode=require
db.username=YOUR_USERNAME
db.password=YOUR_PASSWORD
```

### 3. Build the Project
```bash
mvn clean package
```

### 4. Deploy to Tomcat
- **Eclipse**: Add project to Tomcat server and start
- **VS Code**: Use Tomcat extension to deploy WAR file
- **Manual**: Copy `target/BookHub.war` to Tomcat's `webapps/` folder

### 5. Access Application
Open browser and navigate to:
```
http://localhost:8080/BookHub/books/
```

---

## 📖 Full Documentation

- **[README.md](README.md)** - Complete project documentation
- **[QUICKSTART.md](QUICKSTART.md)** - 5-minute quick start guide (VS Code focused)
- **[ECLIPSE_SETUP.md](ECLIPSE_SETUP.md)** - Detailed Eclipse IDE setup guide
- **[IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md)** - Technical implementation details

---

## 🆘 Common Issues

### Cannot connect to database
- Verify Aiven PostgreSQL service is running
- Check database credentials in `database.properties`
- Ensure URL includes `?sslmode=require`

### Port 8080 already in use
- Stop other applications using port 8080
- Or change Tomcat port in server configuration

### 404 Error
- Verify URL: `http://localhost:8080/BookHub/books/`
- Ensure project is properly deployed to Tomcat
- Check Tomcat logs for errors

### Build errors
- Update Maven dependencies: `mvn clean install`
- Verify Java version: `java -version` (should be 8+)
- Check Maven installation: `mvn -version`

---

## 💡 Tips

- **For Eclipse users**: Use hot deployment for faster development
- **For VS Code users**: Install Java Extension Pack and Tomcat extension
- **Database**: Tables are created automatically by Hibernate
- **Debugging**: Use your IDE's debug mode to step through code

---

**Need help?** Check the detailed guides linked above or the troubleshooting sections in each guide.

Happy Coding! 🚀📚
