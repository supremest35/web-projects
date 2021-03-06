package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.ConnectionUtil;
import vo.Board;
import vo.BoardImage;

public class BoardDao {

	private static final String GET_BOARD_NO_SQL = "select test_board_seq.nextval no from dual";
	private static final String INSERT_BOARD_SQL = "insert into test_board (board_no, board_title, board_document, user_id)"
			+ " values (?, ?, ?, ?)";
	private static final String INSERT_BOARD_IMAGE_SQL = "insert into test_board_images (board_no, image_filename, image_index)"
			+ " values (?, ?, ?)";
	private static final String GET_ALL_BOARDS_SQL = "select * from test_board";
	private static final String GET_ALL_BOARD_IMAGES_SQL = "select * from test_board_images";
	private static final String GET_BOARDS_BY_RANGE_SQL = "select * from (select row_number() over (order by board_no desc) rn, a.*"
			+ " from test_board a)"
			+ " where rn >= ? and rn <= ?";
	private static final String GET_BOARD_BY_NO_SQL = "select * from test_board where board_no = ?";
	private static final String GET_BOARD_IMAGES_BY_NO_SQL = "select * from test_board_images where board_no = ?";
	private static final String GET_TOTAL_RECORDS_SQL = "select count(*) cnt from test_board";
	
	// 싱글턴 객체
	private static final BoardDao boardDao = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return boardDao;
	}
	
	public int getBoardNo() throws SQLException {
		int boardNo = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARD_NO_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		boardNo = rs.getInt("no");
		
		return boardNo;
		
	}

	public int getTotalRecords() throws SQLException {
		int totalRecords = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_TOTAL_RECORDS_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		
		totalRecords = rs.getInt("cnt");
		
		return totalRecords;
		
	}
	
	public List<Board> getBoardsByRange(int begin, int end) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARDS_BY_RANGE_SQL);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setDocument(rs.getString("board_document"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setUserId(rs.getString("user_id"));
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boards;
	}
	
	public List<Board> getAllBoards() throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ALL_BOARDS_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setDocument(rs.getString("board_document"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setUserId(rs.getString("user_id"));
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boards;
	}
	
	public List<BoardImage> getAllBoardImages() throws SQLException {
		List<BoardImage> boardImages = new ArrayList<BoardImage>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ALL_BOARD_IMAGES_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardImage boardImage = new BoardImage();
			boardImage.setNo(rs.getInt("board_no"));
			boardImage.setFileName(rs.getString("image_filename"));
			boardImage.setIndex(rs.getInt("image_index"));
			boardImages.add(boardImage);
		}

		rs.close();
		pstmt.close();
		con.close();
		return boardImages;
	}
	
	public Board getBoardByNo(int boardNo) throws SQLException {
		Board board = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARD_BY_NO_SQL);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setDocument(rs.getString("board_document"));
			board.setCreateDate(rs.getDate("board_create_date"));
			board.setUserId(rs.getString("user_id"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return board;
	}
	
	public List<BoardImage> getBoardImagesByNo(int boardNo) throws SQLException {
		List<BoardImage> boardImages = new ArrayList<BoardImage>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARD_IMAGES_BY_NO_SQL);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardImage boardImage = new BoardImage();
			boardImage.setNo(rs.getInt("board_no"));
			boardImage.setFileName(rs.getString("image_filename"));
			boardImage.setIndex(rs.getInt("image_index"));
			boardImages.add(boardImage);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardImages;
	}
	
	
	public void insertBoard(Board board) throws SQLException {
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_BOARD_SQL);
		pstmt.setInt(1, board.getNo());
		pstmt.setString(2, board.getTitle());
		pstmt.setString(3, board.getDocument());
		pstmt.setString(4, board.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void insertBoardImage(BoardImage boardImage) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_BOARD_IMAGE_SQL);
		pstmt.setInt(1, boardImage.getNo());
		pstmt.setString(2, boardImage.getFileName());
		pstmt.setInt(3, boardImage.getIndex());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
}
