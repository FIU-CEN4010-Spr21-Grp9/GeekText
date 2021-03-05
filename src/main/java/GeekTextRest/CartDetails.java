package shoppingcart;
/**
*  Title: BookInfo
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the CartDetails object for the GeekText application group
* project for group 9
* 
*/
import java.util.List;
import java.util.ArrayList;
public class CartDetails {
	private final List<CartInfo> Cart = new ArrayList<CartInfo>();
	public CartDetails() {
	}
	public List<CartInfo>getCart(){
		return this.Cart;
	}
	private CartInfo getISBN(String ISBN) {
		for (CartInfo Cart : this.Cart) {
			if (Cart.getBookInfo().getISBN().equals(ISBN)) {
				return Cart;
			}
		}
	return null;
}
	public void removeBook(BookInfo bookinfo) {
		CartInfo Cart = this.getISBN(bookinfo.getISBN());
		if (Cart != null) {
			this.Cart.remove(Cart);
			}
		}
	public void addBook(BookInfo bookinfo, int quantity) {
		CartInfo Cart = this.getISBN(bookinfo.getISBN());
		if (Cart == null) {
			Cart = new CartInfo();
			Cart.setQuantity(0);
			Cart.setBookInfo(bookinfo);
			this.Cart.add(Cart);
		}
		int newQuantity = Cart.getQuantity() + quantity;
		if (newQuantity <= 0) {
			this.Cart.remove(Cart);
		} else {
			Cart.setQuantity(newQuantity);
		}
	} 
	public void updateBook(String ISBN, int quantity) {
		CartInfo Cart = this.getISBN(ISBN);
		if (Cart != null) {
			if (quantity <= 0) {
				this.Cart.remove(Cart);
			} else {
				Cart.setQuantity(quantity);
			}
		}
	}
	public void updateQuantity(CartDetails aCart) { //cartlineinfo
		if (aCart != null) {
			List<CartInfo> cart = aCart.getCart();
			for (CartInfo Cart : cart) {
				this.updateBook(Cart.getBookInfo().getISBN(), Cart.getQuantity());
			}
		}
	}
	
	boolean CartisEmpty() {
		return this.Cart.isEmpty();
	}
	int getBookTotal() {
		int quantity = 0;
		for (CartInfo Cart : this.Cart) {
			quantity += Cart.getQuantity();
		}
		return quantity;
	}
	double getSumTotal() {
		double total = 0;
		for (CartInfo Cart : this.Cart) {
			total += Cart.getAmount();
		}
		return total;
	}

}



