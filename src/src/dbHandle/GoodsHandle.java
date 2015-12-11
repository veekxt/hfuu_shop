package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
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
		
		String sql = "INSERT INTO goods(name,price,image,content,status,id,type_id,producter_id,create_date) VALUES (?,?,?,?,?,?,?,?,?)" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		pstmt.setString(1,good.getName());
		pstmt.setFloat(2,good.getPrice());
		pstmt.setString(3, good.getImage());
		pstmt.setString(4, good.getContent());
		pstmt.setInt(5, 1);
		pstmt.setInt(6, good.getId());
		pstmt.setInt(7, good.getType_id());
		pstmt.setInt(8, good.getProducter_id());
		//Date date=new Date (good.getCreatDate().getTime());
		java.sql.Timestamp dateTime = new java.sql.Timestamp(good.getCreatDate().getTime());
		pstmt.setTimestamp(9,dateTime);
		
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
	public List<Goods> findUnchecked() throws Exception{
		List<Goods> all = new ArrayList<Goods>() ;
		String sql = "SELECT  name,num,content,type_id,image,producter_id,price,create_date from goods a where status=?LEFT JOIN user b ON a.producter_id = b.id" ;
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
	        good.setCreatDate((java.util.Date)rs.getDate(8));
			all.add(good) ;
		}
		this.pstmt.close() ;
		return all ;
	}
	public List<Goods> findAll() throws Exception{
		List<Goods> all= new ArrayList<Goods>() ;
		String sql = "SELECT id,num,content,type_id,image,producter_id,price,create_date,name from goods  where status=?" ;
		this.pstmt = this.conn.prepareStatement(sql) ;
		this.pstmt.setInt(1, 2);
	
		ResultSet rs = this.pstmt.executeQuery() ;
		
		while(rs.next()){
			
			Goods good = new Goods() ;
			good.setId(rs.getInt(1)) ;
	        good.setNum(rs.getInt(2));
	        good.setContent(rs.getString(3));
	        good.setType_id(rs.getInt(4));
	        good.setImage(rs.getString(5));
	        good.setProducter_id(rs.getInt(6));
	        good.setPrice(rs.getFloat(7));
	      
	     java.util.Date date= new java.util.Date (rs.getDate(8).getTime());
	     good.setName(rs.getString(9));
	        good.setCreatDate(date);
			all.add(good) ;
		}
		this.pstmt.close() ;
		return all;
	}
}
