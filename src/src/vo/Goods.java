package src.vo;

import java.util.Date;

public class Goods {
	private Integer id;
	private String image;
	private Integer type_id;//商品类型id
	private String name;
	private Integer num;//数量
	private Float price;
	private String content;//
	private Integer producter_id;
	private Integer states;
	private Date creatDate;
	public Date getCreatDate() {
		return creatDate;
	}
	public void setCreatDate(Date creatDate) {
		this.creatDate = creatDate;
	}
	public Integer getId() {
		return id;
	}
	public Integer getStates() {
		return states;
	}
	public void setStates(Integer states) {
		this.states = states;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String  getImage() {
		return image;
	}
	public void setImage(String  image) {
		this.image = image;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getProducter_id() {
		return producter_id;
	}
	public void setProducter_id(Integer producter_id) {
		this.producter_id = producter_id;
	}

}

