package src.test;

import java.util.Iterator;
import java.util.List;

import src.factory.DAOFactory;
import src.vo.User;

public class DAOInsertTest {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		User emp = null ;
		for(int x=0;x<5;x++){
			emp = new User() ;
			emp.setId(1000 + x) ;
			emp.setName("лн╦Г - " + x) ;
			emp.setPwd("123") ;
			emp.setEmail("1234@qq.com");
			DAOFactory.getIUserDAOInstance().doCreate(emp);
		}
		List<User> all = DAOFactory.getIUserDAOInstance().findAll("") ;
		Iterator<User> iter = all.iterator() ;
		while(iter.hasNext()){
			emp = iter.next() ;
			System.out.println(emp.getId() + "-->" + emp.getEmail() + " --> " + emp.getName()) ;
		}
	}
}

