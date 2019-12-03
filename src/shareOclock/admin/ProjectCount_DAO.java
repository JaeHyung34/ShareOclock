package shareOclock.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import configuration.Configuration;

public class ProjectCount_DAO {
	private static ProjectCount_DAO instance;

	public synchronized static ProjectCount_DAO getInstance() {
		if (instance == null) {
			instance = new ProjectCount_DAO();
		}
		return instance;
	}

	Connection getConnection() throws Exception {
		return Configuration.dbs.getConnection();
	}

	// 생성된 프로젝트 수 가져오는 로직
	public int SelectProjectCount() throws Exception {
		String sql = "select count(*) as count from tb_project";
		int totalCount = 0;
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					totalCount = rs.getInt("count");
				}
				return totalCount;
			}
		}
	}
}
