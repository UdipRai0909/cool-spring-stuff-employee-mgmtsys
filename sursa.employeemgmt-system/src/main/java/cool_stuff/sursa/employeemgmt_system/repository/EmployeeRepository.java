package cool_stuff.sursa.employeemgmt_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cool_stuff.sursa.employeemgmt_system.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}
