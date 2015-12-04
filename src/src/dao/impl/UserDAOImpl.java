package src.dao.impl;
import java.util.* ;
import java.sql.* ;
import src.dao.* ;
import src.vo.* ;
public class UserDAOImpl implements IUserDAO{
	private Connection conn = null ;
	private PreparedStatement pstmt = null ;
	public UserDAOImpl(Connection conn){
		this.conn = conn ;
	}
	public boolean doCreate(User user) throws Exception{
		boolean flag = false ;
		ResultSet max_id=this.conn.prepareStatement("select max(id) from user").executeQuery();
		max_id.next();
		String maxId=max_id.getString("max(id)");
		String sql = "INSERT INTO user(id,email,pwd,name,stu_num) VALUES (?,?,?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,1+Integer.parseInt(maxId));
		this.pstmt.setString(2,user.getEmail()) ;
		this.pstmt.setString(3,user.getPwd()) ;
		this.pstmt.setString(4,user.getName()) ;
		this.pstmt.setString(5,user.getStu_num()) ;
		if(this.pstmt.executeUpdate() > 0){
			flag = true ;
		}
		this.pstmt.close() ;
		return flag ;
	}
	public List<User> findAll(String keyWord) throws Exception{
		List<User> all = new ArrayList<User>() ;
		String sql = "SELECT id,email,pwd,name,stu_num FROM user WHERE name LIKE ? OR email LIKE ?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,"%"+keyWord+"%") ;
		this.pstmt.setString(2,"%"+keyWord+"%") ;
		ResultSet rs = this.pstmt.executeQuery() ;
		User user = null ;
		while(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setEmail(rs.getString(2)) ;
			user.setPwd(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
			all.add(user) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	public User findById(int id) throws Exception{
		User user = null ;
		String sql = "SELECT id,email,pwd,name,stu_num FROM user WHERE id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,id) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setEmail(rs.getString(2)) ;
			user.setPwd(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
		}
		this.pstmt.close();
		return user ;
	}
	public User findByEmail(String str) throws Exception{
		User user = null ;
		
		String sql = "SELECT id,email,pwd,name,stu_num FROM user WHERE Email=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,str) ;
		ResultSet rs = this.pstmt.executeQuery() ;
		if(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setEmail(rs.getString(2)) ;
			user.setPwd(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
		}
		this.pstmt.close();
		return user ;
	}
}
