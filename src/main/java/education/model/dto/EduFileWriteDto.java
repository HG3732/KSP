package education.model.dto;

public class EduFileWriteDto {
	private String eduFilePath;
	private String eduOriginalFileName;

	@Override
	public String toString() {
		return "EduFileWriteDto [eduFilePath=" + eduFilePath + ", eduOriginalFileName=" + eduOriginalFileName + "]";
	}

	public EduFileWriteDto(String eduFilePath, String eduOriginalFileName) {
		super();
		this.eduFilePath = eduFilePath;
		this.eduOriginalFileName = eduOriginalFileName;
	}

	public String getEduFilePath() {
		return eduFilePath;
	}

	public String getEduOriginalFileName() {
		return eduOriginalFileName;
	}

}
