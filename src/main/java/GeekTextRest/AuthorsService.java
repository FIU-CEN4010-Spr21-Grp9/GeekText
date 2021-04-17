package GeekTextRest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
*  Title: AuthorsService
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the authorsService rest for the GeekText application group
* project for group 9
* 
*/
@Component
public class AuthorsService
{
	@Autowired
    private EntityManager entityManager;
    
    @SuppressWarnings("unchecked")
    public List<Author> authorsByAuthorNameLikeViaProc(String pattern) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getAuthorsByAuthorNameLike");
       storedProcedureQuery.setParameter("pattern", pattern);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
    public List<Author> authorsByBookIdViaProc(Integer bookID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getAuthorsByBookID");
       storedProcedureQuery.setParameter("bookID", bookID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
}