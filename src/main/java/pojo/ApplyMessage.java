package pojo;

public class ApplyMessage {
	private String id;
	private String account;
	private String kind;
	private String kindName;
	
	public void kindToKindName(){
		System.out.println(this.kind);
		if("1".equals(this.kind)){
			this.setKindName("管理员");
		}else if("3".equals(this.kind)){
			this.setKindName("新闻发布员");
		}else{
			this.setKindName("");
		}
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
		this.kindToKindName();
	}
	public ApplyMessage() {
		// TODO Auto-generated constructor stub
		this.kindToKindName();
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ApplyMessage(String id, String account, String kind) {
		this.id = id;
		this.account = account;
		this.kind = kind;
		this.kindToKindName();
	}
	

	
}
