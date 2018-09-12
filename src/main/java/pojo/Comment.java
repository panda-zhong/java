package pojo;

import java.util.Date;

public class Comment {
	private String context;
	private Date time;
	private String newsId;
	private User user;
	
	
	
	public Comment(Date time, String newsId, User user) {
		super();
		this.time = time;
		this.newsId = newsId;
		this.user = user;
	}


	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Comment(String context, Date time, String newsId, User user) {
		super();
		this.context = context;
		this.time = time;
		this.newsId = newsId;
		this.user = user;
	}


	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getNewsId() {
		return newsId;
	}
	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
