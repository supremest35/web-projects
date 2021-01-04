package kr.co.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.shop.util.ConnectionUtil;
import kr.co.shop.vo.BankCardCompany;

public class BankCardDao {

	private static final String GET_ALL_BANK_CARD_COMPANIES_SQL = "select * from shop_bank_card_companies";
	
	private static final BankCardDao bankCardDao = new BankCardDao();
	private BankCardDao () {}
	public static BankCardDao getInstance() {
		return bankCardDao;
	}
	
	/**
	 * 전체 카드, 은행 정보 조회
	 * @return 카드, 은행 정보 조회
	 * @throws SQLException
	 */
	public List<BankCardCompany> getAllBankCardCompanies() throws SQLException {
		List<BankCardCompany> bankCardCompanies = new ArrayList<BankCardCompany>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(GET_ALL_BANK_CARD_COMPANIES_SQL);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BankCardCompany bankCardCompany = new BankCardCompany();
			bankCardCompany.setNo(rs.getInt("bank_no"));
			bankCardCompany.setName(rs.getString("bank_name"));
			
			bankCardCompanies.add(bankCardCompany);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return bankCardCompanies;
	}
}
