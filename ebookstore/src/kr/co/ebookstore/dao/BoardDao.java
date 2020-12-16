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
	private static final String GET_BOARDDTOS_BY_RANGE_SQL = "select *"
														   + " from (select row_number() over(order by a.board_no desc) rn, a.*, b.*, c.* "
														   + "		 from ebookstore_boards a, ebookstore_board_categories b, ebookstore_users c"
														   + "       where a.board_category_no = b.category_no"
														   + "		 and a.board_writer_id = c.user_id"
														   + "		 and a.board_deleted = 'N')"
														   + " where rn >= ? and rn <= ?";
	private static final String INSERT_BOARD_SQL = "insert into ebookstore_boards(board_no, board_category_no, board_title, board_writer_id, board_content)"
												 + " values(ebookstore_board_seq.nextval, ?, ?, ?, ?)";
	
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
}
