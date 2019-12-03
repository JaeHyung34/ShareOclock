package shareOclock.proMember;

public class ProMemberDTO {
	private int pm_seq;
	private String pm_check;
	private String pm_img;
	private String pm_nickname;
	private String pm_name;
	private String pm_email;
	private int pro_seq;
	public ProMemberDTO() {
		super();
	}
	public ProMemberDTO(int pm_seq, String pm_check, String pm_img, String pm_nickname, String pm_name, String pm_email,
			int pro_seq) {
		super();
		this.pm_seq = pm_seq;
		this.pm_check = pm_check;
		this.pm_img = pm_img;
		this.pm_nickname = pm_nickname;
		this.pm_name = pm_name;
		this.pm_email = pm_email;
		this.pro_seq = pro_seq;
	}
	public int getPm_seq() {
		return pm_seq;
	}
	public void setPm_seq(int pm_seq) {
		this.pm_seq = pm_seq;
	}
	public String getPm_check() {
		return pm_check;
	}
	public void setPm_check(String pm_check) {
		this.pm_check = pm_check;
	}
	public String getPm_img() {
		return pm_img;
	}
	public void setPm_img(String pm_img) {
		this.pm_img = pm_img;
	}
	public String getPm_nickname() {
		return pm_nickname;
	}
	public void setPm_nickname(String pm_nickname) {
		this.pm_nickname = pm_nickname;
	}
	public String getPm_name() {
		return pm_name;
	}
	public void setPm_name(String pm_name) {
		this.pm_name = pm_name;
	}
	public String getPm_email() {
		return pm_email;
	}
	public void setPm_email(String pm_email) {
		this.pm_email = pm_email;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	
	
	
}
