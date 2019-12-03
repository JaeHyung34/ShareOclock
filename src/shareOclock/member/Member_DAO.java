package shareOclock.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import configuration.Configuration;
import configuration.Utils;

public class Member_DAO {
	public static Member_DAO instance;
	public synchronized static Member_DAO getInstance() {
		if (instance == null) {
			System.out.println("디비가 생성되었다.");
			instance = new Member_DAO();
		}
		return instance;
	}
	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}
	public Member_DTO getLogin(String email, String pw) throws Exception {
		String sql = "select * from tb_member where mb_email=? and mb_pw=?";
		Member_DTO dto = null;
		try (Connection conn = getConnection();
			PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, email);
			pstat.setString(2, pw);
			try (ResultSet rs = pstat.executeQuery();) {
				if(rs.next()) {
					dto = new Member_DTO(rs.getString("mb_email"),rs.getString("mb_pw") , rs.getString("mb_name"), rs.getString("mb_nickname"), rs.getString("mb_group") , rs.getString("mb_phone"), rs.getString("mb_check"));
				}	
				return dto;
			}
		}
	}
	public boolean nickNameCheck(String nickName) throws Exception {
		String sql = "select * from tb_member where mb_nickname = ?";
		try (
			Connection conn = getConnection(); 
			PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, nickName);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	public boolean emailCheck(String email) throws Exception {
		String sql = "select * from tb_member where mb_email = ?";
		try (
			Connection conn = getConnection(); 
			PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, email);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	public int modifyPw(String email, String pw) throws Exception {
		String sql = "update tb_member set mb_pw=? where mb_email=?";
		try (Connection con = getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);) {
			System.out.println("디비가 실행" + pw);
			pstat.setString(1, Utils.encrpyt(pw));
			pstat.setString(2, email);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int insert(Member_DTO dto)  throws Exception{
		String sql = "insert into tb_member values(?,?,?,?,?,?,?)";
		try (Connection conn = getConnection(); 
			 PreparedStatement pstat = conn.prepareStatement(sql);){
			System.out.println("naverKakao  : "+dto.getMb_pw());
			pstat.setString(1, dto.getMb_email());
			pstat.setString(2, Utils.encrpyt(dto.getMb_pw()));
			pstat.setString(3, dto.getMb_name());
			pstat.setString(4, dto.getMb_nickname());
			String content = dto.getMb_group();
			if(content != null && !content.equals("")){
				pstat.setString(5, dto.getMb_group());
			}
			else{
				pstat.setNull(5, java.sql.Types.NULL);
			}
			pstat.setString(6, dto.getMb_phone());
			pstat.setString(7, dto.getMb_check());
			int result = pstat.executeUpdate();
			conn.commit();
			return result;
		}
	}
	

	
	public Member_DTO selectInfo(String mb_nickName) throws SQLException, Exception {
		String sql = "select * from tb_member where mb_nickname=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, mb_nickName);
			try (ResultSet rs = pstat.executeQuery();) {
				Member_DTO dto = null;
				if (rs.next()) {
					dto = new Member_DTO(rs.getString("mb_email"),rs.getString("mb_pw") , rs.getString("mb_name"), rs.getString("mb_nickname"), rs.getString("mb_group") , rs.getString("mb_phone"), rs.getString("mb_check"));
				}
				return dto;
			}
		}
	}
	
	public int modifyMember(Member_DTO dto) throws SQLException, Exception {
		String sql = "update tb_member set mb_pw=?, mb_name=?, mb_nickname=?, mb_group=?, mb_phone=? where mb_email=?";
		try (Connection con = getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, Utils.encrpyt(dto.getMb_pw()));
			pstat.setString(2, dto.getMb_name());
			pstat.setString(3, dto.getMb_nickname());
			String content = dto.getMb_group();
			
			if(content != null && !content.equals("")){
				pstat.setString(4, dto.getMb_group());
			}
			else{
				pstat.setNull(4, java.sql.Types.NULL);
			}
			
			pstat.setString(5, dto.getMb_phone());
			pstat.setString(6, dto.getMb_email());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int deleteMember(String mb_nickName) throws SQLException, Exception {
		String sql = "delete from tb_member where mb_nickName=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, mb_nickName);
			int result = pstat.executeUpdate();
			conn.commit();
			return result;

		}
	}
	public Member_DTO selectEmail(String mb_email) throws SQLException, Exception {
		String sql = "select * from tb_member where mb_email=?";
		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
			pstat.setString(1, mb_email);
			try (ResultSet rs = pstat.executeQuery();) {
				Member_DTO dto = null;
				if (rs.next()) {
					dto = new Member_DTO(rs.getString("mb_email"),rs.getString("mb_pw") , rs.getString("mb_name"), rs.getString("mb_nickname"), rs.getString("mb_group") , rs.getString("mb_phone"), rs.getString("mb_check"));
				}
				return dto;
			}
		}
	}
	
}
