package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/users")
/**
*  Title: UsersController
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the user object for the GeekText application group
* project for group 9
* 
*/
public class UsersController
{
	@Autowired
    UsersService usersService;
    
	// http://localhost:8080/books/query/viaproc/createnewuser?username=newUser2&password=hello12&nickname=newb...
    @RequestMapping(value="/query/viaproc/createnewuser", method=RequestMethod.PUT)
    public void putNewUserInsert(String userName, String password, String nickname, String firstName, Character middle) {
        System.out.println("kxh1");
        usersService.createNewUserViaProc(userName, password);
        //List<User> users = usersService.createNewUserViaProc(userName, password);
        /*
        if(books == null) {
            return new ArrayList<User>();
        } else {
            return users;
        }
        */
    }
    
}