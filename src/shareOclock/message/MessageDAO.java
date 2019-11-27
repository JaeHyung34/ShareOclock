package shareOclock.message;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class MessageDAO {

	private BasicDataSource bds;

	private static MessageDAO instance;

	private MessageDAO() {
		bds.setDriverClassName("oracle.jdbc.OracleDriver");
		bds.setUrl("jdbc:oracle:thin:@localhost:1521");
		bds.setUsername("semi");
		bds.setPassword("semi");
		bds.setInitialSize(30);
	}

	public static MessageDAO getInstance() {
		if (instance == null)
			instance = new MessageDAO();
		return instance;
	}

	private Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	// 메시지 삽입
	public int insertMsg(MessageDTO dto ) throws Exception {
		String sql = "insert into tb_message values(msg_seq.nextval, ?, ?, ?, sysdate,'n')";
		try (
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, dto.getMessage_sender());
			pstat.setString(2, dto.getMessage_receiver());
			pstat.setString(3, dto.getMessage_contents());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	// 메시지 모두 읽기
	public List<MessageDTO> viewAllMsg() throws Exception {
		String sql = "select * from tb_message";
		try (
				Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				) {
			List list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String sender = rs.getString(2);
				String receiver = rs.getString(3);
				String content = rs.getString(4);
				Timestamp time = rs.getTimestamp(5);
				char read = rs.getString(6).charAt(0);
				list.add(new MessageDTO(seq,sender,receiver,content,time,read));
			}
			return list;
		}
	}
}
