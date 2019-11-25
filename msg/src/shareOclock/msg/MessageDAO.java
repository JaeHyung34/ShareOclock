package shareOclock.msg;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class MessageDAO {
	
	private BasicDataSource bds;
	
	private static MessageDAO instance;
	
//	public MessageDAO() throws Exception {
//		Context initContext = new InitialContext();
//		Context envContext = (Context) initContext.lookup("java:/comp/env");
//		bds = (BasicDataSource)envContext.lookup("msg");
//	}
	
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
}
