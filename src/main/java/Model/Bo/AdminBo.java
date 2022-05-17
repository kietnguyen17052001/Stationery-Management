package Model.Bo;

import Model.Bean.Account;
import Model.Dao.AdminDao;

public class AdminBo {
	AdminDao dao = new AdminDao();

	public Account changeNameAccount(Account account, String name) throws Exception {
		return dao.changeNameAccount(account, name);
	}

	public Account changePasswordAccount(Account account, String curPassword, String newPassword) throws Exception {
		return dao.changePasswordAccount(account, curPassword, newPassword);
	}
}
