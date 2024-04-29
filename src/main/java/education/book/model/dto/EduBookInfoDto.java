package education.book.model.dto;

public class EduBookInfoDto {
	private String eduSubject;
	private String eduAddress;
	private String eduPartName;
	private Integer eduPartNum;

	@Override
	public String toString() {
		return "EduBookInfoDto [eduSubject=" + eduSubject + ", eduAddress=" + eduAddress + ", eduPartName="
				+ eduPartName + ", eduPartNum=" + eduPartNum + "]";
	}

	public EduBookInfoDto(String eduSubject, String eduAddress, String eduPartName, Integer eduPartNum) {
		super();
		this.eduSubject = eduSubject;
		this.eduAddress = eduAddress;
		this.eduPartName = eduPartName;
		this.eduPartNum = eduPartNum;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getEduAddress() {
		return eduAddress;
	}

	public String getEduPartName() {
		return eduPartName;
	}

	public Integer getEduPartNum() {
		return eduPartNum;
	}

}
