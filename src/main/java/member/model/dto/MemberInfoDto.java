package member.model.dto;

public class MemberInfoDto {
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
	private String mem_email;
	private String mem_address;
	
	@Override
	public String toString() {
		return "MemberInfoDto [mem_id=" + mem_id + ", mem_admin=" + mem_admin + ", mem_name=" + mem_name
				+ ", mem_email=" + mem_email + ", mem_address=" + mem_address + "]";
	}
	
	
	public MemberInfoDto(String mem_id, int mem_admin, String mem_name, String mem_email, String mem_address) {
		super();
		this.mem_id = mem_id;
		this.mem_admin = mem_admin;
		this.mem_name = mem_name;
		this.mem_email = mem_email;
		this.mem_address = mem_address;
	}

	public String getMem_id() {
		return mem_id;
	}

	public int getMem_admin() {
		return mem_admin;
	}

	public String getMem_name() {
		return mem_name;
	}

	public String getMem_email() {
		return mem_email;
	}

	public String getMem_address() {
		return mem_address;
	}
	
}
