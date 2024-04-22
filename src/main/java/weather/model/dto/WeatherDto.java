package weather.model.dto;

import java.io.Serializable;

public class WeatherDto implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String fcstDate;
    private String fcstHour;
    private String pty;
    private String sky;
    private Integer t1h;
	
    public WeatherDto() {
		super();
	}

	public WeatherDto(String fcstDate, String fcstHour, Integer t1h, String sky, String pty) {
		super();
		this.fcstDate = fcstDate;
		this.fcstHour = fcstHour;
		this.pty = pty;
		this.sky = sky;
		this.t1h = t1h;
	}

	@Override
	public String toString() {
		return "WeatherDto [fcstDate=" + fcstDate + ", fcstHour=" + fcstHour + ", pty=" + pty + ", sky=" + sky + ", t1h=" + t1h + "]";
	}

	public String getFcstDate() {
		return fcstDate;
	}

	public void setFcstDate(String fcstDate) {
		this.fcstDate = fcstDate;
	}

	public String getFcstHour() {
		return fcstHour;
	}

	public void setFcstHour(String fcstHour) {
		this.fcstHour = fcstHour;
	}

	public String getPty() {
		return pty;
	}

	public void setPty(String pty) {
		this.pty = pty;
	}

	public String getSky() {
		return sky;
	}

	public void setSky(String sky) {
		this.sky = sky;
	}

	public Integer getT1h() {
		return t1h;
	}

	public void setT1h(Integer t1h) {
		this.t1h = t1h;
	}

    
    
}
