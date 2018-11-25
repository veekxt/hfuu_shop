package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import src.dbc.DatabaseConnection;
import src.vo.*;

public class OrderHandle {
    private Connection conn = null;
    private PreparedStatement pstmt = null;

    public OrderHandle() {
        try {
            this.conn = new DatabaseConnection().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean doCreate(Order order) throws Exception {
        boolean flag = false;
        String sql = "INSERT INTO `order`(id,goods_id,user_id,date,message) VALUES (?,?,?,?,?)";
        Integer maxId=0;
        try {
            ResultSet max_id=this.conn.prepareStatement("select max(id) from `order`").executeQuery();
            if(max_id.next())
            	{
            		maxId=max_id.getInt("max(id)");
            	}
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1,1+maxId);
        this.pstmt.setInt(2,order.getGoodsId());
        this.pstmt.setInt(3,order.getUserId());
        java.sql.Timestamp dateTime = new java.sql.Timestamp(order.getDate().getTime());
        pstmt.setTimestamp(4, dateTime);
        pstmt.setString(5, order.getMessage());
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
       
        this.pstmt.close();
        return flag;
    }
    
    public List<Goods> findGoodsByUser(User user) throws Exception{
        int userId=user.getId();
        List<Goods> all = new ArrayList<Goods>();
        String sql = "select id,num,content,type_id,image,producter_id,price,create_date,name from `goods` where id=any(SELECT goods_id from `order`  where user_id=?)";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1,userId);
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
            all.add(good);
        }
        rs.close();this.pstmt.close();
        return all;
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
