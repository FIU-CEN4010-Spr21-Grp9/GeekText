package GeekTextRest;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

@NamedStoredProcedureQueries
({@NamedStoredProcedureQuery(
		name = "getAllWishlists", 
		procedureName = "wl_get_wishlist_names", 
		resultClasses = { WishlistName.class },
		parameters = {
				@StoredProcedureParameter(
						mode = ParameterMode.IN, 
						name = "userID", 
						type = Integer.class)

		}
		)
})

@Entity
public class WishlistName
{
	@Id
	private Integer wishlistID;

//	private Integer userID;

	private String name;
	
	public WishlistName(int wishlistID, String wishlistName)
	{
		
		this.wishlistID = wishlistID;
//		this.userID = userID;
		this.name = wishlistName;
		
	}
	public WishlistName()
	{
		
	}

	public int getWishlistID()
	{
		return wishlistID;
	}
	
//	public int getUserID()
//	{
//		return userID;
//	}
//	
	public String getWishlistName()
	{
		return name;
	}
	
	public void setWishListID(int wishlistID)
	{
		this.wishlistID = wishlistID;
	}
	
//	public void setUserID(int userID)
//	{
//		this.userID = userID;
//	}

	public void setWishListName(String wishlistName)
	{
		this.name = wishlistName;
	}
	
	
}