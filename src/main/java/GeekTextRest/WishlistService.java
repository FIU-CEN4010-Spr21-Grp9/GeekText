package GeekTextRest;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class WishlistService 
{
	@Autowired
    private EntityManager entityManager;
    
    @SuppressWarnings("unchecked")
    public List<Wishlist> getAllWishlistItems(Integer userID) {
       StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getWishlists");
       storedProcedureQuery.setParameter("userID", userID);
       storedProcedureQuery.execute();
       return storedProcedureQuery.getResultList();
    }
    
    @SuppressWarnings("unchecked")
    public List<Wishlist> getNumberOfWishlists(Integer userID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getNumberOfWishlists");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> createWishlist(Integer userID, String name) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("createNewWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("wishlistName", name);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> insertItemIntoWishlist(Integer userID, Integer bookID, Integer wishlistID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("insertItemToWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("bookID", bookID);
        storedProcedureQuery.setParameter("wishlistID", wishlistID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> moveItemtToNewWishlist(Integer userID, Integer wishlistItemID, Integer wishlistID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("moveItemToNewWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("wishlistItemID", wishlistItemID);
        storedProcedureQuery.setParameter("wishlistID", wishlistID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> moveItemToNew2Wishlist(Integer userID, Integer bookID, Integer wishlistID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("moveItemToNew2Wishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("bookID", bookID);
        storedProcedureQuery.setParameter("wishlistID", wishlistID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> deleteItemFromWishlist(Integer userID, Integer wishlistItemID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("deleteItemFromWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("wishlistItemID", wishlistItemID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> deleteWishlist(Integer userID, Integer wishlistID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("deleteWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("wishlistID", wishlistID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> getWishlist(Integer userID, Integer wishlistID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getWishlist");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("wishlistID", wishlistID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<WishlistName> getAllWishlists(Integer userID) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getAllWishlists");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    @SuppressWarnings("unchecked")
    public List<Wishlist> getID(Integer userID, String name) {
        StoredProcedureQuery storedProcedureQuery = this.entityManager.createNamedStoredProcedureQuery("getWishlistID");
        storedProcedureQuery.setParameter("userID", userID);
        storedProcedureQuery.setParameter("name", name);
        storedProcedureQuery.execute();
        return storedProcedureQuery.getResultList();
     }
    
}
