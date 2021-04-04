package GeekTextRest;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/wishlist")

public class WishlistController {

	@Autowired
    WishlistService wishlistService;
	
	//getting all wishlists items for a user
	@RequestMapping(value="/items", method=RequestMethod.POST)
	public List<Wishlist> getAllWishlistItems(Integer userID) {
        System.out.println("Getting all wishlist items for: " + userID);
        List<Wishlist> items = wishlistService.getAllWishlistItems(userID);
//       for(int i = 0; i < items.size(); i++)
//       {
//    	   System.out.println(items.get(i));
//       }
        return items;

    }
	//get number of wishlists
//	@RequestMapping(value="/query/viaproc/wishlist", method=RequestMethod.PUT)
//	public List<Wishlist> getNumberOfWishlists(Integer userID) {
//        System.out.println("kxh1");
//        List<Wishlist> items = wishlistService.getNumberOfWishlists(userID);
//        if(items == null) {
//            return new ArrayList<Wishlist>();
//        } else {
//            return items;
//        }
//    }
	//creates a new wishlist
	@RequestMapping(value="/newlist", method=RequestMethod.POST)
	public List<Wishlist> createWishlist(Integer userID, String name) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.createWishlist(userID, name);
        if(items == null) {
            return new ArrayList<Wishlist>();
        } else {
            return items;
        }
    }
	//inserts an item into a wishlist
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public List<Wishlist> insertItemIntoWishlist(Integer userID, Integer bookID, Integer wishlistID) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.insertItemIntoWishlist(userID, bookID, wishlistID);
        if(items == null) {
            return new ArrayList<Wishlist>();
        } else {
            return items;
        }
    }
	//moves an Item from one wishlist to another using the wishlistItemID
	@RequestMapping(value="/move", method=RequestMethod.POST)
	public List<Wishlist> moveItemtToNewWishlist(Integer userID, Integer wishlistItemID, Integer wishlistID ) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.moveItemtToNewWishlist(userID, wishlistItemID, wishlistID);
        if(items == null) {
            return new ArrayList<Wishlist>();
        } else {
            return items;
        }
    }
	//moves an Item from one wishlist to another using the bookID
	@RequestMapping(value="/move2", method=RequestMethod.POST)
	public List<Wishlist> moveItemToNew2Wishlist(Integer userID, Integer bookID, Integer wishlistID) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.moveItemToNew2Wishlist(userID, bookID, wishlistID);
        if(items == null) {
            return new ArrayList<Wishlist>();
        } else {
            return items;
        }
    }
	//Deletes a given book from a wishlist
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	public void deleteItemFromWishlist(Integer userID, Integer wishlistItemID) {
        System.out.println("Deleting book with id: " + wishlistItemID);
        wishlistService.deleteItemFromWishlist(userID, wishlistItemID);
        System.out.println("Deleted Item");
    }
//	Deletes an entire wishlist
	@RequestMapping(value="/deleteList", method=RequestMethod.DELETE)
	public List<Wishlist> deleteWishlist(Integer userID, Integer wishlistID) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.deleteWishlist(userID, wishlistID);
        if(items == null) {
            return new ArrayList<Wishlist>();
        } else {
            return items;
        }
    }
	@RequestMapping(value="/getID", method=RequestMethod.POST)
	public List<Wishlist> getWishlistID(Integer userID, String name) {
        System.out.println("kxh1");
        List<Wishlist> items = wishlistService.getID(userID, name);
//        if(items == null) {
//            return new ArrayList<Wishlist>();
//        } else {
            return items;
//        }
    }
}
