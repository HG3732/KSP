package education.model.dto;

public class EduFileDto {
	private Integer eduFileId;
	private Integer eduId;
	private String eduFilePath;
	private String eduOriginalFileName;
	private Integer eduFileSize;

	@Override
	public String toString() {
		return "EduFileDto [eduFileId=" + eduFileId + ", eduId=" + eduId + ", eduFilePath=" + eduFilePath
				+ ", eduOriginalFileName=" + eduOriginalFileName + ", eduFileSize=" + eduFileSize + "]";
	}

	public EduFileDto(Integer eduFileId, Integer eduId, String eduFilePath, String eduOriginalFileName, Integer eduFileSize) {
		super();
		this.eduFileId = eduFileId;
		this.eduId = eduId;
		this.eduFilePath = eduFilePath;
		this.eduOriginalFileName = eduOriginalFileName;
		this.eduFileSize = eduFileSize;
	}

	public Integer getEduFileId() {
		return eduFileId;
	}

	public Integer getEduId() {
		return eduId;
	}

	public String getEduFilePath() {
		return eduFilePath;
	}

	public String getEduOriginalFileName() {
		return eduOriginalFileName;
	}

	public Integer getEduFileSize() {
		return eduFileSize;
	}

}
