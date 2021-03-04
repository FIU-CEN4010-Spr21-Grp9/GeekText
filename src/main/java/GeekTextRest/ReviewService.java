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
    public List<Review> reviewByBookIDLikeViaProc(Integer bookID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getReviewByBookIDLike");
       storedProcedureQuery.setParameter("bookID", bookID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
    public List<Review> reviewByUserIDLikeViaProc(Integer userID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getReviewByUserIDLike");
       storedProcedureQuery.setParameter("userID", userID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
}
