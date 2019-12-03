package shareOclock.task;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TaskDTO {
	private int pt_seq;
	private int pro_seq;
	private String pt_writer;
	private String pt_priority;
	private String pt_title;
	private String pt_contents;
	private String pt_startDate;
	private String pt_endDate;
	
	public TaskDTO() {};
	public TaskDTO(int pt_seq, int pro_seq, String pt_writer, String pt_priority, String pt_title, String pt_contents,
			String pt_startDate, String pt_endDate) {
		super();
		this.pt_seq = pt_seq;
		this.pro_seq = pro_seq;
		this.pt_writer = pt_writer;
		this.pt_priority = pt_priority;
		this.pt_title = pt_title;
		this.pt_contents = pt_contents;
		this.pt_startDate = pt_startDate;
		this.pt_endDate = pt_endDate;
	}
	
	public int getPt_seq() {
		return pt_seq;
	}
	public void setPt_seq(int pt_seq) {
		this.pt_seq = pt_seq;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getPt_writer() {
		return pt_writer;
	}
	public void setPt_writer(String pt_writer) {
		this.pt_writer = pt_writer;
	}
	public String getPt_priority() {
		return pt_priority;
	}
	public void setPt_priority(String pt_priority) {
		this.pt_priority = pt_priority;
	}
	public String getPt_title() {
		return pt_title;
	}
	public void setPt_title(String pt_title) {
		this.pt_title = pt_title;
	}
	public String getPt_contents() {
		return pt_contents;
	}
	public void setPt_contents(String pt_contents) {
		this.pt_contents = pt_contents;
	}
	public String getPt_startDate() {
		return pt_startDate;
	}
	public void setPt_startDate(String pt_startDate) {
		this.pt_startDate = pt_startDate;
	}
	public String getPt_endDate() {
		return pt_endDate;
	}
	public void setPt_endDate(String pt_endDate) {
		this.pt_endDate = pt_endDate;
	}
}
