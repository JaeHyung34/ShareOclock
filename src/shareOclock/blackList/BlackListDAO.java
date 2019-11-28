package shareOclock.blackList;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;


public class BlackListDAO {
	private static BlackListDAO instance;

	   public synchronized static BlackListDAO getInstance() {
	      if (instance == null) {
	         System.out.println("새로 디비 생성하였다.");
	         instance = new BlackListDAO();
	      }
	      return instance;
	   }

	   Connection getConnection() throws Exception {
	      return Configuration.dbs.getConnection();
	   }
	// 블랙리스트 회원 추가
	public int insert(String name, String reason, String email) throws Exception{
		
		String sql = "insert into tb_blacklist values(?,?,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, name);
			pstmt.setString(2, reason);
			pstmt.setString(3, email);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// 블랙리스트  email로 삭제
	public int delete(String email) throws Exception{
		String sql = "delete from tb_blacklist where bl_email = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, email);
			int result = pstmt.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	// 블랙리스트 회원 조회
	public List<BlackListDTO> searchAllView()throws Exception{
		String sql = "select * from tb_blacklist order by bl_email desc";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				){
			List<BlackListDTO> list = new ArrayList();
			while(rs.next()) {
				String name = rs.getString("bl_name");
				String reason = rs.getString("bl_reason");
				String email = rs.getString("bl_email");
				BlackListDTO dto = new BlackListDTO(name, reason, email);
				list.add(dto);
			}
			return list;
		}
	}
	// 이메일로 블랙리스트 회원 검색
	public BlackListDTO searchByEmailView(String email)throws Exception {
		String sql = "select * from tb_blacklist where bl_email=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, email);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					String name = rs.getString("bl_name");
					String reason = rs.getString("bl_reason");
					String blackemail = rs.getString("bl_email");
					BlackListDTO dto = new BlackListDTO(name,reason,blackemail);
					return dto;
				}
			}
			return null;
		}
	}
	//이름으로 블랙리스트 회원 검색
	public BlackListDTO searchByNameView(String name)throws Exception {
		String sql = "select * from tb_blacklist where bl_name=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, name);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					String blackname = rs.getString("bl_name");
					String reason = rs.getString("bl_reason");
					String email = rs.getString("bl_email");
					BlackListDTO dto = new BlackListDTO(blackname, reason,email);
					return dto;
				}
			}
			return null;
		}
	}
}
