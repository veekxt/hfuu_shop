package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
        String maxId="0";
        try {
            ResultSet max_id=this.conn.prepareStatement("select max(id) from order").executeQuery();
            if(max_id.next())maxId=max_id.getString("max(id)");
        } catch (Exception e) {
            // TODO: handle exception
        }
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1,1+Integer.parseInt(maxId));
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
}
