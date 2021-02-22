package GeekTextRest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
*  Title: GenreService
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the genreService rest for the GeekText application group
* project for group 9
* 
*/
@Component
public class GenreService
{
	@Autowired
    private EntityManager entityManager;
    
    @SuppressWarnings("unchecked")
    public List<Genre> getGenreNameListViaProc() {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getGenreNameList");
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
}