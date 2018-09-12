package pojo;

public class Manage {
	private String account;
	private String password;
	private String name;
	private String registerTime;
	private String logo;//保存图片名称
	private String state;
	
	@Override
	public String toString() {
		return "Manage [account=" + account + ", password=" + password + ", name=" + name + ", registerTime="
				+ registerTime + ", logo=" + logo + ", state=" + state + "]";
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
	public Manage() {
		// TODO Auto-generated constructor stub
	}
	public Manage(String account, String password, String name, String registerTime, String logo) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.registerTime = registerTime;
		this.logo = logo;
	}
	
	
	
	
	/**
	 * @param account
	 * @param password
	 * @param name
	 * @param logo
	 */
	public Manage(String account, String password, String name, String logo) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.logo = logo;
	}
	public Manage(String account, String password, String name, String registerTime, String logo, String state) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.registerTime = registerTime;
		this.logo = logo;
		this.state = state;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
