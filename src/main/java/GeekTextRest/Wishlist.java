package GeekTextRest;

import javax.persistence.*;

/*
 * Create at least one wishlist
 * pass @StoredProcedureParameter
 * how do I limit how many wishlists?
 * how do I make a table
 * how do I insert into a table
 * how do I read from a table
 * how do I make a stored procedure
 * how do I lock a wishlist to a user
 * 
 * set up a usp for gettig the wishlist and for inserting items into the wishlist
 * maybe havet to make a usp for moving items or for limiting the amount of users
 * have to call the user to get user id for the wishlist
 * 
 * 
 */
//@Entity
@NamedStoredProcedureQueries
({
	@NamedStoredProcedureQuery(//returns all wishlisted items
			name = "getWishlists", 
			procedureName = "wl_get_wishlist_by_user", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)

			}
			), 
	@NamedStoredProcedureQuery(//gets number of current wishlists
			name = "getNumberOfWishlists", 
			procedureName = "wl_get_number_of_wishlists", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)


			}
			),
	@NamedStoredProcedureQuery(
			name = "createNewWishlist", 
			procedureName = "wl_create_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistName", 
							type = String.class)

			}
			),
	@NamedStoredProcedureQuery(
			name = "insertItemToWishlist", 
			procedureName = "wl_insert_item_to_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "bookID", 
							type = Integer.class),
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistID", 
							type = Integer.class)

			}
			),
	@NamedStoredProcedureQuery(//uses wishlist Item ID
			name = "moveItemToNewWishlist", 
			procedureName = "wl_move_item_to_new_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					,@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistItemID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistID", 
							type = Integer.class)

			}
			),
	@NamedStoredProcedureQuery(//uses book ID
			name = "moveItemToNew2Wishlist", 
			procedureName = "wl_move_item_to_new2_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					,@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "bookID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistID", 
							type = Integer.class)

			}
			), 

	@NamedStoredProcedureQuery(
			name = "deleteItemFromWishlist", 
			procedureName = "wl_delete_item_from_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistItemID", 
							type = Integer.class)

			}
			),
	@NamedStoredProcedureQuery(
			name = "getWishlistID", 
			procedureName = "wl_get_wishlistID", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "name", 
							type = String.class)

			}
			),
	@NamedStoredProcedureQuery(
			name = "deleteWishlist", 
			procedureName = "wl_delete_wishlist", 
			resultClasses = { Wishlist.class },
			parameters = {
					@StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "userID", 
							type = Integer.class)
					, @StoredProcedureParameter(
							mode = ParameterMode.IN, 
							name = "wishlistID", 
							type = Integer.class)

			}
			)
})

@Entity

public class Wishlist
{
	@Id
	private Integer wishlist_itemID;
	
	
	private Integer wishlistID;

	private Integer userID;

	private String name;

	private String title;

	private int bookID;
	
	@Override
	public String toString()
	{
		return String.format("Wishlist_ItemID: %d, UserID: %d, Name: %s, Title: %s, BookID: %d.",wishlist_itemID, userID, name, title, bookID);
	}
	
	public Wishlist(int wishlist_itemID, int wishlistID, int userID,  String wishlistName, String title, int bookID)
	{
		this.wishlist_itemID = wishlist_itemID;
		this.wishlistID = wishlistID;
		this.userID = userID;
		this.name = wishlistName;
		this.title = title;
		this.bookID = bookID;
		
	}
	public Wishlist()
	{
	
	}
	public int getWishlistID()
	{
		return wishlistID;
	}
	
	public int getUserID()
	{
		return userID;
	}
	
	public String getWishlistName()
	{
		return name;
	}
	
	public int getBookID()
	{
		return bookID;
	}
	
	public String getBookName()
	{
		return title;
	}
	public void setWishListID(int wishlistID)
	{
		this.wishlistID = wishlistID;
	}
	
	public void setUserID(int userID)
	{
		this.userID = userID;
	}

	public void setWishListName(String wishlistName)
	{
		this.name = wishlistName;
	}
	
	public void setBookID(int bookID)
	{
		this.bookID = bookID;
	}

	public void setBookName(String bookName)
	{
		this.title = bookName;
	}
	public int getWishlistItemID()
	{
		return wishlist_itemID;
	}
	public void setWishlistItemID(int wishlist_itemID)
	{
		this.wishlist_itemID = wishlist_itemID;
	}
	
}
