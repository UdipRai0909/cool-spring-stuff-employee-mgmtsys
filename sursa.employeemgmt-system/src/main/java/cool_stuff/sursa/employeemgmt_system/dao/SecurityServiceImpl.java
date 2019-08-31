package cool_stuff.sursa.employeemgmt_system.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService {
	@Autowired
	private AuthenticationManager verifyUser;
	
	@Autowired
	private UserDetailsService udService;
	
	private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);
	
	public String findLoggedInUsername() {
		Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
		if(userDetails instanceof UserDetails) {
			return ((UserDetails) userDetails).getUsername(); 
		}
		return null;
	}

	@Override
	public void autologin(String username, String password) {
		UserDetails userDetails = udService.loadUserByUsername(username);
		UsernamePasswordAuthenticationToken upToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
		
		verifyUser.authenticate(upToken);
		if(upToken.isAuthenticated()) {
			SecurityContextHolder.getContext().setAuthentication(upToken);
			logger.debug(String.format("Auto Login %s successfully", username));
		}
	}
}
