# cool-spring-stuff-employee-mgmtsys
Employee Management System


# cool-spring-stuff-employee-mgmt-system
Employee Management System


# Technologies Used

a) Spring Boot
b) Maven
c) Java 8
d) Apache Tomcat
e) MySQL



# Steps I followed


# 2. Create a maven webapp project and 
# add in the following dependencies in pom.xml 
# to convert the project to spring boot

  <parent>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-parent</artifactId>
	<version>2.1.6.RELEASE</version>
  </parent>

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
      <scope>test</scope>
    </dependency>
    
	<dependency>
	    <groupId>org.springframework.boot</groupId>
	    <artifactId>spring-boot-starter-data-jpa</artifactId>
	</dependency>
	
	<dependency>
	    <groupId>org.springframework.boot</groupId>
	    <artifactId>spring-boot-starter-web</artifactId>
	</dependency>
	
	<dependency>
	    <groupId>org.apache.tomcat.embed</groupId>
	    <artifactId>tomcat-embed-jasper</artifactId>
	    <scope>provided</scope>
	</dependency>
	
	<dependency>
	    <groupId>org.springframework.boot</groupId>
	    <artifactId>spring-boot-devtools</artifactId>
	    <scope>runtime</scope>
	</dependency>
	
	<dependency>
	    <groupId>org.springframework.boot</groupId>
	    <artifactId>spring-boot-starter-test</artifactId>
	    <scope>test</scope>
	</dependency>
	
	<dependency>
	    <groupId>javax.servlet</groupId>
	    <artifactId>jstl</artifactId>
	</dependency>
	
	<dependency>
	    <groupId>mysql</groupId>
	    <artifactId>mysql-connector-java</artifactId>
	    <scope>runtime</scope>
	</dependency>
	
	<dependency>
	    <groupId>org.hibernate.validator</groupId>
	    <artifactId>hibernate-validator</artifactId>
	</dependency>
  </dependencies>

# 3. Model
package cool_stuff.sursa.employeemgmt_system.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name = "Employee")
@EntityListeners(AuditingEntityListener.class)
public class Employee {

	public Employee() {
		// TODO Auto-generated constructor stub
	}
	
	public static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Size(min=3, max=30)
	private String firstName;
	
	@Size(min=3, max=30)
	private String lastName;
	
	@NotBlank
	private String email;
	
	@NotBlank
	private String country;
	
	@NotEmpty
	private String sex;
	
	@Temporal(TemporalType.TIMESTAMP)
	@LastModifiedDate
	private Date createdAt;
	
	@NotEmpty
	private String section;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}
	
}


# 4. Controller

package cool_stuff.sursa.employeemgmt_system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cool_stuff.sursa.employeemgmt_system.dao.EmployeeDAO;
import cool_stuff.sursa.employeemgmt_system.model.Employee;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeDAO empDao;
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String createEmployee(ModelMap model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "create";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String saveEmployee(@Valid Employee employee, BindingResult result, ModelMap model, RedirectAttributes redirectAttributes) {
		if(result.hasErrors()) {
			return "create";
		}
		empDao.save(employee);
		return "redirect:/view/employees";
	}
	
	@RequestMapping(value="/view/employees")
	public ModelAndView getAll() {
		List<Employee> empList = empDao.findAll();
		return new ModelAndView("viewemployees", "list", empList);
	}

	@RequestMapping(value="/edit/employee/{id}")
	public String edit(@PathVariable int id, ModelMap model) {
		Employee employee = empDao.findById(id);
		model.addAttribute("employee", employee);
		return "editemployee";
	}
	
	@RequestMapping(value="/update/employee", method=RequestMethod.POST)
	public ModelAndView updateemployee(@ModelAttribute("employee") Employee emp) {
		Employee employee = empDao.findById(emp.getId());
		employee.setFirstName(emp.getFirstName());
		employee.setLastName(emp.getLastName());
		employee.setCountry(emp.getCountry());
		employee.setEmail(emp.getEmail());
		employee.setSection(emp.getSection());
		employee.setSex(emp.getSex());
		
		empDao.save(employee);
		return new ModelAndView("redirect:/view/employees");
	}
	
	@RequestMapping(value="/delete/employee/{id}", method=RequestMethod.GET)
	public ModelAndView delete(@PathVariable int id) {
		Employee emp = empDao.findById(id);
		empDao.delete(emp);
		return new ModelAndView("redirect:/view/employees");
	}
	
	
	@ModelAttribute("sections")
	public List<String> intializeSections(){
		List<String> sections = new ArrayList<String>();
		sections.add("Graduate");
		sections.add("Post Graduate");
		sections.add("Reasearch");
		return sections;
	}
	
	@ModelAttribute("countries")
	public List<String> initializeCountries() {
		List<String> countries = new ArrayList<String>();
		countries.add("Nepal");
		countries.add("Japan");
		countries.add("Korea");
		countries.add("USA");
		countries.add("Australia");
		countries.add("Italy");
		countries.add("Other");
		return countries;
	}
	
	
}
 
# 5. Repository
package cool_stuff.sursa.employeemgmt_system.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import cool_stuff.sursa.employeemgmt_system.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {

}

# 6. Main Application
package cool_stuff.sursa.employeemgmt_system;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class EmployeeApplication {
	public static void main(String[] args) {
		SpringApplication.run(EmployeeApplication.class, args);
	}
}

