package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import src.dbc.DatabaseConnection;
import src.vo.Goods;
import src.vo.User;
public class ShopCartHandle {
	private Connection conn = null;
    private PreparedStatement pstmt = null;

    public ShopCartHandle() {
        try {
            this.conn = new DatabaseConnection().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取user购物车物品数量
    //不一致性标记：为什么用id作参数？
    public Integer getShopCartNum(int id) throws Exception {
        String sql = "SELECT count(goodsId) FROM ShoppingCart WHERE userId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, id);
        ResultSet rs = this.pstmt.executeQuery();
        if(rs.next()){
        	return rs.getInt(1);
        }else{
        	return 0;
        }
    }
    //增加一条购物车记录，goodsNum已废弃
    public boolean doSaveShoppingCart( int goodsNum,int goodsId,int userId) throws Exception {
        boolean flag = false;
        String sql="select id from shoppingcart where userId="+userId+" and goodsId="+goodsId;
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs = this.pstmt.executeQuery();
        if(rs.next()){
        	return false;
        }
        sql = "INSERT INTO shoppingcart(id,goodsId,userId) VALUES (?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        pstmt.setInt(1, goodsNum);
        pstmt.setInt(2, goodsId);
        pstmt.setInt(3, userId);
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        rs.close();this.pstmt.close();
        return flag;
    }
    //查找user所有购物车内物品
    public List<Goods> findGoodsByUser(User user) throws Exception{
        int userId=user.getId();
        List<Goods> all = new ArrayList<Goods>();
        String sql = "select id,num,content,type_id,image,producter_id,price,create_date,name from `goods` where id=any(SELECT goodsId from `shoppingcart`  where userId=?) order by create_date desc";
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
    //移除购物车的一个物品
    public boolean removeList(int goodId,int userId) throws Exception{
		Boolean flag=false;
		String sql="Delete from shoppingcart where goodsId=? and userId=?";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setInt(1, goodId);
	    pstmt.setInt(2,userId);
	    if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmt.close();
        return flag;
    } 
    //清空user的购物车
    public boolean removeAllByUser(User user) throws Exception{
		Boolean flag=false;
		String sql="Delete from shoppingcart where and userId=?";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setInt(1,user.getId());
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
