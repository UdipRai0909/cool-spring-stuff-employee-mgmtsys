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


1. Create a table inside a database using the query below.

CREATE database employee_mgmt_system;

USE employee_mgmt_system;
a
CREATE table employee (
	id int NOT NULL PRIMARY KEY auto_increment,
	firstName varchar(50),
	lastName varchar(50),
	sex varchar(1),
	dob DATE,
	email varchar(255) NOT NULL,
	section varchar(100),
	country varchar(100),
	firstAttempt boolean,
	subjects varchar(255),
	UNIQUE(email)
)engine=innodb;

select * from employee;


2. Create a maven webapp project and add in the following dependencies in pom.xml to convert the project to spring boot

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

3. 
