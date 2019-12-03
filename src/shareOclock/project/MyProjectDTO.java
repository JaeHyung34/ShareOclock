package shareOclock.project;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MyProjectDTO {
	private int myPro_seq;
	private String myPro_header;
	private String myPro_title;
	private String myPro_contents;
	private int myPro_count;
	private String myPro_startDate;
	private String myPro_endDate;
	
	public MyProjectDTO(int myPro_seq, String myPro_header, String myPro_title, String myPro_contents, int myPro_count,
			String myPro_startDate, String myPro_endDate) {
		super();
		this.myPro_seq = myPro_seq;
		this.myPro_header = myPro_header;
		this.myPro_title = myPro_title;
		this.myPro_contents = myPro_contents;
		this.myPro_count = myPro_count;
		this.myPro_startDate = myPro_startDate;
		this.myPro_endDate = myPro_endDate;
	}
	
	public int getMyPro_seq() {
		return myPro_seq;
	}
	public void setMyPro_seq(int myPro_seq) {
		this.myPro_seq = myPro_seq;
	}
	public String getMyPro_header() {
		return myPro_header;
	}
	public void setMyPro_header(String myPro_header) {
		this.myPro_header = myPro_header;
	}
	public String getMyPro_title() {
		return myPro_title;
	}
	public void setMyPro_title(String myPro_title) {
		this.myPro_title = myPro_title;
	}
	public String getMyPro_contents() {
		return myPro_contents;
	}
	public void setMyPro_contents(String myPro_contents) {
		this.myPro_contents = myPro_contents;
	}
	public int getMyPro_count() {
		return myPro_count;
	}
	public void setMyPro_count(int myPro_count) {
		this.myPro_count = myPro_count;
	}
	public String getMyPro_startDate() {
		return myPro_startDate;
	}
	public void setMyPro_startDate(String myPro_startDate) {
		this.myPro_startDate = myPro_startDate;
	}
	public String getMyPro_endDate() {
		return myPro_endDate;
	}
	public void setMyPro_endDate(String myPro_endDate) {
		this.myPro_endDate = myPro_endDate;
	}
}
