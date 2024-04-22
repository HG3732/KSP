package education.model.dto;

public class EduFileDto {
//	EDU_FILE_ID            NOT NULL NUMBER         
//	EDU_ID                 NOT NULL NUMBER         
//	EDU_FILE_PATH          NOT NULL VARCHAR2(1000) 
//	EDU_ORIGINAL_FILE_NAME NOT NULL VARCHAR2(300)
	private Integer eduFileId;
	private Integer eduId;
	private String eduFilePath;
	private String eduOriginalFileName;

	@Override
	public String toString() {
		return "EduFileWriteDto [eduFileId=" + eduFileId + ", eduId=" + eduId + ", eduFilePath=" + eduFilePath
				+ ", eduOriginalFileName=" + eduOriginalFileName + "]";
	}

	public EduFileDto(Integer eduFileId, Integer eduId, String eduFilePath, String eduOriginalFileName) {
		super();
		this.eduFileId = eduFileId;
		this.eduId = eduId;
		this.eduFilePath = eduFilePath;
		this.eduOriginalFileName = eduOriginalFileName;
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

}
