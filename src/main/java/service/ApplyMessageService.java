package service;

import java.sql.SQLException;
import java.util.List;

import dao.ApplyMessageDao;
import dao.ManageDao;
import dao.NewsMakerDao;
import dao.impl.ApplyMessageDaoImpl;
import dao.impl.ManageDaoImpl;
import dao.impl.NewsMakerDaoImpl;
import pojo.ApplyMessage;

public class ApplyMessageService {
	private ApplyMessageDao applyMessageDao = new ApplyMessageDaoImpl();
	private ManageDao manageDao = new ManageDaoImpl();
	private NewsMakerDao newsMakerDao = new NewsMakerDaoImpl();
	/**
	 * @param account
	 * @param kind
	 * @throws SQLException
	 */
	public void addNewApply(String account,String kind) throws SQLException{
		this.applyMessageDao.addNewApply(account,kind);
	}
	public List<ApplyMessage> getAllApplyMessage() throws SQLException{
		return this.applyMessageDao.getAllApplyMessage();
	}
	
	public int getApplyMessageSize() throws SQLException{
		return this.applyMessageDao.getApplyMessageSize();
	}
	
	/**
	 * @param dealAccount
	 * @param applyMessage
	 * @throws SQLException
	 */
	public void accept(String dealAccount,ApplyMessage applyMessage) throws SQLException{
		String accept = "1";
		String kind = applyMessage.getKind();
		this.applyMessageDao.setAccept(applyMessage.getId(), dealAccount,accept);
		if("1".equals(kind)){
			this.manageDao.setState(applyMessage.getAccount(), accept);
		}else if("3".equals(kind)){
			this.newsMakerDao.setState(applyMessage.getAccount(), accept);
		}else{
			
		}
	}
	public void refuse(String dealAccount,ApplyMessage applyMessage) throws SQLException{
		String refuse = "0";
		String kind = applyMessage.getKind();
		this.applyMessageDao.setAccept(applyMessage.getId(), dealAccount,refuse);
		if("1".equals(kind)){
			this.manageDao.setState(applyMessage.getAccount(), refuse);
		}else if("3".equals(kind)){
			this.newsMakerDao.setState(applyMessage.getAccount(), refuse);
		}else{
			
		}
	}
}
