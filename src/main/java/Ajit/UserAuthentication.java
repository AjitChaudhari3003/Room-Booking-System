package Ajit;

public class UserAuthentication {
    // Business logic
    public boolean checkUser(String user, String pass) {
    	LogindatabaseConnectivity ref = new LogindatabaseConnectivity(); 
        return ref.isvalid(user, pass);
    }
}
