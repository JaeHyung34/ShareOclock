package shareOclock.project;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


public class ProjectDTO {
	private int pro_seq;
	private String pro_title;
	private String pro_contents;
	private String pro_startDate;
	private String pro_endDate;

	public ProjectDTO(int pro_seq, String pro_title, String pro_contents, String pro_startDate, String pro_endDate) {
		super();
		this.pro_seq = pro_seq;
		this.pro_title = pro_title;
		this.pro_contents = pro_contents;
		this.pro_startDate = pro_startDate;
		this.pro_endDate = pro_endDate;

	}   

	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getPro_title() {
		return pro_title;
	}
	public void setPro_title(String pro_title) {
		this.pro_title = pro_title;
	}
	public String getPro_contents() {
		return pro_contents;
	}
	public void setPro_contents(String pro_contents) {
		this.pro_contents = pro_contents;
	}
	public String getPro_startDate() {
		return pro_startDate;
	}
	public void setPro_startDate(String pro_startDate) {
		this.pro_startDate = pro_startDate;
	}
	public String getPro_endDate() {
		return pro_endDate;
	}
	public void setPro_endDate(String pro_endDate) {
		this.pro_endDate = pro_endDate;
	}



}

