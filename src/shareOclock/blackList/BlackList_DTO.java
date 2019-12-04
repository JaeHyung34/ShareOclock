package shareOclock.blackList;

public class BlackList_DTO {
	private String bl_name;
	private String bl_reason;
	private String bl_email;

	public BlackList_DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BlackList_DTO(String bl_name, String bl_reason, String bl_email) {
		super();
		this.bl_name = bl_name;
		this.bl_reason = bl_reason;
		this.bl_email = bl_email;
	}

	public String getBl_name() {
		return bl_name;
	}

	public void setBl_name(String bl_name) {
		this.bl_name = bl_name;
	}

	public String getBl_reason() {
		return bl_reason;
	}

	public void setBl_reason(String bl_reason) {
		this.bl_reason = bl_reason;
	}

	public String getBl_email() {
		return bl_email;
	}

	public void setBl_email(String bl_email) {
		this.bl_email = bl_email;
	}
	
	
}
