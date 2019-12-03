package shareOclock.blackList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;
import shareOclock.member.MemberDTO;
import shareOclock.project.ProjectDTO;

public class BlackList_DAO {
	private static BlackList_DAO instance;

	public synchronized static BlackList_DAO getInstance() {
		if (instance == null) {
			System.out.println("새로 디비 생성하였다.");
			instance = new BlackList_DAO();
		}
		return instance;
	}

	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}

	// 블랙리스트 회원 추가
	public int insert(String name, String reason, String email) throws Exception {

		String sql = "insert into tb_blacklist values(?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, name);
			pstmt.setString(2, reason);
			pstmt.setString(3, email);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 블랙리스트 사유 수정
	public int modifyByEmailAndName(String email,String name, String reason)throws Exception {
		String sql = "update tb_blacklist set bl_reason = ? where bl_email=? and bl_name=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, reason);
			pstmt.setString(2, email);
			pstmt.setString(3, name);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 블랙리스트 email로 삭제
	public int delete(String email) throws Exception {
		String sql = "delete from tb_blacklist where bl_email = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, email);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 블랙리스트 회원 조회
	public List<BlackList_DTO> searchAllBlackView() throws Exception {
		String sql = "select * from tb_blacklist order by bl_email desc";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			List<BlackList_DTO> list = new ArrayList<BlackList_DTO>();
			while (rs.next()) {
				String bl_name = rs.getString("bl_name");
				String bl_reason = rs.getString("bl_reason");
				String bl_email = rs.getString("bl_email");
				BlackList_DTO dto = new BlackList_DTO(bl_name, bl_reason, bl_email);
				list.add(dto);
			}
			return list;
		}
	}

	// 이메일로 블랙리스트 회원 검색
	public BlackList_DTO searchByEmailView(String email) throws Exception {
		String sql = "select * from tb_blacklist where bl_email=?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, email);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					String name = rs.getString("bl_name");
					String reason = rs.getString("bl_reason");
					String blackemail = rs.getString("bl_email");
					BlackList_DTO dto = new BlackList_DTO(name, reason, blackemail);
					return dto;
				}
			}
			return null;
		}
	}

	// 이름으로 블랙리스트 회원 검색
	public BlackList_DTO searchByNameView(String name) throws Exception {
		String sql = "select * from tb_blacklist where bl_name=?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, name);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					String blackname = rs.getString("bl_name");
					String reason = rs.getString("bl_reason");
					String email = rs.getString("bl_email");
					BlackList_DTO dto = new BlackList_DTO(blackname, reason, email);
					return dto;
				}
			}
			return null;
		}
	}

	// 멤버테이블 비교 시 사용할 메서드
	//	public boolean emailCheck(String email) throws Exception {
	//		String sql = "select * from tb_member where mb_email = ?";
	//		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
	//			pstmt.setString(1, email);
	//			try (ResultSet rs = pstmt.executeQuery();) {
	//				return rs.next();
	//			}
	//		}
	//	}
	
	

	

	

	

	
}
