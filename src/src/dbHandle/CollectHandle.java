package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
        this.pstmt.close();
        return flag;
    }
}
