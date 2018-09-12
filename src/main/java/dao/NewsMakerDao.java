package dao;

import java.sql.SQLException;
import java.util.List;

import pojo.Manage;
import pojo.NewsMaker;
import pojo.User;

public interface NewsMakerDao {
	/**
	 * @param account
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public NewsMaker checkLogin(String account,String password) throws SQLException;
	public void register(NewsMaker newsMaker) throws SQLException;
	public boolean checkAccount(String account) throws SQLException;
	/**
	 * @param account
	 * @param state
	 * @throws SQLException
	 */
	public void setState(String account,String state) throws SQLException;
	public List<NewsMaker> getAllNewsMakerInfo() throws SQLException;
	public void setName(String account,String name) throws SQLException;
	public void setLogo(String account,String logo) throws SQLException;
	public String getNewsMakerSize() throws SQLException;
}
