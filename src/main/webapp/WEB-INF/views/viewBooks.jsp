<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Books - BookHub</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            padding: 40px 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            border: 1px solid black;
            padding: 40px;
        }
        h1 {
            margin-bottom: 30px;
            text-align: center;
            font-size: 2em;
        }
        .actions {
            display: flex;
            gap: 10px;
            margin-bottom: 30px;
            justify-content: center;
        }
        .btn {
            padding: 10px 20px;
            border: 1px solid black;
            background: white;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .books-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .books-table th,
        .books-table td {
            padding: 10px;
            text-align: left;
            border: 1px solid black;
        }
        .books-table th {
            font-weight: bold;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
        }
        .empty-message p {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Books</h1>
        
        <div class="actions">
            <a href="${pageContext.request.contextPath}/books/addBook" class="btn">
                Add New Book
            </a>
            <a href="${pageContext.request.contextPath}/books/" class="btn">
                Home
            </a>
        </div>
        
        <c:choose>
            <c:when test="${not empty books}">
                <table class="books-table">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td>#${book.bookId}</td>
                                <td>${book.title}</td>
                                <td>${book.author}</td>
                                <td>$${book.price}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="empty-message">
                    <p>No books found in the library.</p>
                    <a href="${pageContext.request.contextPath}/books/addBook" class="btn">
                        Add Your First Book
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
