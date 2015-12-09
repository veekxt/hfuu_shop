package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import src.dbc.DatabaseConnection;
import src.vo.Goods;


public class GoodsHandle {
	private Connection conn = null;
	private PreparedStatement pstmt = null ;
	public GoodsHandle(){
		try {
			this.conn=new DatabaseConnection().getConnection();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public boolean doCreateGoods(Goods good) throws Exception{
		boolean flag = false ;
		
		String sql = "INSERT INTO goods(name,num,image,content,status,id) VALUES (?,?,?,?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		pstmt.setString(1,good.getName());
		pstmt.setInt(2,good.getNum());
		pstmt.setString(3, good.getImage());
		pstmt.setString(4, good.getContent());
		pstmt.setInt(5, 1);
		pstmt.setInt(6, good.getId());
		if(this.pstmt.executeUpdate()> 0){
			flag = true ;
		}
		this.pstmt.close() ;
		return flag ;
	}
	public int getMaxId()throws Exception{
		ResultSet rs=this.conn.prepareStatement("select max(id) from goods").executeQuery();
		rs.next();
	     int maxId=rs.getInt(1);
		
		return maxId;
		
		
		
		
	}
	public List<Goods> findAll() throws Exception{
		List<Goods> all = new ArrayList<Goods>() ;
		String sql = "SELECT name,num,content,type_id,image,producter_id,price from goods where status=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1, 1);
	
		ResultSet rs = this.pstmt.executeQuery() ;
		Goods good = null ;
		while(rs.next()){
			good = new Goods() ;
			good.setId(rs.getInt(1)) ;
	        good.setNum(rs.getInt(2));
	        good.setContent(rs.getString(3));
	        good.setType_id(rs.getInt(4));
	        good.setImage(rs.getString(5));
	        good.setProducter_id(rs.getInt(6));
	        good.setPrice(rs.getFloat(7));
			all.add(good) ;
		}
		this.pstmt.close() ;
		return all ;
	}
}
