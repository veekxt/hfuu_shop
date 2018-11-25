package src.dbHandle;
import java.util.* ;
import java.sql.* ;

import src.dbc.DatabaseConnection;
import src.vo.* ;
public class UserHandle{
	private Connection conn = null;
	private PreparedStatement pstmt = null ;
	public UserHandle(){
		try {
			this.conn=new DatabaseConnection().getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean doCreate(User user) throws Exception{
		boolean flag = false ;
		ResultSet max_id=this.conn.prepareStatement("select max(id) from user").executeQuery();
		max_id.next();
		String maxId=max_id.getString("max(id)");
		String sql = "INSERT INTO user(id,email,pwd,name,stu_num,phone) VALUES (?,?,?,?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,1+Integer.parseInt(maxId));
		this.pstmt.setString(2,user.getEmail()) ;
		this.pstmt.setString(3,user.getPwd()) ;
		this.pstmt.setString(4,user.getName()) ;
		this.pstmt.setString(5,user.getStu_num()) ;
		this.pstmt.setString(6,user.getPhone()) ;
		if(this.pstmt.executeUpdate() > 0){
			flag = true ;
		}
		this.pstmt.close() ;
		return flag ;
	}
	
	public boolean doUpdate(User user) throws Exception{
		boolean flag = false ;
		String sql = "update user set pwd=?,name=?,phone=?,img=? where id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setString(1,user.getPwd());
		this.pstmt.setString(2,user.getName()) ;
		this.pstmt.setString(3,user.getPhone()) ;
		this.pstmt.setString(4,user.getImg()) ;
		this.pstmt.setInt(5,user.getId()) ;
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
	
	public boolean emptyMessnum(User user) throws Exception{
	    String sql = "update user set mess_num=0 WHERE id="+user.getId();
	    this.pstmt = this.conn.prepareStatement(sql) ;
	    if(this.pstmt.executeUpdate(sql)>0){
	        user.setMessnum(0);
	        return true;
	    }
	    return false;
	}
	
	public User findById(int id) throws Exception{
		User user = null ;
		String sql = "SELECT id,email,pwd,name,stu_num ,phone,mess_num,img FROM user WHERE id=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1,id) ;
		ResultSet rs = this.pstmt.executeQuery();
		if(rs.next()){
			user = new User() ;
			user.setId(rs.getInt(1)) ;
			user.setEmail(rs.getString(2)) ;
			user.setPwd(rs.getString(3)) ;
			user.setName(rs.getString(4)) ;
			user.setStu_num(rs.getString(5)) ;
			user.setPhone(rs.getString(6)) ;
			user.setImg(rs.getString(8)) ;
			user.setMessnum(rs.getInt(7)) ;
		}
		rs.close();this.pstmt.close();
		return user ;
	}
	public User findByEmail(String str) throws Exception{
		User user = null ;
		String sql = "SELECT id,email,pwd,name,stu_num,phone,mess_num,img FROM user WHERE email=?" ;
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
			user.setPhone(rs.getString(6)) ;
			user.setImg(rs.getString(8)) ;
			user.setMessnum(rs.getInt(7)) ;
		}
		rs.close();this.pstmt.close();
		return user ;
	}
	
	public void close(){
		if(this.conn != null){
			try{
				this.conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}