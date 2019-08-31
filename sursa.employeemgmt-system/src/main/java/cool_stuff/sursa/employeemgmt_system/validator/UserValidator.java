package cool_stuff.sursa.employeemgmt_system.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import cool_stuff.sursa.employeemgmt_system.dao.UserService;
import cool_stuff.sursa.employeemgmt_system.model.User;

@Component
public class UserValidator implements Validator {

	@Autowired
	private UserService userService;
	
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	public void validate(Object objUser, Errors errors) {
		
		User user = (User) objUser;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
		
		if(user.getUsername().length() < 6 || user.getUsername().length() > 32) {
			errors.rejectValue("username", "Size.userForm.username");
		}
		
		if(userService.findByUsername(user.getUsername())!=null) {
			errors.rejectValue("username", "Duplicate.userform.username");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		
		if(user.getPassword().length() < 8 || user.getPassword().length() > 20) {
			errors.rejectValue("password", "Size.userForm.password");
		}
		
		if(!user.getPasswordConfirm().contentEquals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
	}
}
