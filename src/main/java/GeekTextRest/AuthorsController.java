package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/authors")
/**
*  Title: AuthorssController
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the author REST object for the GeekText application group
* project for group 9
* 
*/
public class AuthorsController
{
	@Autowired
    AuthorsService authorsService;
    
	// http://localhost:8080/authors/query/viaproc/likeauthorname?pattern=king
    @RequestMapping(value="/query/viaproc/likeauthorname", method=RequestMethod.GET)
    public List<Author> getAuthorsByAuthorNameLike(String pattern) {
        System.out.println("kxh1");
        List<Author> authors = authorsService.authorsByAuthorNameLikeViaProc(pattern);
        if(authors == null) {
            return new ArrayList<Author>();
        } else {
            return authors;
        }
    }
}
