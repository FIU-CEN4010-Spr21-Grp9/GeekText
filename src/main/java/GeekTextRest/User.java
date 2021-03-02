package GeekTextRest;

import javax.persistence.*;

/**
*  Title: Book
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh, Azul Barros
* 
* I affirm that this program is entirely group 9s and none of it is the work
* of any other. 
* 
* This class inserts a user for the GeekText application group
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
		    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "firstname", 
                            type = String.class)
		    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "middleInit", 
                            type = Character.class)
	            , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "lastname", 
                            type = String.class)        
		    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "email", 
                            type = String.class)
		    , @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "phone", 
                            type = Character.class)
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
