package shareOclock.message;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import configuration.Configuration;

public class MessageDTO {
	private int message_seq;
	private String message_sender;
	private String message_receiver;
	private String message_contents;
	private Timestamp message_time;
	private String message_read;

	public MessageDTO() {
		super();
	}


	public MessageDTO(String message_sender, String message_receiver, String message_contents) {
		super();
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_contents = message_contents;
	}

	public MessageDTO(int message_seq, String message_sender, String message_receiver, String message_contents,
			Timestamp message_time, String message_read) {
		super();
		this.message_seq = message_seq;
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_contents = message_contents;
		this.message_time = message_time;
		this.message_read = message_read;
	}


	public int getMessage_seq() {
		return message_seq;
	}


	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}


	public String getMessage_sender() {
		return message_sender;
	}


	public void setMessage_sender(String message_sender) {
		this.message_sender = message_sender;
	}


	public String getMessage_receiver() {
		return message_receiver;
	}


	public void setMessage_receiver(String message_receiver) {
		this.message_receiver = message_receiver;
	}


	public String getMessage_contents() {
		if (this.message_contents.length() > 99)
			return this.message_contents.substring(0, 100) + "...";
		return message_contents;
	}

	public String getMessage_mContents() {
		if (this.message_contents.length() > 19)
			return this.message_contents.substring(0, 20) + "...";
		return this.message_contents;
	}

	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}


	public String getMessage_time() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
		return sdf.format(this.message_time);
	}


	public void setMessage_time(Timestamp message_time) {
		this.message_time = message_time;
	}


	public String getMessage_mTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM.dd hh:mm");
		return sdf.format(this.message_time);
	}
	public String getMessage_read() {
		return message_read;
	}


	public void setMessage_read(String message_read) {
		this.message_read = message_read;
	}

	
	

	public static void main(String[] args) {

		int articlesPerPage = 10;
		int naviPerPage = 10;
		int totalArticles = 999;
		int entryPage = 10;

		int totalPage = totalArticles / articlesPerPage;
		if (totalArticles % articlesPerPage != 0)
			totalPage += 1;

		if (entryPage > totalPage)
			entryPage = totalPage;
		if (entryPage < 1) 
			entryPage = 1;

		int startNavi = (entryPage - 1) / 10 * naviPerPage + 1;
		int lastNavi = startNavi + naviPerPage - 1;

		StringBuilder sb = new StringBuilder();
		if (startNavi != 1)
			sb.append("< ");
		for (int i = startNavi; i <= lastNavi; i++) {
			sb.append(i + " ");
		}
		if (lastNavi != totalPage)
			sb.append(">");
		System.out.println(sb);
	}
}

