package dao;

import java.sql.SQLException;

import pojo.News;

public interface NewsDealDao {
	public void addNewsApply(News news) throws SQLException;
	public int getNextId() throws SQLException;
	public void setState(String dealId,String dealAccount,String state) throws SQLException;
	public String getNewsDealSize() throws SQLException;
}
