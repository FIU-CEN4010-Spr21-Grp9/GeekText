package GeekTextRest;

import javax.persistence.*;

@Entity
@NamedStoredProcedureQueries
({
	@NamedStoredProcedureQuery(
            name = "getReviewByReviewID", 
            procedureName = "usp_get_review_by_reviewID", 
            resultClasses = { Review.class },
            parameters = {
                    @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "reviewID", 
                            type = Integer.class)
            }
        ),
	@NamedStoredProcedureQuery(
            name = "getReviewByBookID", 
            procedureName = "usp_get_review_by_bookID", 
            resultClasses = { Review.class },
            parameters = {
                    @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "bookID", 
                            type = Integer.class)
            }
        )
})

public class Review {
	@Id
	private Integer reviewID;
	
	// internal private variables //
	private Integer bookID;
	private Integer userID;
	private Float isAnonymous;
	private Float rating;
	private String title;
	private String description;
	
	// constructors //
	public Review()
	{
		
	}
	
	public Review(int reviewID, int bookID, int userID, float isAnonymous, float rating, String title, String description)
	{
		this.reviewID = reviewID;
		this.bookID = bookID;
		this.userID = userID;
		this.isAnonymous = isAnonymous;
		this.rating = rating;
		this.title = title;
		this.description = description;
	}
	
	// get/set methods //
	// review ID
	public Integer getReviewID()
	{
		return reviewID;
	}
	
	public void setReviewID(int reviewID)
	{
		this.reviewID = reviewID;
	}
	
	// book ID
	public Integer getBookID()
	{
		return bookID;
	}
	
	public void setBookID(int bookID)
	{
		this.bookID = bookID;
	}
	
	// user ID
	public Integer getUserID()
	{
		return userID;
	}
	
	public void setUserID(int userID)
	{
		this.userID = userID;
	}
	
	// isAnonymous
	public Float getIsAnonymous()
	{
		return isAnonymous;
	}
	
	public void setIsAnonymous(float isAnonymous)
	{
		this.isAnonymous = isAnonymous;
	}
	
	// rating
	public Float getRating()
	{
		return rating;
	}
	
	public void setRaiting(float rating)
	{
		this.rating = rating;
	}
	
	// title
	public String getTitle()
	{
		return title;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
	// description
	public String getDescription()
	{
		return description;
	}
		
	public void setDescription(String description)
	{
		this.description = description;
	}
}
