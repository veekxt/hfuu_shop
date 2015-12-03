package src.dao.proxy;

import java.util.List;

import src.dao.IUserDAO;
import src.dao.impl.UserDAOImpl;
import src.dbc.DatabaseConnection;
import src.vo.User;

public class UserDAOProxy implements IUserDAO {
	private DatabaseConnection dbc = null ;
	private IUserDAO dao = null ;
	public UserDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection() ;
		this.dao = new UserDAOImpl(this.dbc.getConnection()) ;
	}
	@Override
	public boolean doCreate(User user) throws Exception {
		boolean flag = false ;
		try{
			if(this.dao.findById(user.getId()) == null){
				flag = this.dao.doCreate(user) ;
			}
			else{
				flag = this.dao.doCreate(user) ;
			}
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return flag;
	}

	@Override
	public List<User> findAll(String keyWord) throws Exception {
		List<User> all = null ;
		try{
			all = this.dao.findAll(keyWord) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return all;
	}

	@Override
	public User findById(int id) throws Exception {
		User user = null ;
		try{
			user = this.dao.findById(id) ;
		}catch(Exception e){
			throw e ;
		}finally{
			this.dbc.close() ;
		}
		// TODO Auto-generated method stub
		return user;
	}

}
