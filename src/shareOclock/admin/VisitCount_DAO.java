package shareOclock.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import configuration.Configuration;

public class VisitCount_DAO {
	private static VisitCount_DAO instance;

	public synchronized static VisitCount_DAO getInstance() {
		if (instance == null) {
			instance = new VisitCount_DAO();
		}
		return instance;
	}

	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}
	
	public void setVisitTotalCount() throws Exception{
		String sql = "insert into viewcount values(sysdate)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.executeUpdate();
			con.commit();
		}
	}
	
	public int getVisitTodayCount() throws Exception{
		String sql = "select count(*) as count from viewcount where "
				+ "to_date(view_date,'YYYY-MM-DD') = to_date(sysdate,'YYYY-MM-DD')";
		int todayCount = 0;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					todayCount = rs.getInt("count");
				}
				return todayCount;
			}
			
		}
	}
	
	public int getVisitTotalCount()throws Exception {
		String sql = "select count(*) as count from viewcount";
		int totalCount = 0;
		try(
				Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
				totalCount = rs.getInt("count");
				}
				return totalCount; 
			}
		}
	}
}
