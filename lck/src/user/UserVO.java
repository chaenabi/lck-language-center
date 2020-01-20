package user;

import java.sql.Date;

public class UserVO {

	// this column is applied as autoIncrement property
	private int userId;
	private static UserVO single_instance = null;

	private String name; // manager name
	private String password; // manager password
	private String phone = "+82 10"; // manager connector
	private String phonemid; // middle telnumber
	private String phoneend; // last telnumber
	private String position; // what work manager do
	private String address; // manager address
	private String identityPhoto; // manager identifying photo
	private Date regDate; // register date
	
	public static UserVO getInstance() {
		 if(single_instance == null) {
	            single_instance = new UserVO();
	        }

		return single_instance;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPhonemid() {
		return phonemid;
	}
	public void setPhonemid(String phonemid) {
		this.phonemid = phonemid;
	}
	public String getPhoneend() {
		return phoneend;
	}
	public void setPhoneend(String phoneend) {
		this.phoneend = phoneend;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdentityPhoto() {
		return identityPhoto;
	}
	public void setIdentityPhoto(String identityPhoto) {
		this.identityPhoto = identityPhoto;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "UserVO [name=" + name + ", password=" + password + ", phone=" + phone + ", phonemid=" + phonemid
				+ ", phoneend=" + phoneend + ", position=" + position + ", address=" + address + ", identityPhoto="
				+ identityPhoto + ", regDate=" + regDate + "]";
	}
	
	
	
}
