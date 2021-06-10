package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TestDTO {

	private int idx;
	private String title, vdate, filename;
	private List<MultipartFile> files;
	
	@Override
	public String toString() {		// 1개에서 3개까지의 파일 이름을 하나의 문자열에 저장하고 싶다
		String fileNames = "";
		if(files != null) {
			for(MultipartFile f : files) {
				if(f.isEmpty() == false) {							// 파일이 비어있지 않다면
					fileNames += f.getOriginalFilename() + " / ";	// 이름을 추가한다			
				}
			}			
		}
		return String.format("{\n\t title:%s\n\t vadte:%s\n\t files:%s\n}", title, vdate, fileNames);
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getVdate() {
		return vdate;
	}
	public void setVdate(String vdate) {
		this.vdate = vdate;
	}
	public List<MultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}
