package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
/**
*  Title: BooksController
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the book object for the GeekText application group
* project for group 9
* 
*/
public class BooksController
{
	@Autowired
    BooksService booksService;
    
	// http://localhost:8080/books/query/viaproc/bygenre?genreID=1
    @RequestMapping(value="/query/viaproc/bygenre", method=RequestMethod.GET)
    public List<Book> getBooksByGenreID(Integer genreID) {
        System.out.println("kxh1");
        List<Book> books = booksService.browseByGenreViaProc(genreID);
        if(books == null) {
            return new ArrayList<Book>();
        } else {
            return books;
        }
    }
    
    // http://localhost:8080/books/query/viaproc/byrating?rating=3
    @RequestMapping(value="/query/viaproc/byrating", method=RequestMethod.GET)
    public List<Book> getBooksByRating(Integer rating) {
        System.out.println("kxh1");
        List<Book> books = booksService.browseByRatingViaProc(rating);
        if(books == null) {
            return new ArrayList<Book>();
        } else {
            return books;
        }
    }
    
    // http://localhost:8080/books/query/viaproc/topsellers
    @RequestMapping(value="/query/viaproc/topsellers", method=RequestMethod.GET)
    public List<Book> getBooksByTopSellers() {
        System.out.println("kxh1");
        List<Book> books = booksService.browseByTopSellersViaProc();
        if(books == null) {
            return new ArrayList<Book>();
        } else {
            return books;
        }
    }
	
}
