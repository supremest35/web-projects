<%@page import="kr.co.shop.vo.Review"%>
<%@page import="kr.co.shop.vo.User"%>
<%@page import="kr.co.shop.vo.ReviewLikeUser"%>
<%@page import="kr.co.shop.dao.ReviewDao"%>
<%@page import="kr.co.shop.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNo = StringUtils.stringToInt(request.getParameter("reviewno"));
	int pageNo = StringUtils.stringToInt(request.getParameter("pno"), 1);
	int reviewPageNo = StringUtils.stringToInt(request.getParameter("rpno"), 1);
	Integer loginedUserNo = (Integer) session.getAttribute("LOGINED_USER_NO");
	
	
	ReviewDao reviewDao = ReviewDao.getInstance();
	ReviewLikeUser reviewLikeUser = reviewDao.getReviewLikeUserByNo(loginedUserNo, reviewNo);
	
	Review review = reviewDao.getReviewByNo(reviewNo);
	
	if (reviewLikeUser == null) {
		reviewDao.insertReviewLikeUser(loginedUserNo, reviewNo);
		review.setLikeCount(review.getLikeCount() + 1);
	} else {
		reviewDao.deleteReviewLikeUser(loginedUserNo, reviewNo);
		review.setLikeCount(review.getLikeCount() - 1);
	}
	
	reviewDao.updateReview(review);
	
	response.sendRedirect("detail.jsp?pno=" + pageNo + "&bookno=" + review.getBookNo() + "&rpno=" + reviewPageNo);
	
%>