package dao;

import java.sql.SQLException;
import java.util.List;

import pojo.Manage;

public interface ManageDao {
	public Manage checkLogin(String account,String password) throws SQLException;
	public void register(Manage manage) throws SQLException;
	public boolean checkAccount(String account) throws SQLException;
	public void setState(String account,String state) throws SQLException;
	public List<Manage> getAllManageInfo() throws SQLException;
	public void setName(String account,String name) throws SQLException;
	public void setLogo(String account,String logo) throws SQLException;
	public void setEmail(String account,String email) throws SQLException;
	public void setPassword(String email,String password) throws SQLException;
}
