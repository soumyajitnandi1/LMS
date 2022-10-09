package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="issue_history")
public class Issue_History extends AbstractBaseEntity {
	private static final long serialVersionUID = 6715094082833854125L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="issue_id")
	private int issueId;
	
	@ManyToOne
	@Column(name="book_id")
	private int bookId;
	
	
	@ManyToOne
	@Column(name="member_id")
	private int memberId;
	@Column(name="issue_date")
	private String issueDate;
	@Column(name="return_date")
	private String returnDate;
	@Column(name="status")
	private String status;
	@Column(name="fine")
	private int fine;
	public Issue_History() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Issue_History(int bookId, int memberId, String issueDate, String returnDate, String status, int fine) {
		super();
		this.bookId = bookId;
		this.memberId = memberId;
		this.issueDate = issueDate;
		this.returnDate = returnDate;
		this.status = status;
		this.fine = fine;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
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
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getFine() {
		return fine;
	}
	public void setFine(int fine) {
		this.fine = fine;
	}
	@Override
	public String toString() {
		return "Issue_History [issueId=" + issueId + ", bookId=" + bookId + ", memberId=" + memberId + ", issueDate="
				+ issueDate + ", returnDate=" + returnDate + ", status=" + status + ", fine=" + fine + "]";
	}
	
	
	
}