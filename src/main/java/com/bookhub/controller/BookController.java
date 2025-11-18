/*Md Anish */
package com.bookhub.controller;

import com.bookhub.dao.BookDAO;
import com.bookhub.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Controller for handling Book-related requests
 */
@Controller
@RequestMapping("/books")
public class BookController {
    
    @Autowired
    private BookDAO bookDAO;
    
    /**
     * Show the home page
     */
    @GetMapping("/")
    public String home() {
        return "home";
    }
    
    /**
     * Show the add book form
     */
    @GetMapping("/addBook")
    public String showAddBookForm(Model model) {
        Book book = new Book();
        model.addAttribute("book", book);
        return "addBook";
    }
    
    /**
     * Save a new book
     */
    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("book") Book book) {
        bookDAO.saveBook(book);
        return "redirect:/books/viewBooks";
    }
    
    /**
     * View all books
     */
    @GetMapping("/viewBooks")
    public String viewAllBooks(Model model) {
        List<Book> books = bookDAO.getAllBooks();
        model.addAttribute("books", books);
        return "viewBooks";
    }
}
