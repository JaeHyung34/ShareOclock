package shareOclock.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import configuration.Configuration;
import configuration.Utils;

public class ProjectDAO {
	public static ProjectDAO instance;

	public synchronized static ProjectDAO getInstance() {
		if (instance == null) {
			System.out.println("디비 생성");
			instance = new ProjectDAO();
		}
		return instance;
	}
	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}

	public int getProjectSeq() throws Exception{
		String sql = "select pro_seq.nextval from dual";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			try(ResultSet rs = pstat.executeQuery();){
				int seq =0 ;
				if(rs.next()) {
					seq = rs.getInt(1);
					return seq;
				}return seq;
			}
		}
	}

	public List<MyProjectDTO> getProjectBySeq(int seq) throws Exception{
		String sql = "select pro_seq, pro_title, m.pm_nickname, pro_contents, pro_endDate, pro_startDate "
				+ "from tb_project p join tb_project_member m using(pro_seq) "
				+ "where pro_seq=? and m.pm_check = 'H'";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				List<MyProjectDTO> list = new ArrayList<>();
				if(rs.next()) {
					int pro_seq = rs.getInt("pro_seq");
					String header = rs.getString("pm_nickname");
					String title = rs.getString("pro_title");
					String contents = rs.getString("pro_contents");
					Timestamp startDate = rs.getTimestamp("pro_startDate");
					Timestamp endDate = rs.getTimestamp("pro_endDate");
					list.add(new MyProjectDTO(pro_seq, header, title, contents,0, Utils.formedDate(startDate), Utils.formedDate(endDate)));
				}return list;
			}
		}
	}

	public int insertProject(ProjectDTO dto) throws Exception{
		String sql = "insert into tb_project values(?,?,?,TO_DATE(?, 'YYYY-MM-DD'),TO_DATE(?, 'YYYY-MM-DD'))";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getPro_seq());
			pstat.setString(2, dto.getPro_title());
			pstat.setString(3, dto.getPro_contents());
			pstat.setString(4, dto.getPro_startDate());
			pstat.setString(5, dto.getPro_endDate());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public int modifyProject(ProjectDTO dto) throws Exception{
		String sql = "update tb_project set pro_title=?,pro_contents=?,pro_startDate=TO_DATE(?, 'YYYY-MM-DD'),pro_endDate=TO_DATE(?, 'YYYY-MM-DD') where pro_seq=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getPro_title());
			pstat.setString(2, dto.getPro_contents());
			pstat.setString(3, dto.getPro_startDate());
			pstat.setString(4, dto.getPro_endDate());
			pstat.setInt(5, dto.getPro_seq());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}		
	}
	
	public int deleteProject(int pro_seq) throws Exception{
		String sql = "delete from tb_project where pro_seq=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public ProjectDTO getDetailBySeq(int pro_seq) throws Exception{
		String sql = "select * from tb_project where pro_seq=?";
		try(Connection con = Configuration.dbs.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pro_seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					int seq = rs.getInt("pro_seq");
					String title = rs.getString("pro_title");
					String contents = rs.getString("pro_contents");
					Timestamp startDate = rs.getTimestamp("pro_startDate");
					Timestamp endDate = rs.getTimestamp("pro_endDate");
					ProjectDTO dto = new ProjectDTO(seq, title, contents, Utils.formedDate(startDate), Utils.formedDate(endDate));
					return dto;
				}return null;
			}		
		}
	}
}
