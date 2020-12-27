package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.Category;

public class CategoryDao {

	private static final String GET_CATEGORY_BY_NO_SQL = "select * from shop_book_categories where category_no = ?";
	
	private static final CategoryDao categoryDao = new CategoryDao();
	private CategoryDao() {}
	public static CategoryDao getInstance() {
		return categoryDao;
	}
	
	public Category getCategoryByNo(int categoryNo) throws SQLException {
		Category category = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_CATEGORY_BY_NO_SQL);
		pstmt.setInt(1, categoryNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			category.setType(rs.getInt("category_type"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return category;
	}
}
