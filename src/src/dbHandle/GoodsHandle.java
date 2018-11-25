package src.dbHandle;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import src.tools.IntHolder;
import src.dbc.DatabaseConnection;
import src.vo.Goods;

public class GoodsHandle {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    public GoodsHandle() {
        try {
            this.conn = new DatabaseConnection().getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Goods findById(int id) throws Exception {
        Goods goods = null;
        String sql = "SELECT id,image,type_id,name,num,price,status,content,producter_id,create_date FROM goods WHERE id=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, id);
        ResultSet rs = this.pstmt.executeQuery();
        if (rs.next()) {
            goods = new Goods();
            goods.setId(rs.getInt(1));
            goods.setImage(rs.getString(2));
            goods.setType_id(rs.getInt(3));
            goods.setName(rs.getString(4));
            goods.setNum(rs.getInt(5));
            goods.setPrice(rs.getFloat(6));
            goods.setStates(rs.getInt(7));
            goods.setContent(rs.getString(8));
            goods.setProducter_id(rs.getInt(9));
            java.sql.Timestamp timeStamp=rs.getTimestamp(10);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            goods.setCreatDate(date);
        }
        rs.close();this.pstmt.close();
        return goods;
    }

    public boolean doCreate(Goods good) throws Exception {
        boolean flag = false;
        String sql = "INSERT INTO `goods`(name,price,image,content,status,id,type_id,producter_id,create_date,num) VALUES (?,?,?,?,?,?,?,?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        pstmt.setString(1, good.getName());
        pstmt.setFloat(2, good.getPrice());
        pstmt.setString(3, good.getImage());
        pstmt.setString(4, good.getContent());
        pstmt.setInt(5, 1);
        pstmt.setInt(6, good.getId());
        pstmt.setInt(7, good.getType_id());
        pstmt.setInt(8, good.getProducter_id());
        java.sql.Timestamp dateTime = new java.sql.Timestamp(good.getCreatDate().getTime());
        pstmt.setTimestamp(9, dateTime);
        pstmt.setInt(10, good.getNum());
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmt.close();
        return flag;
    }

    public int getMaxId() throws Exception {
        ResultSet rs = this.conn.prepareStatement("select max(id) from goods").executeQuery();
        rs.next();
        int maxId = rs.getInt(1);
        return maxId;
    }

    public List<Goods> findAll(IntHolder num,int limitMin,int perPage) throws Exception {
        List<Goods> all = new ArrayList<Goods>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS id,num,content,type_id,image,producter_id,price,create_date,name from goods  where status=? order by create_date desc limit ?,?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, 2);
        this.pstmt.setInt(2, limitMin);
        this.pstmt.setInt(3, perPage);
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
        rs = this.pstmt.executeQuery("SELECT FOUND_ROWS()");
        if(rs.next()){
        	num.value=rs.getInt(1);
        }
        rs.close();this.pstmt.close();
        return all;
    }

    public List<Goods> findAllNotAuditing() throws Exception {
        List<Goods> all = new ArrayList<Goods>();
        String sql = "SELECT id,num,content,type_id,image,producter_id,price,name,create_date from goods where status=1";
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs = this.pstmt.executeQuery();
        Goods good = null;
        while (rs.next()) {
            good = new Goods();
            good.setId(rs.getInt(1));
            good.setNum(rs.getInt(2));
            good.setContent(rs.getString(3));
            good.setType_id(rs.getInt(4));
            good.setImage(rs.getString(5));
            good.setProducter_id(rs.getInt(6));
            good.setPrice(rs.getFloat(7));
            good.setName(rs.getString(8));
            java.sql.Timestamp timeStamp=rs.getTimestamp(9);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            good.setCreatDate(date);
            all.add(good);
        }
        rs.close();this.pstmt.close();
        return all;
    }

    public boolean doUpdate(Goods good) throws Exception {
        boolean flag = false;
        String sql = "update goods set id=?,image=?,type_id=?,name=?,num=?,price=?,status=?,content=?,producter_id=?,create_date=? where id=?";
        this.pstmt = this.conn.prepareStatement(sql);
        
        pstmt.setInt(1, good.getId());
        pstmt.setString(2, good.getImage());
        pstmt.setInt(3, good.getType_id());
        pstmt.setString(4, good.getName());
        pstmt.setInt(5, good.getNum());
        pstmt.setFloat(6, good.getPrice());
        pstmt.setInt(7, good.getStates());
        pstmt.setString(8, good.getContent());
        pstmt.setInt(9, good.getProducter_id());
        java.sql.Timestamp dateTime = new java.sql.Timestamp(good.getCreatDate().getTime());
        pstmt.setTimestamp(10, dateTime);
        pstmt.setInt(11, good.getId());
        if (this.pstmt.executeUpdate() > 0) {
            flag = true;
        }
        this.pstmt.close();
        return flag;
    }

    public List<Goods> findByCeta(int cetaId,IntHolder num,int limitMin,int perPage) throws Exception {
        List<Goods> all = new ArrayList<Goods>();
        String sql = "SELECT SQL_CALC_FOUND_ROWS id,num,content,type_id,image,producter_id,price,name,create_date from goods where status=2 and type_id="+cetaId+" order by create_date desc limit ?,?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setInt(1, limitMin);
        this.pstmt.setInt(2, perPage);
        ResultSet rs = this.pstmt.executeQuery();
        Goods good = null;
        while (rs.next()){
            good = new Goods();
            good.setId(rs.getInt(1));
            good.setNum(rs.getInt(2));
            good.setContent(rs.getString(3));
            good.setType_id(rs.getInt(4));
            good.setImage(rs.getString(5));
            good.setProducter_id(rs.getInt(6));
            good.setPrice(rs.getFloat(7));
            good.setName(rs.getString(8));
            java.sql.Timestamp timeStamp=rs.getTimestamp(9);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            good.setCreatDate(date);
            all.add(good);
        }
        rs = this.pstmt.executeQuery("SELECT FOUND_ROWS()");
        if(rs.next()){
        	num.value=rs.getInt(1);
        }
        rs.close();this.pstmt.close();
        return all;
    }
    
    public List<Goods> findByKey(String key) throws Exception {
        List<Goods> all = new ArrayList<Goods>();
        String sql = "SELECT id,num,content,type_id,image,producter_id,price,name,create_date from goods where status=2 and name like ? order by create_date desc";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, "%"+key+"%");
        ResultSet rs = this.pstmt.executeQuery();
        Goods good = null;
        while (rs.next()){
            good = new Goods();
            good.setId(rs.getInt(1));
            good.setNum(rs.getInt(2));
            good.setContent(rs.getString(3));
            good.setType_id(rs.getInt(4));
            good.setImage(rs.getString(5));
            good.setProducter_id(rs.getInt(6));
            good.setPrice(rs.getFloat(7));
            good.setName(rs.getString(8));
            java.sql.Timestamp timeStamp=rs.getTimestamp(9);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            good.setCreatDate(date);
            all.add(good);
        }
        rs.close();this.pstmt.close();
        return all;
    }
    
    public List<Goods> findByUserId(int userId) throws Exception {
        List<Goods> all = new ArrayList<Goods>();
        String sql = "SELECT id,num,content,type_id,image,producter_id,price,name,create_date,status from goods where (status=2 or status=4) and producter_id="+userId+" order by create_date desc";
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs = this.pstmt.executeQuery();
        Goods good = null;
        while (rs.next()){
            good = new Goods();
            good.setId(rs.getInt(1));
            good.setNum(rs.getInt(2));
            good.setContent(rs.getString(3));
            good.setType_id(rs.getInt(4));
            good.setImage(rs.getString(5));
            good.setProducter_id(rs.getInt(6));
            good.setPrice(rs.getFloat(7));
            good.setName(rs.getString(8));
            java.sql.Timestamp timeStamp=rs.getTimestamp(9);
            java.util.Date date=new  java.util.Date(timeStamp.getTime());
            good.setCreatDate(date);
            good.setStates(rs.getInt(10));
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
