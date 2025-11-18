<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookHub - Home</title>
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
            text-align: center;
            border: 1px solid black;
            padding: 40px;
            max-width: 600px;
            width: 100%;
        }
        h1 {
            margin-bottom: 20px;
            font-size: 2em;
        }
        .subtitle {
            margin-bottom: 30px;
            font-size: 1em;
        }
        .button-group {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border: 1px solid black;
            background: white;
            color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>BookHub</h1>
        <p class="subtitle">Manage Your Book Collection</p>
        <div class="button-group">
            <a href="${pageContext.request.contextPath}/books/addBook" class="btn">
                Add New Book
            </a>
            <a href="${pageContext.request.contextPath}/books/viewBooks" class="btn">
                View All Books
            </a>
        </div>
    </div>
</body>
</html>
