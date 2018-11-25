package src.vo;

public class User {
	private int id;
	private String email;
	private String pwd;
	private String name;
	private String stu_num;
	private String qq;
	private String phone;
	private String img;
	public String getImg() {
		String userImg=img;
		if(userImg==null || userImg.length()==0){
			return "static/user_img/0";
		}else{
			return userImg;
		}
	}

	public void setImg(String img) {
		this.img = img;
	}

	private int messnum;
	

    public int getMessnum() {
        return messnum;
    }

    public void setMessnum(int messnum) {
        this.messnum = messnum;
    }

    public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setName(String tmp) {
		name = tmp;
	}

	public void setEmail(String tmp) {
		email = tmp;
	}

	public void setId(int tmp) {
		id = tmp;
	}

	public void setPwd(String tmp) {
		pwd = tmp;
	}

	public void setStu_num(String tmp) {
		stu_num = tmp;
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getPwd() {
		return pwd;
	}

	public int getId() {
		return id;
	}

	public String getStu_num() {
		return stu_num;
	}

}
