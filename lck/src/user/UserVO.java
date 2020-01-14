package user;

import java.sql.Date;

public class UserVO {

	// this column is applied as autoIncrement property
	//private int userId; //������ ���̵�
	
	private String name; // �����ڸ�
	private String phone; // ��������ȭ��ȣ
	private String position; //����������
	private String address; //�������ּ�
	private String identityPhoto; //�����ڽĺ�����
	private Date regDate; // ��������
	
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
