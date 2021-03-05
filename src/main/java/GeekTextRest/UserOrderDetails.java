package GeekTextRest;
/**
*  Title: BookInfo
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the UserOrderDetails object for the GeekText application group
* project for group 9
* 
*/
public class UserOrderDetails {
	    private String userID;
	 
	    private String ISBN;
	    private String bookName;
	    private double amount;
	    private int quantity;
	    private double price;
	 
	    public UserOrderDetails() {
	 
	    }
	    public UserOrderDetails(String userID, String ISBN, 
	            String bookName, int quantity, double amount, double price) {
	        this.userID = userID;
	        this.bookName = bookName;
	        this.ISBN = ISBN;
	        this.quantity = quantity;
	        this.amount = amount;
	        this.price = price;
	    }
	    public void setuserID(String userID) {
	        this.userID = userID;
	    }
	 
	    public String getuserID() {
	        return userID;
	    }
	    public void setISBN(String ISBN) {
	        this.ISBN = ISBN;
	    }
	    public String getISBN() {
	        return ISBN;
	    } 
	    public void setbookName(String bookName) {
	        this.bookName = bookName;
	    }
	    public String getbookName() {
	        return bookName;
	    }
	    public void setQuantity(int quantity) {
	        this.quantity = quantity;
	    }
	    public int getQuantity() {
	        return quantity;
	    }
	    public void setAmount(double amount) {
	        this.amount = amount;
	    }
	    public double getAmount() {
	        return amount;
	    }
	    public void setPrice(double price) {
	        this.price = price;
	    }
	    public double getPrice() {
	        return price;
	    }
	 
	}

