package action.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.ApplyMessage;
import pojo.Manage;
import service.ApplyMessageService;

/**
 * @author Berenice
 *
 */
@WebServlet(urlPatterns = "/manage/dealWithApplyMessage/*")
public class DealWithApplyMessage extends HttpServlet {

	/**
	 * 
	 * 
	 */
	private static final long serialVersionUID = 1L;
	HttpSession session = null;
	PrintWriter pw = null;
	String path = null;
	private ApplyMessageService applyMessageService = new ApplyMessageService();

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String action = uri.substring(uri.lastIndexOf('/') + 1);
		session = req.getSession();
		path = req.getContextPath();
		pw = resp.getWriter();
		System.out.println(uri);
		switch (action) {
		case "accept":
			try {
				this.acceptAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "refuse":
			try {
				this.refuseAction(req, resp);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		return;
	}

	private void refuseAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String id = req.getParameter("applyId");
		Manage dealManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String dealAccount = dealManage.getAccount();
		List<ApplyMessage> applyMessages = (List<ApplyMessage>) session.getAttribute("APPLYMESSAGEINSESSION");
		ApplyMessage applyMessage = null;
		for (ApplyMessage forApplyMessage : applyMessages) {
			if (forApplyMessage.getId().equals(id)) {
				applyMessage = forApplyMessage;
				// applyMessage = new ApplyMessage(forApplyMessage);
				break;
			}
		}
		this.applyMessageService.refuse(dealAccount, applyMessage); 
		System.out.println(dealAccount + "拒绝处理" + applyMessage.getAccount());
	}

	private void acceptAction(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		// TODO Auto-generated method stub
		String id = req.getParameter("applyId");
		Manage dealManage = (Manage) session.getAttribute("MANAGEINSESSION");
		String dealAccount = dealManage.getAccount();
		List<ApplyMessage> applyMessages = (List<ApplyMessage>) session.getAttribute("APPLYMESSAGEINSESSION");
		ApplyMessage applyMessage = null;
		for (ApplyMessage forApplyMessage : applyMessages) {
			if (forApplyMessage.getId().equals(id)) {
				applyMessage = forApplyMessage;
				// applyMessage = new ApplyMessage(forApplyMessage);
				break;
			}
		}
		this.applyMessageService.accept(dealAccount, applyMessage);
		System.out.println(dealAccount + "接受处理" + applyMessage.getAccount());
	}
}
