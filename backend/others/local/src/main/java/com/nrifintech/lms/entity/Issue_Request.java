package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="issue_request")
public class Issue_Request extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="request_id")
	private int requestId;
	@Column(name="book_id")
	@ManyToOne
	private int bookId;
	@Column(name="member_id")
	@ManyToOne
	private int memberId;
	@Column(name="request_date")
	private String requestDate;
	public Issue_Request() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Issue_Request(int bookId, int memberId, String requestDate) {
		super();
		this.bookId = bookId;
		this.memberId = memberId;
		this.requestDate = requestDate;
	}
	public int getRequestId() {
		return requestId;
	}
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}
	@Override
	public String toString() {
		return "Issue_Request [requestId=" + requestId + ", bookId=" + bookId + ", memberId=" + memberId
				+ ", requestDate=" + requestDate + "]";
	}

	
	
	
	
}
	
	