package GeekTextRest.restservice;

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
    //ellipsis//Check through stored procedures
    @RequestMapping(value="/query/viaproc/likegenre", method=RequestMethod.GET)
    public List<Book> getBooksByGenreID(Integer genreID) {
        System.out.println("kxh1");
        Integer genreID = 1; // need to write bit to pass in an ID
        List<Book> books = booksService.findAllViaProc(genreID);
        if(books == null) {
            return new ArrayList<Book>();
        } else {
            return books;
        }
    }
	
}
