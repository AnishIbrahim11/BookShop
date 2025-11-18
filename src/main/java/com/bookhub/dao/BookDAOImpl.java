/*Md Anish */
package com.bookhub.dao;

import com.bookhub.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * DAO implementation for Book entity using Hibernate
 */
@Repository
@Transactional
public class BookDAOImpl implements BookDAO {
    
    @Autowired
    private SessionFactory sessionFactory;
    
    /**
     * Get current Hibernate session
     */
    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public void saveBook(Book book) {
        getCurrentSession().save(book);
    }
    
    @Override
    public Book getBookById(Long bookId) {
        return getCurrentSession().get(Book.class, bookId);
    }
    
    @Override
    public List<Book> getAllBooks() {
        Query<Book> query = getCurrentSession().createQuery("from Book", Book.class);
        return query.getResultList();
    }
    
    @Override
    public void updateBook(Book book) {
        getCurrentSession().update(book);
    }
    
    @Override
    public void deleteBook(Long bookId) {
        Book book = getCurrentSession().get(Book.class, bookId);
        if (book != null) {
            getCurrentSession().delete(book);
        }
    }
}
