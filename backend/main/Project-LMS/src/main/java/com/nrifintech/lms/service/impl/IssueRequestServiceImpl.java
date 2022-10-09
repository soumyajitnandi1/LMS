package com.nrifintech.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nrifintech.lms.entity.IssueRequest;
import com.nrifintech.lms.repository.IssueRequestRepository;
import com.nrifintech.lms.service.IssueRequestService;
@Service
public class IssueRequestServiceImpl implements IssueRequestService {

	@Autowired
	IssueRequestRepository issueRequestRepository;
	@Override
	public List<IssueRequest> findAll() {
		List<IssueRequest> optionalIssueRequests = issueRequestRepository.findAll();
		return optionalIssueRequests;
	}

}
