package GeekTextRest;
/**
*  Title: BookInfo
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the CartInfo object for the GeekText application group
* project for group 9
* 
*/
public class CartInfo { 
	
	public BookInfo bookinfo;
	private int quantity;
	
	public CartInfo()
	{
		this.quantity = 0;
	}
	
	void setBookInfo(BookInfo bookinfo) {
		this.bookinfo = bookinfo;
	}
	public BookInfo getBookInfo() {
		return bookinfo;
	}
	void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getQuantity() {
		return quantity;
	}
	public double getTotal() {
		return this.bookinfo.getPrice() * this.quantity;
	}
	
}