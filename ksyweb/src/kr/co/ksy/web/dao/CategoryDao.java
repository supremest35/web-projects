package kr.co.ksy.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.ksy.web.util.ConnectionUtil;
import kr.co.ksy.web.vo.Category;

public class CategoryDao {
	
	private static final String GET_ALL_CATEGORIES_SQL = "select * from ksy_web_board_categories order by category_no asc";
	
	// 싱글턴 객체
	private static final CategoryDao categoryDao = new CategoryDao();
	private CategoryDao() {}
	public static CategoryDao getInstance() {
		return categoryDao;
	}
	
	public List<Category> getAllCategories() throws SQLException {
		List<Category> categories = new ArrayList<Category>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ALL_CATEGORIES_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Category category = new Category();
			category.setNo(rs.getInt("category_no"));
			category.setName(rs.getString("category_name"));
			categories.add(category);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return categories;
	}
	
}
