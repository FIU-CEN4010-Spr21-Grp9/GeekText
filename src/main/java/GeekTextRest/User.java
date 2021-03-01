package GeekTextRest;

import javax.persistence.*;

/**
*  Title: Book
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
@Entity
@NamedStoredProcedureQueries
({
    @NamedStoredProcedureQuery(
            name = "putNewUserInsert", 
            procedureName = "usp_insert_user", 
            resultClasses = { User.class },
            parameters = {
                    @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "username", 
                            type = String.class)
                    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "password", 
                            type = String.class)
                    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "nickname", 
                            type = String.class)
                    // ETC...
            }
        )
})

public class User
{
	@Id
	private Integer userID;
	
	//// INTERNAL PRIVATE VALUES ////
	
	////CONSTRUCTORS ////
	// default //
	public User()
	{
		
	};
	
	// the real one //
	public User(int userID)
	{
		this.userID = userID;
	};
}