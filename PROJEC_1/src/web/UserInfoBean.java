package web;

public class UserInfoBean {
	private String id;
	private String password;
	private String name;
	private String major;
	private String majorNum;
	
	public UserInfoBean(){
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getMajorNum() {
		return majorNum;
	}
	public void setMajorNum(String majorNum) {
		this.majorNum = majorNum;
	}
}