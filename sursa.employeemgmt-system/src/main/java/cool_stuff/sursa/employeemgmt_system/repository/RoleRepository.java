package cool_stuff.sursa.employeemgmt_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cool_stuff.sursa.employeemgmt_system.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{

}
