package pojo;

public class User {
	private String account;
	private String password;
	private String name;
	private String registerTime;
	private String logo;
	private String state;
	private String salt;
	public User(String account, String password, String name, String registerTime, String logo) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.registerTime = registerTime;
		this.logo = logo;
	}
	
	
	public User(String account, String name, String logo) {
		super();
		this.account = account;
		this.name = name;
		this.logo = logo;
	}


	public User() {
		// TODO Auto-generated constructor stub
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public User(String account, String password, String name, String logo) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.logo = logo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	/**
	 * @param account
	 * @param password
	 * @param name
	 * @param registerTime
	 * @param logo
	 * @param state
	 */
	public User(String account, String password, String name, String registerTime, String logo, String state) {
		this.account = account;
		this.password = password;
		this.name = name;
		this.registerTime = registerTime;
		this.logo = logo;
		this.state = state;
	}


	public String getSalt() {
		return salt;
	}


	public void setSalt(String salt) {
		this.salt = salt;
	}
	
	
	
	
}
