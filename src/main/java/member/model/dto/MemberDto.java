package member.model.dto;

public class MemberDto {
//	MEMBER_ID      NOT NULL VARCHAR2(15)  
//	MEMBER_ADMIN   NOT NULL NUMBER(1)     
//	MEMBER_NAME    NOT NULL VARCHAR2(10)  
//	MEMBER_PWD     NOT NULL VARCHAR2(20)  
//	MEMBER_EMAIL   NOT NULL VARCHAR2(20)  
//	MEMBER_ADDRESS NOT NULL VARCHAR2(100) 
//	LOG_STATUS     NOT NULL NUMBER(1) 
	private String mem_id;
	private int mem_admin;
	private String mem_name;
	private String mem_pwd;
	private String mem_email;
	private String mem_address;
	private Integer memFailCnt;
	private String thumbnail;

	
	public MemberDto() {
		super();
	}
	
	

	public MemberDto(String mem_id, String thumbnail) {
		super();
		this.mem_id = mem_id;
		this.thumbnail = thumbnail;
	}

	public MemberDto(String mem_id, int mem_admin, String mem_name, String mem_pwd, String mem_email,
			String mem_address, Integer memFailCnt) {
		super();
		this.mem_id = mem_id;
		this.mem_admin = mem_admin;
		this.mem_name = mem_name;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_address = mem_address;
		this.memFailCnt = memFailCnt;
	}

	@Override
	public String toString() {
		return "MemberDto [mem_id=" + mem_id + ", mem_admin=" + mem_admin + ", mem_name=" + mem_name + ", mem_pwd="
				+ mem_pwd + ", mem_email=" + mem_email + ", mem_address=" + mem_address + ", memFailCnt="
				+ memFailCnt + "]";
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getMem_admin() {
		return mem_admin;
	}

	public void setMem_admin(int mem_admin) {
		this.mem_admin = mem_admin;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public Integer getMemFailCnt() {
		return memFailCnt;
	}

	public void setMemFailCnt(Integer memFailCnt) {
		this.memFailCnt = memFailCnt;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
}
