package GeekTextRest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
*  Title: BooksService
*  Semester: CEN4010 - Spring 2021
*  @author Shawn Welsh
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the booksService rest for the GeekText application group
* project for group 9
* 
*/
@Component
public class BooksService
{
	@Autowired
    private EntityManager entityManager;
    
    @SuppressWarnings("unchecked")
    public List<Book> browseByGenreViaProc(Integer genreID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getBooksByGenreID");
       storedProcedureQuery.setParameter("genreID", genreID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
    public List<Book> browseByRatingViaProc(Integer rating) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getBooksByRating");
        storedProcedureQuery.setParameter("rating", rating);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    
    @SuppressWarnings("unchecked")
    public List<Book> browseByTopSellersViaProc() {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getBooksByTopSellers");
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    
    @SuppressWarnings("unchecked")
    public List<Book> browseByAuthorViaProc(Integer authorID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getBooksByAuthorID");
        storedProcedureQuery.setParameter("authorID", authorID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    
    @SuppressWarnings("unchecked")
    public List<Book> bookDetailViaProc(Integer bookID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getBookByBookID");
        storedProcedureQuery.setParameter("bookID", bookID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
}
