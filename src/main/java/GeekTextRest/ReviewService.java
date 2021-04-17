package GeekTextRest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component

public class ReviewService {
	
	@Autowired
    private EntityManager entityManager;
    
    @SuppressWarnings("unchecked")
    public List<Review> reviewByReviewIDViaProc(Integer reviewID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getReviewByReviewID");
       storedProcedureQuery.setParameter("reviewID", reviewID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
    public List<Review> reviewByBookIDViaProc(Integer bookID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getReviewByBookID");
       storedProcedureQuery.setParameter("bookID", bookID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
}

