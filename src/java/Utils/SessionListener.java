/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utils;

/**
 *
 * @author thain
 */
import DAL.AccountDAO;
import Model.Account;
import jakarta.servlet.http.HttpSessionListener;
import jakarta.servlet.http.HttpSessionEvent;
import java.sql.Timestamp;

public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        Account account = (Account) se.getSession().getAttribute("account");
        if (account != null) {
            AccountDAO accountDAO = new AccountDAO();
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
            account.setLastActiveTime(currentTimestamp);
            accountDAO.updateAccountLastActiveTime(account);
        }
    }
}
