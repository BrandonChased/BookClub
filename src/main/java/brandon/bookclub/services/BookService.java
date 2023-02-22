package brandon.bookclub.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brandon.bookclub.models.Book;
import brandon.bookclub.models.User;
import brandon.bookclub.repositories.BookRepository;

@Service
public class BookService {
    
    @Autowired BookRepository bookRepository;
    @Autowired UserService userService;

    public void addBook(Book book) {
        bookRepository.save(book);
    }

    public List<Book> getall() {
        return bookRepository.findAll();
    }

    public Book findBook(Long Id) {
        Optional<Book> book = bookRepository.findById(Id);
        return book.orElse(null);
    }

    public void editBook(@Valid Book book) {
        bookRepository.save(book);
    }

    public void deleteBook(Book book) {
        bookRepository.delete(book);
    }

    // add user to the books "usersWhoLIked"
    public void addLikeToBook(Book book, User user) {
        book.getBookLikes().add(user);
        bookRepository.save(book);
    }

        // add user to the books "usersWhoLIked"
    public void deletelikeFromBook(Book book, User user) {
        book.getBookLikes().remove(user);
        bookRepository.save(book);
    }
}
