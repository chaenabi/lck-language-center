package user;

import java.sql.Date;

public class UserVO {

	// this column is applied as autoIncrement property
	//private int userId; //관리자 아이디
	
	private String name; // 관리자명
	private String phone; // 관리자전화번호
	private String position; //관리자직급
	private String address; //관리자주소
	private String identityPhoto; //관리자식별사진
	private Date regDate; // 가입일자
	
//	public int getUserId() {
//		return userId;
//	}
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}
	
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
		return "UserVO [name=" + name + ", phone=" + phone + ", position=" + position + ", address=" + address
				+ ", identityPhoto=" + identityPhoto + ", regDate=" + regDate + "]";
	}
}
