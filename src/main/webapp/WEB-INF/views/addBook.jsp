<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - BookHub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            border: 1px solid black;
            padding: 40px;
            max-width: 500px;
            width: 100%;
        }
        h1 {
            margin-bottom: 30px;
            text-align: center;
            font-size: 2em;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid black;
        }
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            flex: 1;
            padding: 10px;
            border: 1px solid black;
            background: white;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Book</h1>
        <form:form action="${pageContext.request.contextPath}/books/saveBook" 
                   modelAttribute="book" 
                   method="post">
            
            <div class="form-group">
                <label for="title">Book Title:</label>
                <form:input path="title" id="title" required="required" 
                           placeholder="Enter book title"/>
            </div>
            
            <div class="form-group">
                <label for="author">Author:</label>
                <form:input path="author" id="author" required="required" 
                           placeholder="Enter author name"/>
            </div>
            
            <div class="form-group">
                <label for="price">Price ($):</label>
                <form:input path="price" id="price" type="number" 
                           step="0.01" min="0" required="required" 
                           placeholder="Enter price"/>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn">Save Book</button>
                <a href="${pageContext.request.contextPath}/books/viewBooks" 
                   class="btn">Cancel</a>
            </div>
        </form:form>
        
        <a href="${pageContext.request.contextPath}/books/" class="back-link">
            Back to Home
        </a>
    </div>
</body>
</html>
