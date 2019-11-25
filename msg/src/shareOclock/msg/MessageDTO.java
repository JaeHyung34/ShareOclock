package shareOclock.msg;

import java.sql.Timestamp;

public class MessageDTO {
	private int message_seq;
	private String message_sender;
	private String message_receiver;
	private String message_contents;
	private Timestamp message_time;


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
			Timestamp message_time) {
		super();
		this.message_seq = message_seq;
		this.message_sender = message_sender;
		this.message_receiver = message_receiver;
		this.message_contents = message_contents;
		this.message_time = message_time;
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
		return message_contents;
	}


	public void setMessage_contents(String message_contents) {
		this.message_contents = message_contents;
	}


	public Timestamp getMessage_time() {
		return message_time;
	}


	public void setMessage_time(Timestamp message_time) {
		this.message_time = message_time;
	}
	 
}
