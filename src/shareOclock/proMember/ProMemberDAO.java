package shareOclock.proMember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import configuration.Configuration;
import shareOclock.file.FilesDAO;
import shareOclock.member.MemberDTO;



public class ProMemberDAO {
	private static ProMemberDAO instance;
	public synchronized static ProMemberDAO getInstance() {
		if (instance == null) {
			System.out.println("디비가 생성되었다.");
			instance = new ProMemberDAO();
		}
		return instance;
	}
	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}
	public int insert(ProMemberDTO dto) throws Exception{
		String sql = "insert into tb_project_member values(pm_seq.nextval,'M',?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getPm_img());
			pstat.setString(2, dto.getPm_nickname());
			pstat.setString(3, dto.getPm_name());
			pstat.setString(4, dto.getPm_email());
			pstat.setInt(5, dto.getPro_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public ArrayList<String> getThree(String mb_nickname) throws Exception{
		String sql = "select mb_img, mb_nickname, mb_name from tb_member where mb_nickname = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, mb_nickname);
			ArrayList<String> al = new ArrayList<>();
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					String mb_img = rs.getString("mb_img");
					String mb_nickname1 = rs.getString("mb_nickname");
					String mb_name = rs.getString("mb_name");
					System.out.println(mb_img + mb_nickname1 + mb_name);
					al.add(mb_img);
					al.add(mb_nickname1);
					al.add(mb_name);
				}
			}
			return al;

		}
	}
	public int delete(String pm_nickname) throws Exception{
		String sql = "delete from tb_project_member where pm_nickname = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, pm_nickname);		
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public int update(ProMemberDTO dto) throws Exception{
		String sql = "insert into tb_project_member values(pm_seq.nextval,'M',?,?,?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getPm_img());
			pstat.setString(2, dto.getPm_nickname());
			pstat.setString(3, dto.getPm_name());
			pstat.setString(4, dto.getPm_email());
			pstat.setInt(5, dto.getPro_seq());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	public List<ProMemberDTO> selectPM() throws Exception{
		String sql = "select * from tb_project_member order by pm_seq, pm_name";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<ProMemberDTO> list = new ArrayList<>();
			while(rs.next()) {
				int pm_seq = rs.getInt("pm_seq");
				String pm_check = rs.getString("pm_check");
				String pm_img = rs.getString("pm_img");
				String pm_nickname = rs.getString("pm_nickname");
				String pm_name = rs.getString("pm_name");
				String pm_email = rs.getString("pm_email");
				int pro_seq = rs.getInt("pro_seq");
				ProMemberDTO dto = new ProMemberDTO(pm_seq,pm_check, pm_img, pm_nickname, pm_name, pm_email, pro_seq);
				list.add(dto);
			}
			return list;
		}
	}
	public List<ProMemberDTO> selectByNickname(String pm_nickname) throws Exception{
		String sql = "select * from tb_project_member where pm_nickname = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, pm_nickname);
			try(ResultSet rs = pstat.executeQuery();){
				List<ProMemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					int pm_seq = rs.getInt("pm_seq");
					String pm_check = rs.getString("pm_check");
					String pm_img = rs.getString("pm_img");
					String pm_nickname1 = rs.getString("pm_nickname");
					String pm_name = rs.getString("pm_name");
					String pm_email = rs.getString("pm_email");
					int pro_seq = rs.getInt("pro_seq");
					ProMemberDTO dto = new ProMemberDTO(pm_seq,pm_check, pm_img, pm_nickname1, pm_name, pm_email, pro_seq);
					list.add(dto);
				}
				return list;
			}
		}
	}
	public List<MemberDTO> selectMemeber(String pm_nickname) throws Exception{
		String sql = "select * from tb_member where not mb_nickname in (?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, pm_nickname);
			try(ResultSet rs = pstat.executeQuery();){
				List<MemberDTO> list = new ArrayList<>();
				while(rs.next()) {
					System.out.println("while안");
					String mb_img = rs.getString("mb_img");
					String mb_nickname = rs.getString("mb_nickname");
					String mb_pw = rs.getString("mb_pw");
					String mb_name = rs.getString("mb_name");	
					String mb_email = rs.getString("mb_email");	
					String mb_group = rs.getString("mb_group");
					String mb_phone = rs.getString("mb_phone");
					String mb_check = rs.getString("mb_check");
					MemberDTO dto = new MemberDTO(mb_img, mb_nickname, null, mb_name, mb_email, null, null, "M");
					list.add(dto);
				}
				return list;
			}
		}
	}
	public List<MemberDTO> updateList() throws Exception{
		String sql = "SELECT m.mb_img, m.mb_nickname, m.mb_pw, m.mb_name, m.mb_email, m.mb_group, m.mb_phone, m.mb_check FROM tb_member m WHERE not exists (select * from tb_project_member p where m.mb_nickname = p.pm_nickname)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<MemberDTO> list = new ArrayList<>();
			while(rs.next()) {
				String mb_img = rs.getString("mb_img");
				String mb_nickname = rs.getString("mb_nickname");
				String mb_pw = rs.getString("mb_pw");
				String mb_name = rs.getString("mb_name");	
				String mb_email = rs.getString("mb_email");	
				String mb_group = rs.getString("mb_group");
				String mb_phone = rs.getString("mb_phone");
				String mb_check = rs.getString("mb_check");
				MemberDTO dto = new MemberDTO(mb_img, mb_nickname, null, mb_name, mb_email, null, null, "M");
				list.add(dto);
			}
			return list;
		}
	}
	public List<String> searchNickname(String mb_nickname) throws Exception{
		String sql = "select mb_nickname from tb_member where mb_nickname like ? ";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, mb_nickname);
			try(ResultSet rs = pstat.executeQuery();){
				List<String> list = new ArrayList<>();
				while(rs.next()) {
					String mb_nickname1 = rs.getString("mb_nickname");					
					list.add(mb_nickname1);
				}
				return list;
			}
		}
	}

}
