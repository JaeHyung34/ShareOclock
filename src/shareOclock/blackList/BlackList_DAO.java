package shareOclock.blackList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;
import shareOclock.member.Member_DTO;
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
	// 멤버테이블 목록 조회
	public List<Member_DTO> searchAllMemberView()throws Exception{
		String sql = "select mb_email, mb_name from tb_member minus select bl_email, bl_name from tb_blacklist";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
			List<Member_DTO> list = new ArrayList<Member_DTO>();
			while(rs.next()) {
				String email = rs.getString("mb_email");
				String name = rs.getString("mb_name");
				Member_DTO dto = new Member_DTO(email, null, name, null,null,null,null);
				list.add(dto);
			}
			return list;
		}
	}

	// 상세조회
	public Member_DTO searchByEmailMemberView(String mb_email)throws Exception{
		String sql = "select * from tb_member where mb_email = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mb_email);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					String email = rs.getString("mb_email");
					String name = rs.getString("mb_name");
					String nickname = rs.getString("mb_nickname");
					String group = "없음";
					if(rs.getString("mb_group") != null) {
						group = rs.getString("mb_group");
					}

					System.out.println(group);
					String phone = rs.getString("mb_phone");
					Member_DTO dto = new Member_DTO(email, null, name, nickname,group,phone,null);
					return dto;
				}
				return null;
			}
		}
	}

	// 일반회원 삭제
	public int deleteGeneralMember(String email) throws Exception {
		String sql = "delete from tb_member where mb_email = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, email);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 일반회원에서 블랙 회원으로 추가 시 이름 꺼내오기
	public String addBlckmemberFromGeneralmember(String email) throws Exception{
		String sql = "select mb_name from tb_member where mb_email = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, email);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {					
					String mb_name = rs.getString("mb_name");
					return mb_name;
				}
			}
		}
		return null;
	}

	// 프로젝트 전체 조회
	public List<ProjectDTO> searchAllProjectView()throws Exception{
		String sql = "select * from tb_project order by pro_seq desc";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
			List<ProjectDTO> list = new ArrayList<ProjectDTO>();
			while(rs.next()) {
				int seq = rs.getInt("pro_seq");
				String title = rs.getString("pro_title");
				String contents = rs.getString("pro_contents");
				String startDate = rs.getString("pro_startDate");
				String endDate = rs.getString("pro_endDate");
				ProjectDTO dto = new ProjectDTO(seq,title,contents, startDate, endDate);
				list.add(dto);
			}
			return list;
		}
	}

	//프로젝트 상세 보기
	public ProjectDTO searchByProSeqProjectView(int pro_seq)throws Exception{
		String sql = "select * from tb_project where pro_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setInt(1, pro_seq);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					int seq = rs.getInt("pro_seq");
					String title = rs.getString("pro_title");
					String contents = rs.getString("pro_contents");
					String startDate = rs.getString("pro_startDate");
					String endDate = rs.getString("pro_endDate");
					ProjectDTO dto = new ProjectDTO(seq,title,contents, startDate, endDate);
					return dto;
				}

			}
			return null;
		}
	}

	// 선택된 프로젝트 삭제하기
	public int deleteProject(String pro_seq) throws Exception {
		String sql = "delete from tb_project where pro_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, pro_seq);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}
}
