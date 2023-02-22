package brandon.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import brandon.bookclub.models.Book;
import brandon.bookclub.models.User;
import brandon.bookclub.services.BookService;
import brandon.bookclub.services.UserService;
import net.bytebuddy.matcher.ModifierMatcher.Mode;

@Controller
public class BookController {
    
    @Autowired BookService bookService;
    @Autowired UserService userService;

        // Creates a new book in the database
    @PostMapping("/books")
    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result){
        if(result.hasErrors()) {
            return "books/new.jsp";
        }else {
            bookService.addBook(book);
            return "redirect:/books";
        }
    }

    // All Books Page
    @GetMapping("/books")
    public String allBooks(Model model) {
        List<Book> books = bookService.getall();
        System.out.println("books" + books);
        model.addAttribute("books", books);
        return "books/index.jsp";
    }
    // One book
    @GetMapping("/books/{id}")
    public String oneBook(@PathVariable("id") Long id, Model model, HttpSession session) {
        
        Book book = bookService.findBook(id);
        model.addAttribute("book", book);
        model.addAttribute("user", userService.findUserById((Long) session.getAttribute("userId")));

        return "books/view.jsp";
    }

    // New Book Page
    @GetMapping("/books/new")
    public String newBook(@ModelAttribute("book")Book book, BindingResult result) {
        return "books/new.jsp";
    }
    
    // Edit Book Page
    @GetMapping("/books/{id}/edit")
    public String editBookPage(Model model, @PathVariable("id")Long id){
        Book book = bookService.findBook(id);
        model.addAttribute("book", book);
        return "books/edit.jsp";
    }

    //Edits a Book in the DataBase
    @PutMapping("/books/{id}")
    public String editBook(@PathVariable("id")Long id,@Valid @ModelAttribute("book") Book book, BindingResult result) {
        if(result.hasErrors()) {
            return "books/edit.jsp";
        }
        bookService.editBook(book);
        return "redirect:/books";
    }

    // Deletes a book in the Database
    @DeleteMapping("/books/{id}")
    public String delBook(@PathVariable("id")Long id){
        Book book = bookService.findBook(id);
        bookService.deleteBook(book);
        return "redirect:/books";
    }

    // Add a like to books
    @PostMapping("/books/{id}/like")
    public String addLike(
        @PathVariable("id") Long id,
        HttpSession session
        ){
        User user = userService.findUserById((Long)session.getAttribute("userId"));
        Book book = bookService.findBook(id);
        bookService.addLikeToBook(book, user);
        return "redirect:/books/{id}";
    }

    // Delete a like to books
    @DeleteMapping("/books/{id}/unlike")
    public String unLike(
        @PathVariable("id") Long id,
        HttpSession session
        ){
        User user = userService.findUserById((Long)session.getAttribute("userId"));
        Book book = bookService.findBook(id);
        bookService.deletelikeFromBook(book, user);
        return "redirect:/books/{id}";
    }

}
