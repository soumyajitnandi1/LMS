package com.nrifintech.lms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nrifintech.lms.entity.Book;
import com.nrifintech.lms.entity.IssueRequest;

import org.springframework.data.jpa.repository.Query;

@Repository
public interface IssueRequestRepository extends JpaRepository<IssueRequest, Integer> {
	@Query(value = "select * from issue_request where request_id=?1", nativeQuery = true)
	Book findByrequestId(Integer id);
}
