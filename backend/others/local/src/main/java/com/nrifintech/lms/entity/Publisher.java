package com.nrifintech.lms.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


	@Entity
	@Table(name="publisher")
	public class Publisher extends AbstractBaseEntity 
	{
		private static final long serialVersionUID = 6715094082833854125L;
		

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="pub_id")
		@OneToMany
		private int pubId;
		@Column(name="pub_name")
		private String pubName;
		
		
		public Publisher(String pubName) {
			super();
			this.pubName = pubName;
		}
		public Publisher() {
			super();
			// TODO Auto-generated constructor stub
		}
		public int getPubId() {
			return pubId;
		}
		public void setPubId(int pubId) {
			this.pubId = pubId;
		}
		public String getPubName() {
			return pubName;
		}
		public void setPubName(String pubName) {
			this.pubName = pubName;
		}
		@Override
		public String toString() {
			return "Publisher [pubId=" + pubId + ", pubName=" + pubName + "]";
		}
		
		
		
}
