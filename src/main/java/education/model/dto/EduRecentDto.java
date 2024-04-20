package education.model.dto;

public class EduRecentDto {
	private String eduSubject;

	@Override
	public String toString() {
		return "EduRecentDto [eduSubject=" + eduSubject + "]\n";
	}

	public EduRecentDto(String eduSubject) {
		super();
		this.eduSubject = eduSubject;
	}

	public String getEduSubject() {
		return eduSubject;
	}

}
