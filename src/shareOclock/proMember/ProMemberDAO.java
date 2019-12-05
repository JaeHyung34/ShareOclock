package shareOclock.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;

public class Pro_memberDAO {
	public static Pro_memberDAO instance;

	public synchronized static Pro_memberDAO getInstance() {
		if (instance == null) {
			System.out.println("디비 생성");
			instance = new Pro_memberDAO();
		}
		return instance;
	}
	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}

	public int insertProjectMember(int pro_seq, String pm_nickname, String pm_check) throws Exception{
		String sql = "insert into tb_project_member values(pm_seq.nextval,?,?,?)";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			pstat.setString(2, pm_nickname);
			pstat.setString(3, pm_check);
			int result = pstat.executeUpdate();
			con.commit();
			return result;			
		}
	}
	public List<Integer> getSeqByNickname(String nickname) throws Exception{
		String sql = "select pro_seq from tb_project_member where pm_nickname=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, nickname);
			try(ResultSet rs = pstat.executeQuery();){
				List<Integer> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("pro_seq");
					list.add(seq);
				}return list;
			}
		}
	}
	
	public int getCountBySeq(int seq) throws Exception{
		String sql = "select count(*) from tb_project_member where pro_seq=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					int count = rs.getInt(1);
					return count;
				}return -1;			
			}	
		}
	}	

	public boolean isValidMember(int pro_seq, String nickname) throws Exception{
		String sql = "select *  from tb_project_member where pro_seq=? and pm_nickname=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			pstat.setString(2, nickname);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					return true;
				}return false;
			}
		}
	}
	
	public int deleteProjectMember(int pro_seq) throws Exception{
		String sql = "delete from tb_project_member where pro_seq=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public boolean isProjectHeader(int pro_seq, String nickname) throws Exception{
		String sql = "select pm_check from tb_project_member where pro_seq=? and pm_nickname=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			pstat.setString(2, nickname);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					String pm_check = rs.getString(1);
					if(pm_check.contentEquals("H")) {
						return true;
					}
				}return false;
			}
		}
	}
}
