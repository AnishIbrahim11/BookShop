/*Md Anish */
package com.bookhub.dao;

import com.bookhub.entity.Book;
import java.util.List;

/**
 * DAO interface for Book entity operations
 */
public interface BookDAO {
    
    /**
     * Save a new book
     * @param book Book to save
     */
    void saveBook(Book book);
    
    /**
     * Get a book by ID
     * @param bookId Book ID
     * @return Book object
     */
    Book getBookById(Long bookId);
    
    /**
     * Get all books
     * @return List of all books
     */
    List<Book> getAllBooks();
    
    /**
     * Update a book
     * @param book Book to update
     */
    void updateBook(Book book);
    
    /**
     * Delete a book by ID
     * @param bookId Book ID to delete
     */
    void deleteBook(Long bookId);
}
