package src.factory;

import src.dao.IUserDAO;
import src.dao.proxy.UserDAOProxy;

public class DAOFactory {
	public static IUserDAO getIUserDAOInstance() throws Exception{
		return new UserDAOProxy() ;
	}
}
