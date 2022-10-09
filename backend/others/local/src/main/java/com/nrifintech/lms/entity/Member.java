package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="member")
public class Member extends AbstractBaseEntity 
{
	private static final long serialVersionUID = 6715094082833854125L;
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="member_id")
	@OneToMany(targetEntity = Issue_Request.class, mappedBy = "member_id")
	@OneToOne(targetEntity = Users.class, mappedBy = "user_id")
	private int memberId;
	@Column(name="status")
	private String status;
	@Column(name="warnings")
	private int warnings;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String status, int warnings) {
		super();
		this.status = status;
		this.warnings = warnings;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getWarnings() {
		return warnings;
	}
	public void setWarnings(int warnings) {
		this.warnings = warnings;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", status=" + status + ", warnings=" + warnings + "]";
	}
	
	
}
