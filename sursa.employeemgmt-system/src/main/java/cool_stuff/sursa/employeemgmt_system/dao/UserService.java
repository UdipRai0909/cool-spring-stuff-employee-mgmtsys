package cool_stuff.sursa.employeemgmt_system.dao;

import cool_stuff.sursa.employeemgmt_system.model.User;

public interface UserService {
	
	void save(User user);
	User findByUsername(String username);
}
