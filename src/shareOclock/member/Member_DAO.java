package shareOclock.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import configuration.Configuration;
import configuration.Encrpytion;

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
		System.out.println("id"+email);
		System.out.println("pw"+pw);
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
	public boolean emailCheck(String email) throws SQLException, Exception {
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
	public int modifyPw(String email, String pw) throws SQLException, Exception {
		String sql = "update tb_member set mb_pw=? where mb_email=?";
		try (Connection con = getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);) {
			System.out.println("디비가 실행" + pw);
			System.out.println("디비가 실행" + email);
			pstat.setString(1, Encrpytion.encrpyt(pw));
			pstat.setString(2, email);
			System.out.println("디비가 실행" + Encrpytion.encrpyt(pw));
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
//
//	public int insert(Member_DTO dto) throws SQLException, Exception {
//		String sql = "insert into members values(?,?,?,?,?,?,?,?)";
//		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
//			pstat.setString(1, dto.getId());
//			pstat.setString(2, Encrpytion.encrpyt(dto.getPw()));
//			pstat.setString(3, dto.getName());
//			pstat.setString(4, dto.getPhone());
//			pstat.setString(5, dto.getEmail());
//			pstat.setString(6, dto.getZipcode());
//			pstat.setString(7, dto.getAddress1());
//			pstat.setString(8, dto.getAddress2());
//			int result = pstat.executeUpdate();
//			conn.commit();
//
//			return result;
//
//		}
//
//	}
//

//
//	public int remove(String id) throws SQLException, Exception {
//		String sql = "delete from members where id=?";
//		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
//			pstat.setString(1, id);
//			int result = pstat.executeUpdate();
//			conn.commit();
//			return result;
//
//		}
//	}
//
//	public Member_DTO selectInfo(String id) throws SQLException, Exception {
//		String sql = "select * from members where id=?";
//		try (Connection conn = getConnection(); PreparedStatement pstat = conn.prepareStatement(sql);) {
//			pstat.setString(1, id);
//			try (ResultSet rs = pstat.executeQuery();) {
//				Member_DTO newDto = new Member_DTO();
//				if (rs.next()) {
//					newDto.setId(rs.getString("id"));
//					newDto.setPw(rs.getString("pw"));
//					newDto.setName(rs.getString("name"));
//					newDto.setEmail(rs.getString("email"));
//					newDto.setPhone(rs.getString("phone"));
//					newDto.setZipcode(rs.getString("zipcode"));
//					newDto.setAddress1(rs.getString("address1"));
//					newDto.setAddress2(rs.getString("address2"));
//				}
//				return newDto;
//			}
//		}
//	}
//


}
