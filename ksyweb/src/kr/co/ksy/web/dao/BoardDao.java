package kr.co.ksy.web.dao;

public class BoardDao {
	
	// 싱글턴 객체
	private static final BoardDao boardDao = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return boardDao;
	}
	
}
