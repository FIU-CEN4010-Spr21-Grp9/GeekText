package GeekTextRest;
import java.util.List;
import javax.persistence.*;
/**
*  Title: UserOrder
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the UserOrder object for the GeekText application group
* project for group 9
* 
*/
@Entity
@NamedStoredProcedureQueries
({
    @NamedStoredProcedureQuery(
            name = "getUserOrderbyUserID", 
            procedureName = "usp_get_userorder_by_userID", 
            resultClasses = { UserOrder.class },
            parameters = {
                    @StoredProcedureParameter(
                            mode = ParameterMode.IN, 
                            name = "userID", 
                            type = String.class)
    })
})

public class UserOrder {
	 
    private String userID;
    private double amount;
    private String usersName;
    private String nickName;
    private String userAddress;
    private String userEmail;
    private String userPNum;
 
    private List<UserOrderDetails> Info;
 
    public UserOrder() {
 
    }
    public UserOrder(String userID, String nickName, double amount, String usersName, String userAddress,
    		String userEmail, String userPNum) {
        this.userID = userID;
        this.amount = amount;
        this.usersName = usersName;
        this.nickName = nickName;
        this.userAddress = userAddress;
        this.userEmail = userEmail;
        this.userPNum = userPNum;
    }
    public void setUserID(String userID) {
        this.userID = userID;
    }
 
    public String getUserID() {
        return userID;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }
 
    public double getAmount() {
        return amount;
    }
    public void setNickName() {
    	this.nickName = nickName;
    }
    public String getNickName() {
    	return nickName;
    }
    public void setUsersName(String usersName) {
        this.usersName = usersName;
    }
 
    public String getUsersName() {
        return usersName;
    }
    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }
    public String getUserAddress() {
        return userAddress;
    }
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
 
    public String getUserEmail() {
        return userEmail;
    }
    public void setUserPNum(String userPNum) {
        this.userPNum = userPNum;
    }
    public String getUserPNum() {
        return userPNum;
    }
    public void setInfo(List<UserOrderDetails> Info) {
        this.Info = Info;
    } List<UserOrderDetails> getInfo() {
        return Info;
    }
 
}
