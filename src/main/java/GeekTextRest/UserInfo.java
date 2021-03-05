package shoppingcart;
/**
*  Title: BookInfo
*  Semester: CEN4010 - Spring 2021
*  @author Bryce Winchester
* 
* I affirm that this program is entirely my own work and none of it is the work
* of any other person. 
* 
* This class provides the UserInfo object for the GeekText application group
* project for group 9
* 
*/
	public class UserInfo {
	 
	    private String userAddress;
	    private String nickName;
	    private String usersName;
	    private String userEmail;
	    private String userPNum;
	 
	    public UserInfo() {
	 
	    }
	 
	    public UserInfo(UserConfig userconfig) {
	        this.usersName = userconfig.getUsersName();
	        this.userAddress = userconfig.getUserAddress();
	        this.userEmail = userconfig.getUserEmail();
	        this.userPNum = userconfig.getUserPNum();
	        // this.valid = userconfig.isValid();
	    }
	    public void setnickName(String nickName) {
	    	this.nickName = nickName;
	    }
	    public void setUsersName(String usersName) {
	        this.usersName = usersName;
	    }
	 
	    public String getUsersName() {
	        return usersName;
	    }
	    public void setUserEmail(String userEmail) {
	        this.userEmail = userEmail;
	    }
	    public String getUserEmail() {
	        return userEmail;
	    }
	    public void setUserAddress(String userAddress) {
	        this.userAddress = userAddress;
	    }
	 
	    public String getUserAddress() {
	        return userAddress;
	    }
	    public void setUserPNum(String userPNum) {
	        this.userPNum = userPNum;
	    }
	 
	    public String getUserPNum() {
	        return userPNum;
	    }
	
	} 


