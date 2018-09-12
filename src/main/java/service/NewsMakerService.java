package service;

import java.sql.SQLException;
import java.util.List;

import dao.ManageDao;
import dao.NewsMakerDao;
import dao.impl.ManageDaoImpl;
import dao.impl.NewsMakerDaoImpl;
import pojo.Manage;
import pojo.NewsMaker;

public class NewsMakerService {
	private NewsMakerDao newsMakerDao = new NewsMakerDaoImpl();
	public NewsMaker checkLogin(String account,String password) throws SQLException{
		return newsMakerDao.checkLogin(account, password);
	}
	public void register(NewsMaker newsMaker) throws SQLException{
		newsMakerDao.register(newsMaker);
		return;
	}
	
	public boolean checkAccount(String account) throws SQLException{
		return newsMakerDao.checkAccount(account);
	}
	public List<NewsMaker> getAllNewsMakerInfo() throws SQLException{
		return this.newsMakerDao.getAllNewsMakerInfo();
	}
	
	public void disableAccount(String account) throws SQLException{
		String disableState = "0";
		this.newsMakerDao.setState(account, disableState);
	}
	
	public void enableAccount(String account) throws SQLException{
		String enableState = "1";
		this.newsMakerDao.setState(account, enableState);
	}
	
	public void setName(String account,String name) throws SQLException{
		this.newsMakerDao.setName(account, name);
	}
	public void setLogo(String account,String logo) throws SQLException{
		this.newsMakerDao.setLogo(account, logo);
	}
	public String getNewsMakerSize() throws SQLException {
		return this.newsMakerDao.getNewsMakerSize();
	}
}
