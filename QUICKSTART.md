# 🚀 Quick Start Guide

Get BookHub running in 5 minutes!

## Prerequisites Checklist
- [ ] Java JDK 8+ installed
- [ ] Maven installed
- [ ] Aiven PostgreSQL service created
- [ ] Apache Tomcat 9.x downloaded
- [ ] VS Code with Java extensions installed

## Step-by-Step Setup

### 1. Aiven PostgreSQL Setup (3 minutes)
```bash
# Go to https://aiven.io and create a free account
# Create a new PostgreSQL service:
# 1. Click "Create Service"
# 2. Select "PostgreSQL"
# 3. Choose your preferred cloud provider and region
# 4. Select a service plan (free tier available)
# 5. Click "Create Service"
# 6. Wait for service to start (5-10 minutes)
# 7. Note down your connection details from the Overview tab:
#    - Host, Port, User, Password, Database name
```

### 2. Configure Database (1 minute)
Edit `src/main/resources/database.properties`:
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://YOUR_AIVEN_HOST:YOUR_AIVEN_PORT/YOUR_DATABASE_NAME?sslmode=require
db.username=YOUR_AIVEN_USERNAME
db.password=YOUR_AIVEN_PASSWORD
```

Replace placeholders with your actual Aiven PostgreSQL credentials:
- `YOUR_AIVEN_HOST`: Your Aiven host (e.g., bookhub-db.aivencloud.com)
- `YOUR_AIVEN_PORT`: Your Aiven port (e.g., 12345)
- `YOUR_DATABASE_NAME`: Database name (e.g., defaultdb)
- `YOUR_AIVEN_USERNAME`: Username (typically avnadmin)
- `YOUR_AIVEN_PASSWORD`: Your Aiven password

**Example:**
```properties
db.driver=org.postgresql.Driver
db.url=jdbc:postgresql://bookhub-db-abc123.aivencloud.com:12345/defaultdb?sslmode=require
db.username=avnadmin
db.password=your_secure_password
```

### 3. Build Application (1 minute)
```bash
# In project root directory
mvn clean package
```
This creates `target/BookHub.war`

### 4. Deploy to Tomcat (1 minute)

**Option A - VS Code Tomcat Extension:**
1. Install "Tomcat for Java" extension in VS Code
2. Press `Ctrl+Shift+P` → "Tomcat: Add Tomcat Server"
3. Press `Ctrl+Shift+P` → "Tomcat: Run on Tomcat Server"
4. Select `target/BookHub.war`

**Option B - Manual Deployment:**
1. Copy `target/BookHub.war` to `<TOMCAT_HOME>/webapps/`
2. Start Tomcat:
   - Windows: `<TOMCAT_HOME>\bin\startup.bat`
   - Linux/Mac: `<TOMCAT_HOME>/bin/startup.sh`

### 5. Access Application (10 seconds)
Open browser and go to:
```
http://localhost:8080/BookHub/books/
```

## 🎉 That's it! You should see the BookHub home page.

## Quick Test
1. Click "Add New Book"
2. Enter:
   - Title: "The Great Gatsby"
   - Author: "F. Scott Fitzgerald"
   - Price: 12.99
3. Click "Save Book"
4. You should see your book in the list!

## Troubleshooting

**Problem: Can't connect to database**
```bash
# Verify your Aiven service is running in Aiven Console
# Check that your credentials in database.properties are correct
# Ensure the URL includes ?sslmode=require
# Verify the database name matches your Aiven database
```

**Problem: SSL connection error**
- Aiven requires SSL connections
- Make sure your connection URL has `?sslmode=require`
- Update PostgreSQL JDBC driver if needed

**Problem: Port 8080 in use**
- Stop other applications on port 8080
- Or change Tomcat port in `<TOMCAT_HOME>/conf/server.xml`

**Problem: 404 Error**
- Make sure URL is exactly: `http://localhost:8080/BookHub/books/`
- Check Tomcat logs in `<TOMCAT_HOME>/logs/catalina.out`

## Need More Help?
See the detailed [README.md](README.md) for:
- VS Code setup instructions
- Multiple deployment methods
- Detailed troubleshooting
- Project architecture

## Default Configuration
- **Database**: Aiven PostgreSQL (Cloud-hosted)
- **Connection**: SSL required (sslmode=require)
- **Default Database**: defaultdb (or your chosen database name)
- **Tomcat Port**: 8080
- **Context Path**: /BookHub

Happy coding! 📚✨
