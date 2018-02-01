package edu.ben.model;

import org.hibernate.annotations.SQLUpdate;
import org.springframework.context.annotation.Primary;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.sql.Timestamp;

@Entity(name = "user")
@Table(name = "user")
@Transactional
public class User {

	@Id
	@Column(name = "user_ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userID;

	@Column(name = "first_name")
	@NotNull
	@Size(min = 2, max = 30, message = "First Name Must Be Between 2 and 30 Characters")
	private String firstName;

	@Column(name = "last_name")
	@NotNull
	@Size(min = 2, max = 30, message = "Last Name Must Be Between 2 and 30 Characters")
	private String lastName;

	@Column(unique = true, name = "username")
	@NotNull
	@Size(min = 6, max = 20, message = "First Name Must Be Between 6 and 20 Characters")
	private String username;

	@Column(name = "email")
	@Email
	@Size(max = 40, message = "Invalid Email")
	private String email;

	@Column(unique = true, name = "school_email")
	@NotNull
	@Email(message = "Invalid School Email")
	@Size(min = 3, max = 40, message = "Invalid School Email")
	private String schoolEmail;

	@Column(name = "password")
	@NotNull
	@Size(min = 3, max = 20, message = "Password Must Be Between 6 and 20 Characters")
	private String password;

	@Transient
	private String passwordConfirm;

	@Transient
	private int securityLevel;

	@Column(name = "active")
	private int active;

	/**
	 * @AssertTrue(message = "Passwords Do Not Match") private boolean
	 *                     matchingPassword() { return
	 *                     this.password.equals(this.passwordConfirm); }
	 */

	@Column(name = "login_attempts")
	private int loginAttempts;

	@Column(name = "date_modified")
	private Timestamp dateModified;

	@Column(name = "date_created")
	private Timestamp dateCreated;

	@Column(name = "locked")
	private int locked;

	@Column(name = "admin_level")
	private int adminLevel;

	public User() {
	}

	public User(String firstName, String lastName, String username, String email, String schoolEmail, String password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.email = email;
		this.schoolEmail = schoolEmail;
		this.password = password;
	}

	public User(String firstName, String lastName, String username, String email, String schoolEmail, String password,
			String passwordConfirm, int securityLevel) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.email = email;
		this.schoolEmail = schoolEmail;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.securityLevel = securityLevel;
	}

	public User(int userID, String firstName, String lastName, String username, String email, String schoolEmail,
			String password, String passwordConfirm, int securityLevel) {
		this.userID = userID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.email = email;
		this.schoolEmail = schoolEmail;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.securityLevel = securityLevel;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSchoolEmail() {
		return schoolEmail;
	}

	public void setSchoolEmail(String schoolEmail) {
		this.schoolEmail = schoolEmail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	// private int phoneNumber;

	public int getSecurity_level() {
		return securityLevel;
	}

	public void setSecurity_level(int securityLevel) {
		this.securityLevel = securityLevel;
	}

	public int getSecurityLevel() {
		return securityLevel;
	}

	public void setSecurityLevel(int securityLevel) {
		this.securityLevel = securityLevel;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public int getLoginAttempts() {
		return loginAttempts;
	}

	public void setLoginAttempts(int loginAttempts) {
		this.loginAttempts = loginAttempts;
	}

	public void setAdmin(int i) {
		this.adminLevel = i;
	}

	public int getAdminLevel(){return this.adminLevel;}

	public void setAdminLevel(int i){this.adminLevel = i;}
}
