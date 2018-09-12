package dao;

import java.sql.SQLException;
import java.util.List;

import pojo.ApplyMessage;

public interface ApplyMessageDao {
	/**
	 * @param account
	 * @param kind
	 * @throws SQLException
	 */
	public void addNewApply(String account,String kind) throws SQLException;
	/**
	 * @return
	 * @throws SQLException
	 */
	public List<ApplyMessage> getAllApplyMessage() throws SQLException;
	/**
	 * @return
	 * @throws SQLException
	 */
	public int getApplyMessageSize() throws SQLException;
	/**
	 * @param applyMessageId
	 * @param deealAccount
	 * @param isAccept
	 * @throws SQLException
	 */
	public void setAccept(String applyMessageId,String deealAccount,String isAccept) throws SQLException;
}
