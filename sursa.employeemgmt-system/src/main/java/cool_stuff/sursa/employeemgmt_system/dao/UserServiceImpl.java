package cool_stuff.sursa.employeemgmt_system.dao;

import java.util.HashSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import cool_stuff.sursa.employeemgmt_system.model.Role;
import cool_stuff.sursa.employeemgmt_system.model.User;
import cool_stuff.sursa.employeemgmt_system.repository.RoleRepository;
import cool_stuff.sursa.employeemgmt_system.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RoleRepository roleRepo;
	
	@Autowired
	private BCryptPasswordEncoder lock;
	
	public void save(User user) {
		user.setPassword(lock.encode(user.getPassword()));
		user.setRoles(new HashSet<Role>(roleRepo.findAll()));
		userRepo.save(user);
	}
	
	public User findByUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
}
