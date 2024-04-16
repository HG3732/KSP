package education.model.dto;

public class EduBookDto {
//	EDU_BOOK_ID     NOT NULL VARCHAR2(15) 
//	EDU_ID          NOT NULL NUMBER       
//	EDU_BOOK_PHONE  NOT NULL VARCHAR2(11) 
//	EDU_PART_LEVEL  NOT NULL VARCHAR2(10) 
//	EDU_PART_NAME   NOT NULL VARCHAR2(10) 
//	EDU_PART_SCHOOL NOT NULL VARCHAR2(30)
	private String eduBookId;
	private Integer eduId;
	private String eduBookPhone;
	private String eduPartLevel;
	private String eduPartName;
	private String eduPartSchool;

	@Override
	public String toString() {
		return "EduBookDto [eduBookId=" + eduBookId + ", eduId=" + eduId + ", eduBookPhone=" + eduBookPhone
				+ ", eduPartLevel=" + eduPartLevel + ", eduPartName=" + eduPartName + ", eduPartSchool=" + eduPartSchool
				+ "]";
	}

	public EduBookDto(String eduBookId, Integer eduId, String eduBookPhone, String eduPartLevel, String eduPartName,
			String eduPartSchool) {
		super();
		this.eduBookId = eduBookId;
		this.eduId = eduId;
		this.eduBookPhone = eduBookPhone;
		this.eduPartLevel = eduPartLevel;
		this.eduPartName = eduPartName;
		this.eduPartSchool = eduPartSchool;
	}

	public String getEduBookId() {
		return eduBookId;
	}

	public Integer getEduId() {
		return eduId;
	}

	public String getEduBookPhone() {
		return eduBookPhone;
	}

	public String getEduPartLevel() {
		return eduPartLevel;
	}

	public String getEduPartName() {
		return eduPartName;
	}

	public String getEduPartSchool() {
		return eduPartSchool;
	}

}
