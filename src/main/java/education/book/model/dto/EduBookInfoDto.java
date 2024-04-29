package education.book.model.dto;

public class EduBookInfoDto {
	private String eduSubject;
	private String eduPartName;
	private Integer eduPartNum;

	@Override
	public String toString() {
		return "EduBookInfoDto [eduSubject=" + eduSubject + ", eduPartName=" + eduPartName + ", eduPartNum="
				+ eduPartNum + "]";
	}

	public EduBookInfoDto(String eduSubject, String eduPartName, Integer eduPartNum) {
		super();
		this.eduSubject = eduSubject;
		this.eduPartName = eduPartName;
		this.eduPartNum = eduPartNum;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getEduPartName() {
		return eduPartName;
	}

	public Integer getEduPartNum() {
		return eduPartNum;
	}

}
