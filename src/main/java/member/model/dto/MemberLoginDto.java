package member.model.dto;

public class MemberLoginDto {
//	MEMBER_ID      NOT NULL VARCHAR2(15)  
//	MEMBER_ADMIN   NOT NULL NUMBER(1)     
//	MEMBER_NAME    NOT NULL VARCHAR2(10)  
//	MEMBER_PWD     NOT NULL VARCHAR2(20)  
//	MEMBER_EMAIL   NOT NULL VARCHAR2(20)  
//	MEMBER_ADDRESS NOT NULL VARCHAR2(100) 
//	LOG_STATUS     NOT NULL NUMBER(1) 
	private String mem_id;
	private String mem_pwd;
	
	public MemberLoginDto() {
		super();
	}
		
	public MemberLoginDto(String mem_id, String mem_pwd) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
	}

	@Override
	public String toString() {
		return "MemberLoginDto [mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + "]";
	}

	public String getMem_id() {
		return mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	
	

}
