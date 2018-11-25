package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import src.tools.IntHolder;

import src.dbc.DatabaseConnection;
import src.vo.Goods;
import src.vo.User;
public class CollectHandle {
	private Connection conn = null;
    private PreparedStatement pstmt = null;
    public CollectHandle() {
        try {
            this.conn = new DatabaseConnection().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean doCreate(int user_id,int goods_id)  throws Exception{
    	boolean flag = false;
        String sql="select user_id from `collect` where user_id="+user_id+" and goods_id="+goods_id;
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs = this.pstmt.executeQuery();
        if(rs.next()){
        	//已经收藏过了，直接
        	return true;
        }
    	
    	sql="insert into `collect`(user_id,goods_id) values (?,?)";
    	this.pstmt = this.conn.prepareStatement(sql);
    	this.pstmt.setInt(1, user_id);
    	this.pstmt.setInt(2, goods_id);
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        rs.close();this.pstmt.close();
        return flag;
    }
    
  //查找user所有收藏夹内物品
    public List<Goods> findGoodsByUser(User user,IntHolder num,int limitMin,int perPage) throws Exception{
        int userId=user.getId();
        List<Goods> all = new ArrayList<Goods>();
        String sql = "select SQL_CALC_FOUND_ROWS id,num,content,type_id,image,producter_id,price,create_date,name,status from `goods` where id=any(SELECT goods_id from `collect`  where user_id=?) order by create_date desc limit ?,?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1,userId);
        this.pstmt.setInt(2,limitMin);
        this.pstmt.setInt(3,perPage);
        
        ResultSet rs = this.pstmt.executeQuery();
        while (rs.next()) {
            Goods good = new Goods();
            good.setId(rs.getInt(1));
            good.setNum(rs.getInt(2));
            good.setContent(rs.getString(3));
            good.setType_id(rs.getInt(4));
            good.setImage(rs.getString(5));
            good.setProducter_id(rs.getInt(6));
            good.setPrice(rs.getFloat(7));
            good.setName(rs.getString(9));
            java.sql.Timestamp timeStamp=rs.getTimestamp(8);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            good.setCreatDate(date);
            good.setStates(rs.getInt(10));
            all.add(good);
        }
        rs = this.pstmt.executeQuery("SELECT FOUND_ROWS()");
        if(rs.next()){
        	num.value=rs.getInt(1);
        }
        rs.close();this.pstmt.close();
        return all;
    }
    //移除一个收藏夹物品
    public boolean removeOneFromCollect(int goodsId,int userId) throws Exception{
		Boolean flag=false;
		String sql="Delete from `collect` where goods_id=? and user_id=?";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setInt(1, goodsId);
	    pstmt.setInt(2, userId);
	    if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmt.close();
        return flag;
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
