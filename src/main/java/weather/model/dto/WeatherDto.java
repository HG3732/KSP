package weather.model.dto;

public class WeatherDto {
	
	private String date;
    private String time;
    private double pty;
    private double sky;
    private double t1h;
	
    public WeatherDto() {
		super();
	}

	public WeatherDto(String date, String time, double pty, double sky, double t1h) {
		super();
		this.date = date;
		this.time = time;
		this.pty = pty;
		this.sky = sky;
		this.t1h = t1h;
	}

	@Override
	public String toString() {
		return "WeatherDto [date=" + date + ", time=" + time + ", pty=" + pty + ", sky=" + sky + ", t1h=" + t1h + "]";
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getPty() {
		return pty;
	}

	public void setPty(double pty) {
		this.pty = pty;
	}

	public double getSky() {
		return sky;
	}

	public void setSky(double sky) {
		this.sky = sky;
	}

	public double getT1h() {
		return t1h;
	}

	public void setT1h(double t1h) {
		this.t1h = t1h;
	}

    
    
}
