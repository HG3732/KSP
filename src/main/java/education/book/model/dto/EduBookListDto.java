package education.book.model.dto;

public class EduBookListDto {
//	EDU_PART_SCHOOL NOT NULL VARCHAR2(30)
//	EDU_SUBJECT     NOT NULL VARCHAR2(15) 
//	MEMBER_NAME    NOT NULL VARCHAR2(10)  
//	EDU_ADDRESS     NOT NULL VARCHAR2(300) 
//	EDU_START       NOT NULL DATE           
//	EDU_END         NOT NULL DATE  
	private String eduPartSchool;
	private String eduSubject;
	private String memberName;
	private String eduAddress;
	private String eduStart;
	private String eduEnd;

	@Override
	public String toString() {
		return "EduBookListDto [eduPartSchool=" + eduPartSchool + ", eduSubject=" + eduSubject + ", memberName="
				+ memberName + ", eduAddress=" + eduAddress + ", eduStart=" + eduStart + ", eduEnd=" + eduEnd + "]";
	}

	public EduBookListDto(String eduPartSchool, String eduSubject, String memberName, String eduAddress,
			String eduStart, String eduEnd) {
		super();
		this.eduPartSchool = eduPartSchool;
		this.eduSubject = eduSubject;
		this.memberName = memberName;
		this.eduAddress = eduAddress;
		this.eduStart = eduStart;
		this.eduEnd = eduEnd;
	}

	public String getEduPartSchool() {
		return eduPartSchool;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getMemberName() {
		return memberName;
	}

	public String getEduAddress() {
		return eduAddress;
	}

	public String getEduStart() {
		return eduStart;
	}

	public String getEduEnd() {
		return eduEnd;
	}

}
