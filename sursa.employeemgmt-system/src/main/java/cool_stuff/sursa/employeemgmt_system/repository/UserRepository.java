package cool_stuff.sursa.employeemgmt_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cool_stuff.sursa.employeemgmt_system.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findByUsername(String username);
}
