package education.model.dto;

public class EduBookDto {
	private String eduSubject;
	private String eduBookName;
	private String eduPartSchool;

	@Override
	public String toString() {
		return "EduBookDto [eduSubject=" + eduSubject + ", eduBookName=" + eduBookName + ", eduPartSchool="
				+ eduPartSchool + "]";
	}

	public EduBookDto(String eduSubject, String eduBookName, String eduPartSchool) {
		super();
		this.eduSubject = eduSubject;
		this.eduBookName = eduBookName;
		this.eduPartSchool = eduPartSchool;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getEduBookName() {
		return eduBookName;
	}

	public String getEduPartSchool() {
		return eduPartSchool;
	}

}
