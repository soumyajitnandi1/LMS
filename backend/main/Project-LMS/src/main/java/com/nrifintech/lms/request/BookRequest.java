package com.nrifintech.lms.request;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.nrifintech.lms.entity.Publisher;

public class BookRequest {
	@NotNull
	@Size(min = 3, max = 50, message = "Size between 3 to 50 only")
	String title;
	
	@NotNull
	@Size(min = 3, max = 50, message = "Size between 3 to 50 only")
	String author;
		
	@NotNull
	@Size(min = 3, max = 50, message = "Size between 3 to 50 only")
	String category;

	@NotNull
	@Pattern(regexp = "^[1-9][0-9]{0,2}$", message = "Should be in between 1-999")
	String count;
	
	@NotNull
    @Pattern(regexp = "^[0-9]{4,4}$", message = "Enter Valid Year")
	String printYear;
	
	Publisher publisher;
	
	public Publisher getPublisher() {
		return publisher;
	}
	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPrintYear() {
		return printYear;
	}
	public void setPrintYear(String printYear) {
		this.printYear = printYear;
	}
	

}
