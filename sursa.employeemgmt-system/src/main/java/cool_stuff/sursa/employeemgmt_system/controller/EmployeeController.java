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