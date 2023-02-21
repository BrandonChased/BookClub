package brandon.bookclub.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brandon.bookclub.models.Book;
import brandon.bookclub.repositories.BookRepository;

@Service
public class BookService {
    
    @Autowired BookRepository bookRepository;

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
}
