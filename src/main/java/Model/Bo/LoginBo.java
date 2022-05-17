package Model.Bo;

import Model.Bean.Account;
import Model.Dao.LoginDao;

public class LoginBo {
	LoginDao dao = new LoginDao();

	public Account getAccount(String username, String password) throws Exception {
		return dao.getAccount(username, password);
	}
}
