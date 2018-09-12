package service;

import java.sql.SQLException;
import java.util.List;

import dao.ManageDao;
import dao.impl.ManageDaoImpl;
import pojo.Manage;

public class ManageService {
	private ManageDao manageDao = new ManageDaoImpl();
	public Manage checkLogin(String account,String password) throws SQLException{
		return manageDao.checkLogin(account, password);
	}
	public void register(Manage manage) throws SQLException{
		manageDao.register(manage);
		return;
	}
	
	public boolean checkAccount(String account) throws SQLException{
		return manageDao.checkAccount(account);
	}
	public List<Manage> getAllManageInfo() throws SQLException{
		return this.manageDao.getAllManageInfo();
	}
	
	public void disableAccount(String account) throws SQLException{
		String disableState = "0";
		this.manageDao.setState(account, disableState);
	}
	
	public void enableAccount(String account) throws SQLException{
		String enableState = "1";
		this.manageDao.setState(account, enableState);
	}
	
	/**
	 * @param account
	 * @param name
	 * @throws SQLException
	 */
	public void setName(String account,String name) throws SQLException{
		this.manageDao.setName(account, name);
	}
	
	/**
	 * @param account
	 * @param logo
	 * @throws SQLException
	 */
	public void setLogo(String account,String logo) throws SQLException{
		this.manageDao.setLogo(account, logo);
		return;
	}
}
