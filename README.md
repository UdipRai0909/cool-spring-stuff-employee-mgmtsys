# Employee Management System



# Technologies Used

1. Spring Boot
2. Maven
3. Java 8
4. Apache Tomcat
5. MySQL



# Steps I followed

	-------------------------------------------------------------------------------------------------------------
	
	# PHASE ONE #(Create a CRUD Application)
	
		1. Create a maven webapp project and add in the required dependencies in pom.xml to convert the project to spring boot
		
		2. Create a model to connect it to the database using hibernate later on.
		
		3. Create a Employee Repository where you define a interface that implements JpaRepository.
		
		4. Create a DAO to handle the methods of the Employee repository.
		
		5. Create a Controller to handle the model and views.
		
		6. Then, create your main application where your main method will be executed.
		
	-------------------------------------------------------------------------------------------------------------
	
	# PHASE TWO #(Logic of Spring Security)
		
		1. Build the code of Model classes inside the model package.
			- User Class
			- Role Class
			#Note: 
				a. Entity is a lightweight persistence object which represents a table in a relational database. 
				b. Each entity instance corresponds a row in that table.
			
		2. Build the code of JPA Repository inside the repository package.
			- Create an interface as UserRepository 
			- The repo extends JpaRepository<User, Long>
			- Create an interface as RoleRepository and extend it to <Role, Long>
			#Note:
				a. JPA (Java Persistence API) is a java specification for accessing, persisting, and managing 
				   data between Java objects/classes and a relational database.
				b. JPA was defined as a part of the EJB 3.0 specificatin as a replacement for the EJB 2 CMP 
				   Entity Beans Specification.
				c. JPA is now considered as the standard industry approach for Object to Relational Mapping (ORM)
				   in the Java industry.
		
		3. Build the code of service classes inside DAO package.
			- Create a class as UserDetailsServiceImpl where you tackle with the user roles and authorities
			- Create an interface as UserService which has the signatures : 
				~ void save(User user)
				~ User findByUsername(String username)
			- Create a class as UserServiceImpl that implements UserService
			- Create an interface as SecurityService
				~ void autoLogin(String username, String password )
			- Create an implementation for the SecurityService as SecurityServiceImpl
			
			#Note: 
				a. UserDetailsService is used in order to lookup the username, password and GrantedAuthorities
				   for any given user.
				b. The in terface provides only one method for implementing class to implement.
				c. UserDetails loadUserByUsername(String username) throws UsernameNotFoundException.
				d. The four annotaions (component, service, repository and controller) make the class as a spring 
				   bean to the IOC container. @Service on service classes(implementations) represents the service class a bean to 
				   the IOC container.
				e. @Autowired can be used directly on properties, thus eliminating the need of getters and setters.
				f. @Transactional provides a way for Springboot to inject behaviors before, after, or around method 
				   calls to an object being proxied.
				   Transactional Management is just one example of the behaviors that can be hooked in. Security checks
				   are another.
				   And you can provide your own, too, for things like logging.
				   So, when you annotate the method with this @, Springboot dynamically creates a proxy that implements 
				   the same interfacee(s) as the class you're annotating.
				   And when the client makes calls into your object, the calls are intercepted and the behaviors injected
				   via the proxy mechanism.
				   By the way, transactions in EJB work in a similar fashion.   
						
    -------------------------------------------------------------------------------------------------------------
		
	# PHASE THREE #(Controller layer)
		
		1. Inside ~src/main/resources, create a file named 'validation.properties' and place some conditions.
		   - For eg: NotEmpty=This field is required.
						
		2. Build the code of UserValidator in a new package named as 'validator' for instance.
		   - Define all the required validation rules. 
					
		3. Inside ~src/main/resources, create a file named 'validation.properties' and place some conditions.
		   - For eg: NotEmpty=This field is required.
						
		4. Build the code of registration and login in the controller layer.
					
		5. Create a class named as WebSecurityConfig inside your main package. (where your main class is also present)
		   - Use annotations : @Configuration @EnableWebSecurity
		   - Define methods
			
   -------------------------------------------------------------------------------------------------------------
		
    # PHASE FOUR #(Manage Views)
   
      1. I specifically used jstl, spring form and jsp
   
   	    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
   	    
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		
	    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

		<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	 2. See this code inside WebSecurityConfig.
	 
	    @Configuration
		@EnableWebSecurity
		public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
			
			
			@Autowired
			private UserDetailsService udService;
			
			@Bean
			public AuthenticationManager authenticationManagerBean() throws Exception {
			    return super.authenticationManagerBean();
			}
			
			@Override
			public void configure(WebSecurity web) throws Exception {
			    web
			    	.ignoring()
			    		.antMatchers("/javax.faces.resource/**");
			}
			
			@Bean
			public BCryptPasswordEncoder lockPassword() {
				return new BCryptPasswordEncoder();
			}
			
			@Override
			protected void configure(HttpSecurity http) throws Exception {
				http
						.authorizeRequests()
							.antMatchers("/css/**", "/js/**", "/registration").permitAll()
							.anyRequest().authenticated()
							.and()
						.formLogin()
							.loginPage("/login")
							.permitAll()
							.and()
						.logout()
							.permitAll();
			}
			
			@Autowired
			public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
				auth.userDetailsService(udService).passwordEncoder(lockPassword());
			} 
			
		3. Work around with bootstrap css and js
	 		
   -------------------------------------------------------------------------------------------------------------
		
    # PHASE FIVE #(Give Roles to specific users)
		
			
