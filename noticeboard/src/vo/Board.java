package vo;

import java.util.Date;

public class Board {

	private int no;
	private String title;
	private String document;
	private Date createDate;
	private String userId;
	
	public Board() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDocument() {
		return document;
	}

	public String getDocumentWithBr() {
		if (document != null) {
			return document.replace("\n", "<br />");
		}
		return "";
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}
