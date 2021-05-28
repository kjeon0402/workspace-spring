package com.itbank.model;

public class Paging {

	private final int perPage = 10;		// 한 페이지에 몇 개의 게시물을 출력할 것인가
	private int pageCount;				// 페이지의 총 개수
	private int boardCount;				// 총 게시물의 개수
	private int offset;					// 건너뛸 게시물의 개수
	private int page;					// 요청 받은 페이지
	
	private final int perSection = 10;	// 몇 개의 페이지를 단위로 끊을 것인가(세션)
	private int begin;					// 세션의 시작
	private int end;					// 세션의 끝
	private int section;				// page가 속한 세션의 번호
	
	private boolean prev;
	private boolean next;
	
	public Paging(int page, int boardCount) {
		this.page = page;
		this.boardCount = boardCount;
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage == 0) ? 0 : 1;
		
		offset = (page - 1) / perPage;
		
		section = (page - 1) / 10;
		begin = 10 * section + 1;
		end = begin + perSection - 1;
		end = end > pageCount ? pageCount : end;
		
		prev = section != 0;
		next = boardCount > perPage * end;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getBoardCount() {
		return boardCount;
	}
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getSection() {
		return section;
	}
	public void setSection(int section) {
		this.section = section;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getPerPage() {
		return perPage;
	}
	public int getPerSection() {
		return perSection;
	}
}
