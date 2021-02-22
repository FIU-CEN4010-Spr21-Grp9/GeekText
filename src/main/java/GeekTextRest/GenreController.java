package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/genre")
/**
*  Title: GenreController
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the genre REST object for the GeekText application group
* project for group 9
* 
*/
public class GenreController
{
	@Autowired
    GenreService genreService;

	// http://localhost:8080/genre/query/viaproc/genrenames
    @RequestMapping(value="/query/viaproc/genrenames", method=RequestMethod.GET)
    public List<Genre> getGenreNameList(Integer genreID) {
        System.out.println("kxh1");
        List<Genre> genres = genreService.getGenreNameListViaProc();
        if(genres == null) {
            return new ArrayList<Genre>();
        } else {
            return genres;
        }
    }
}