package register.signup;

public class User {
    String username;
    String email;
    String country;

    public User(String username, String email, String country) {
        this.username = username;
        this.email = email;
        this.country = country;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
    
}