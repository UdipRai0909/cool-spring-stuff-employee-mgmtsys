package cool_stuff.sursa.employeemgmt_system.dao;

public interface SecurityService {
	
	String findLoggedInUsername();
	void autologin(String username, String password);
	
}
