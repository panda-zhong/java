package pojo;

import java.util.Date;

public class News {
	private String newsAuthor;
	private String newsTitle;
	private String newsMakerAccount;
	private String savePath;
	private Date saveDate;
	private String state;// null为提交审核 0审核不通过 1审核通过 2审核
	private String kind;//		1 科技 2 军事 3 体育 4 娱乐 5 政治
	private String kindName;
	private String publishDate;
	private String id;
	private String titleImage;
	private String dealId;
	private int commentSize;
	@Override
	public String toString() {
		return "News [newsAuthor=" + newsAuthor + ", newsTitle=" + newsTitle + ", newsMakerAccount=" + newsMakerAccount
				+ ", savePath=" + savePath + ", saveDate=" + saveDate + ", state=" + state + ", kind=" + kind
				+ ", kindName=" + kindName + ", publishDate=" + publishDate + ", id=" + id + ", titleImage="
				+ titleImage + "]";
	}

	public void kindToSetKindName(){
		if(this.kind!=null){
			switch (this.kind) {
			case "1":
				this.setKindName("科技");
				break;
			case "2":
				this.setKindName("军事");
				break;
			case "3":
				this.setKindName("体育");
				break;
			case "4":
				this.setKindName("娱乐");
				break;
			case "5":
				this.setKindName("政治");
				break;
			default:
				this.setKindName("");
				break;
			}
		}
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
		this.kindToSetKindName();
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNewsAuthor() {
		return newsAuthor;
	}
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public News() {
		// TODO Auto-generated constructor stub
		this.kindToSetKindName();
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getNewsMakerAccount() {
		return newsMakerAccount;
	}
	public void setNewsMakerAccount(String newsMakerAccount) {
		this.newsMakerAccount = newsMakerAccount;
	}
	public String getTitleImage() {
		return titleImage;
	}
	public void setTitleImage(String titleImage) {
		this.titleImage = titleImage;
	}
	public Date getSaveDate() {
		return saveDate;
	}
	public void setSaveDate(Date saveDate) {
		this.saveDate = saveDate;
	}
	public News(String newsAuthor, String newsTitle, String newsMakerAccount, String savePath, Date saveDate,
			String kind, String id, String titleImage) {
		super();
		this.newsAuthor = newsAuthor;
		this.newsTitle = newsTitle;
		this.newsMakerAccount = newsMakerAccount;
		this.savePath = savePath;
		this.saveDate = saveDate;
		this.kind = kind;
		this.id = id;
		this.titleImage = titleImage;
		this.kindToSetKindName();
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public News(String newsAuthor, String newsTitle, String newsMakerAccount, String savePath, Date saveDate,
			String state, String kind, String id, String titleImage) {
		super();
		this.newsAuthor = newsAuthor;
		this.newsTitle = newsTitle;
		this.newsMakerAccount = newsMakerAccount;
		this.savePath = savePath;
		this.saveDate = saveDate;
		this.state = state;
		this.kind = kind;
		this.id = id;
		this.titleImage = titleImage;
		this.kindToSetKindName();
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}


	public String getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}

	public String getDealId() {
		return dealId;
	}

	public void setDealId(String dealId) {
		this.dealId = dealId;
	}

	public int getCommentSize() {
		return commentSize;
	}

	public void setCommentSize(int commentSize) {
		this.commentSize = commentSize;
	}
	
	
}
