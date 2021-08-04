package com.itbank.verlin.model;

public class Paging {

	private final int perPage = 10;			// 한 페이지 당 출력할 게시글의 수
	private int pageCount;					// 총 페이지의 갯수
	private int boardCount;					// 게시글의 총 갯수
	private int offset;						// 게시글 몇 개를 건너뛸 것인가
	private int page;						// 페이지의 번호
			
	private final int perSection = 10;		// 한 번에 출력할 페이지 숫자의 갯수
	private int begin;						// perSection의 첫번째 숫자
	private int end;						// perSection의 마지막 숫자
	private int section;					// perSection의 번호
			
	private boolean prev;					// 이전 페이지(<)가 있어야할 조건
	private boolean next;					// 다음 페이지(>)가 있어야할 조건
	
	private String search_kind;
	private String search_keyword;
	
	public Paging(int page, int boardCount) {	// 요청받은 페이지의 번호, 총 게시글 수
		this.page = page;
		this.boardCount = boardCount;
		pageCount = boardCount / perPage;
		pageCount += (boardCount % perPage == 0) ? 0 : 1;
		
		offset = (page - 1) * perPage;
		
		section = (page - 1) / perSection;
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
	public String getSearch_kind() {
		return search_kind;
	}
	public void setSearch_kind(String search_kind) {
		this.search_kind = search_kind;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
}
