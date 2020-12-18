package kr.co.ebookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.ebookstore.dto.BoardDto;
import kr.co.ebookstore.util.ConnectionUtil;
import kr.co.ebookstore.vo.Board;
import kr.co.ebookstore.vo.Category;
import kr.co.ebookstore.vo.User;

public class BoardDao {
	
	private static final String GET_TOTAL_RECORDS_SQL = "select count(*) cnt from ebookstore_boards";
	private static final String GET_BOARD_BY_NO_SQL = "select * from ebookstore_boards where board_no = ?";
	private static final String GET_BOARDDTO_BY_NO_SQL = "select *"
													   + " from ebookstore_boards a, ebookstore_board_categories b, ebookstore_users c"
													   + " where a.board_category_no = b.category_no"
													   + " and a.board_writer_id = c.user_id"
													   + " and a.board_no = ?";
	private static final String GET_BOARDDTOS_BY_RANGE_SQL = "select *"
														   + " from (select row_number() over(order by a.board_no desc) rn, a.*, b.*, c.* "
														   + "		 from ebookstore_boards a, ebookstore_board_categories b, ebookstore_users c"
														   + "       where a.board_category_no = b.category_no"
														   + "		 and a.board_writer_id = c.user_id"
														   + "		 and a.board_deleted = 'N')"
														   + " where rn >= ? and rn <= ?";
	private static final String INSERT_BOARD_SQL = "insert into ebookstore_boards(board_no, board_category_no, board_title, board_writer_id, board_content)"
												 + " values(ebookstore_board_seq.nextval, ?, ?, ?, ?)";
	private static final String UPDATE_BOARD_SQL = "update ebookstore_boards set board_category_no = ?, board_title = ?, board_content = ? where board_no = ?";
	
	// 싱글턴 객체
	private static final BoardDao boardDao = new BoardDao();
	private BoardDao() {};
	public static BoardDao getInstance() {
		return boardDao;
	}
	
	public int getTotalRecords() throws SQLException {
		int totalRecords = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_TOTAL_RECORDS_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalRecords = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		con.close();
		return totalRecords;
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
			board.setCategoryNo(rs.getInt("board_category_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriterId(rs.getString("board_writer_id"));
			board.setContent(rs.getString("board_content"));
			board.setLikes(rs.getInt("board_likes"));
			board.setDeleted(rs.getString("board_deleted"));
			board.setCreatedDate(rs.getDate("board_created_date"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return board;
	}
	
	public BoardDto getBoardDtoByNo(int boardNo) throws SQLException {
		BoardDto boardDto = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARDDTO_BY_NO_SQL);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setLikes(rs.getInt("board_likes"));
			boardDto.setDeleted(rs.getString("board_deleted"));
			boardDto.setCreatedDate(rs.getDate("board_created_date"));
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setLikes(rs.getInt("board_likes"));
			boardDto.setDeleted(rs.getString("board_deleted"));
			boardDto.setCreatedDate(rs.getDate("board_created_date"));
			
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			boardDto.setCategory(category);
			
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled(rs.getString("user_disabled"));
			boardDto.setUser(user);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardDto;
	}
	
	public List<BoardDto> getBoardDtosByRange(int begin, int end) throws SQLException {
		List<BoardDto> boardDtos = new ArrayList<BoardDto>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_BOARDDTOS_BY_RANGE_SQL);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setLikes(rs.getInt("board_likes"));
			boardDto.setDeleted(rs.getString("board_deleted"));
			boardDto.setCreatedDate(rs.getDate("board_created_date"));
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setLikes(rs.getInt("board_likes"));
			boardDto.setDeleted(rs.getString("board_deleted"));
			boardDto.setCreatedDate(rs.getDate("board_created_date"));
			
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			boardDto.setCategory(category);
			
			User user = new User();
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled(rs.getString("user_disabled"));
			boardDto.setUser(user);
			
			boardDtos.add(boardDto);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardDtos;
	}
	
	public void insertBoard(Board board) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(INSERT_BOARD_SQL);
		pstmt.setInt(1, board.getCategoryNo());
		pstmt.setString(2, board.getTitle());
		pstmt.setString(3, board.getWriterId());
		pstmt.setString(4, board.getContent());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(UPDATE_BOARD_SQL);
		pstmt.setInt(1, board.getCategoryNo());
		pstmt.setString(2, board.getTitle());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
}
