package education.model.dto;

public class EduBookDto {
	private String eduSubject;
	private String eduBookName;
	private String eduPartSchool;
	private String eduStart;
	private String eduEnd;

	@Override
	public String toString() {
		return "EduBookDto [eduSubject=" + eduSubject + ", eduBookName=" + eduBookName + ", eduPartSchool="
				+ eduPartSchool + ", eduStart=" + eduStart + ", eduEnd=" + eduEnd + "]";
	}

	public EduBookDto(String eduSubject, String eduBookName, String eduPartSchool, String eduStart, String eduEnd) {
		super();
		this.eduSubject = eduSubject;
		this.eduBookName = eduBookName;
		this.eduPartSchool = eduPartSchool;
		this.eduStart = eduStart;
		this.eduEnd = eduEnd;
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

	public String getEduStart() {
		return eduStart;
	}

	public String getEduEnd() {
		return eduEnd;
	}

}
