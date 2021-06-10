package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.model.TestDAO;
import com.itbank.model.TestDTO;

@Service
public class TestService {
	
	@Autowired private TestDAO dao;
	
	private final String uploadPath = "D:\\upload";
	
	public TestService() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
			System.out.println("업로드 폴더를 생성했습니다.");
		}
	}

	public int uploadFile(TestDTO dto) throws IllegalStateException, IOException {
		// dto에 담겨있는 파일들을 uploadPath에 복사하고 
		// 이름은 vdate-title-originalFileName의 형식으로 만드세요
		// 전송한 파일이 한 번에 모두 생성되어야 합니다
		
		// 서버에 파일 업로드
		List<MultipartFile> files = dto.getFiles();			// dto 내의 파일 목록 가져오기
		for(int i = 0; i < files.size(); i++) {				// 목록 내의 파일 하나당 
			String fileName = dto.getVdate() + "-" + dto.getTitle() + "-" + dto.getFiles().get(i).getOriginalFilename();	// 이름 지정
			File dir = new File(uploadPath);				// 파일 객체 생성
			dto.getFiles().get(i).transferTo(new File(dir, fileName));	// 사용자 업로드 파일을 대상 파일 객체 위치에 전송
		}
		
		// 데이터베이스 처리 코드
		int row = dao.insertArticle(dto);	// 게시글만 DB에 작성
		int maxIdx = dao.selectMaxIdx();	// 가장 마지막에 작성된 글번호
		
		// 파일 이름 등록
		for(int i = 0; i < files.size(); i++) {				// 목록 내의 파일 하나당 
			String fileName = dto.getVdate() + "-" + dto.getTitle() + "-" + dto.getFiles().get(i).getOriginalFilename();	// 이름 지정
			row += dao.insertImage(maxIdx, fileName);
		}
		
		return row;
	}

	public List<TestDTO> selectList() {
		return dao.selectList();
	}

	public List<TestDTO> readOne(int idx) {
		return dao.readOne(idx);
	}
}
