package src.dao;

import java.util.List;

import src.vo.User;

public interface IUserDAO {
	public boolean doCreate(User user) throws Exception ;
	public List<User> findAll(String keyWord) throws Exception ;
	public User findById(int id) throws Exception ;
	public User findByEmail(String str) throws Exception ;
}
