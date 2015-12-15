package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import src.dbc.DatabaseConnection;
import src.vo.Goods;

public class ShopHandle {
	private Connection conn = null;
    private PreparedStatement pstmt = null;

    public ShopHandle() {
        try {
            this.conn = new DatabaseConnection().getConnection();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public int findByUserId(int id) throws Exception {
    int i=0;
        String sql = "SELECT goodsId FROM ShoppingCart WHERE userId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, id);
        ResultSet rs = this.pstmt.executeQuery();
       while(rs.next()){
    	   i++;
       }
       return i;
    }
    public boolean doSaveShoppingCart( int goodsNum,int goodsId,int userId) throws Exception {
        boolean flag = false;
        String sql="select id from shoppingcart where goodsId="+goodsId;
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs = this.pstmt.executeQuery();
        if(rs.next()){
        	flag = false;
        	return flag;
        }
        sql = "INSERT INTO shoppingcart(id,goodsId,userId) VALUES (?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        pstmt.setInt(1, goodsNum);
        pstmt.setInt(2, goodsId);
        pstmt.setInt(3, userId);
      
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmt.close();
        return flag;
    }

}
