package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import action.manage.DealWithApplyMessage;
import dao.ApplyMessageDao;
import pojo.ApplyMessage;
import pojo.Manage;
import util.JDBCUtil;

public class ApplyMessageDaoImpl implements ApplyMessageDao{
	private Connection connect = JDBCUtil.getConnection();
	private String sql = null;
	private PreparedStatement preparedStatement = null;
	@Override
	public void addNewApply(String account,String kind) throws SQLException {
		// TODO Auto-generated method stub
		sql = "INSERT INTO applymessage(fromAccount,kind) VALUES(?,?);";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, account);
		preparedStatement.setString(2, kind);//1是管理员 3是新闻发布员
		preparedStatement.execute();
		return;
	}
	@Override
	public List<ApplyMessage> getAllApplyMessage() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT fromAccount,kind,applyId from applymessage where isAccept = ?";
	    preparedStatement = connect.prepareStatement(sql);
	    preparedStatement.setString(1, "2");
		ResultSet manageSet = preparedStatement.executeQuery();
		List<ApplyMessage> applyMessages = new ArrayList<ApplyMessage>();
		while(manageSet.next()){
			String fromAccount = manageSet.getString("fromAccount");
			String kind = manageSet.getString("kind");
			String id = manageSet.getString("applyId");
			ApplyMessage message = new ApplyMessage(id, fromAccount, kind);
			applyMessages.add(message);
		}
		return applyMessages;
	}
	@Override
	public int getApplyMessageSize() throws SQLException {
		// TODO Auto-generated method stub
		sql = "SELECT COUNT(*) as size from applymessage where isAccept = ?";
	    preparedStatement = connect.prepareStatement(sql);
	    preparedStatement.setString(1, "2");
		ResultSet manageSet = preparedStatement.executeQuery();
		while(manageSet.next()){
			String sizeStr = manageSet.getString("size");
			int size = Integer.parseInt(sizeStr);
			return size;
		}
		return 0;
	}
	@Override
	public void setAccept(String applyMessageId, String dealAccount, String isAccept) throws SQLException {
		// TODO Auto-generated method stub
		sql = "UPDATE applymessage set isAccept = ?,dealAccount = ? where applyId = ?";
		preparedStatement = connect.prepareStatement(sql);
		preparedStatement.setString(1, isAccept);
		preparedStatement.setString(2, dealAccount);
		preparedStatement.setString(3, applyMessageId);
		preparedStatement.execute();
		return;
	}

}
