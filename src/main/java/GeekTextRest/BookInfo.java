package shoppingcart;
/**
*  Title: BookInfo
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the BookInfo object for the GeekText application group
* project for group 9
* 
*/
@Entity
@NamedStoredProcedureQueries
({
    @NamedStoredProcedureQuery(
            name = "getBookInfobyISBN", 
            procedureName = "usp_get_bookinfo_by_ISBN", 
            resultClasses = { BookInfo.class },
            parameters = {
                    @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "ISBN", 
                            type = String.class)
})
public class BookInfo {
    private String ISBN;
    private String bookName;
    private double price;
 
    public BookInfo() {
    }
 
    public BookInfo(BookInfo bookinfo) {
        this.ISBN = bookinfo.getISBN();
        this.bookName = bookinfo.getbookName();
        this.price = bookinfo.getPrice();
    }
 
    //Use JPA query
    public BookInfo(String ISBN, String bookName, double price) {
        this.ISBN = ISBN;
        this.bookName = bookName;
        this.price = price;
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
    public void setPrice(double price) {
        this.price = price;
    }
    public double getPrice() {
        return price;
    }
 
}
