package education.model.dto;

public class EduFileWriteDto {
	private String eduFilePath;
	private String eduOriginalFileName;
	private String eduSavedFileName;

	@Override
	public String toString() {
		return "EduFileWriteDto [eduFilePath=" + eduFilePath + ", eduOriginalFileName=" + eduOriginalFileName
				+ ", eduSavedFileName=" + eduSavedFileName + "]";
	}

	public EduFileWriteDto(String eduFilePath, String eduOriginalFileName, String eduSavedFileName) {
		super();
		this.eduFilePath = eduFilePath;
		this.eduOriginalFileName = eduOriginalFileName;
		this.eduSavedFileName = eduSavedFileName;
	}

	public String getEduFilePath() {
		return eduFilePath;
	}

	public String getEduOriginalFileName() {
		return eduOriginalFileName;
	}

	public String getEduSavedFileName() {
		return eduSavedFileName;
	}

}
