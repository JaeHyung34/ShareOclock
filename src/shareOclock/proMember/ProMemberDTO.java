package shareOclock.member;

public class Pro_memberDTO {
	private int  pm_seq;
	private int pro_seq;
	private String pm_nickname;
	private String pm_check;
	
	public Pro_memberDTO(int pm_seq, int pro_seq, String pm_nickname, String pm_check) {
		super();
		this.pm_seq = pm_seq;
		this.pro_seq = pro_seq;
		this.pm_nickname = pm_nickname;
		this.pm_check = pm_check;
	}
	
	public int getPm_seq() {
		return pm_seq;
	}
	public void setPm_seq(int pm_seq) {
		this.pm_seq = pm_seq;
	}
	public int getPro_seq() {
		return pro_seq;
	}
	public void setPro_seq(int pro_seq) {
		this.pro_seq = pro_seq;
	}
	public String getPm_nickname() {
		return pm_nickname;
	}
	public void setPm_nickname(String pm_nickname) {
		this.pm_nickname = pm_nickname;
	}
	public String getPm_check() {
		return pm_check;
	}
	public void setPm_check(String pm_check) {
		this.pm_check = pm_check;
	}
	
}
