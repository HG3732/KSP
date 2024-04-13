package education.model.dto;

import java.io.Serializable;

public class EduDetailDto implements Serializable {
	/**
		 * 
		 */
	private static final long serialVersionUID = -6527696574201753695L;
//	EDU_ID          NOT NULL NUMBER         
//	EDU_SUBJECT     NOT NULL VARCHAR2(100)  
//	EDU_CONTENT     NOT NULL VARCHAR2(4000) 
//	EDU_ADDRESS     NOT NULL VARCHAR2(300)  
//	EDU_PARTICIPANT NOT NULL VARCHAR2(30)   
//	EDU_DAY         NOT NULL VARCHAR2(6)    
//	EDU_MONTH       NOT NULL VARCHAR2(7)    
//	EDU_BOOK_START  NOT NULL DATE           
//	EDU_BOOK_END    NOT NULL DATE           
//	EDU_START       NOT NULL DATE           
//	EDU_END         NOT NULL DATE           
//	EDU_WRITE_TIME  NOT NULL TIMESTAMP(6)  
	private int eduId;
	private String eduSubject;
	private String eduParticipant;
	private String eduBookStart;
	private String eduBookEnd;
	private String eduStart;
	private String eduEnd;
	private String eduWriteTime;

	@Override
	public String toString() {
		return "EduListDto [eduId=" + eduId + ", eduSubject=" + eduSubject + ", eduParticipant=" + eduParticipant
				+ ", eduBookStart=" + eduBookStart + ", eduBookEnd=" + eduBookEnd + ", eduStart=" + eduStart
				+ ", eduEnd=" + eduEnd + ", eduWriteTime=" + eduWriteTime + "]";
	}

	public EduDetailDto(int eduId, String eduSubject, String eduParticipant, String eduBookStart, String eduBookEnd,
			String eduStart, String eduEnd, String eduWriteTime) {
		super();
		this.eduId = eduId;
		this.eduSubject = eduSubject;
		this.eduParticipant = eduParticipant;
		this.eduBookStart = eduBookStart;
		this.eduBookEnd = eduBookEnd;
		this.eduStart = eduStart;
		this.eduEnd = eduEnd;
		this.eduWriteTime = eduWriteTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getEduId() {
		return eduId;
	}

	public String getEduSubject() {
		return eduSubject;
	}

	public String getEduParticipant() {
		return eduParticipant;
	}

	public String getEduBookStart() {
		return eduBookStart;
	}

	public String getEduBookEnd() {
		return eduBookEnd;
	}

	public String getEduStart() {
		return eduStart;
	}

	public String getEduEnd() {
		return eduEnd;
	}

	public String getEduWriteTime() {
		return eduWriteTime;
	}

}
