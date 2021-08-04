package com.itbank.verlin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.verlin.model.AddressDataDTO;
import com.itbank.verlin.model.LoginDTO;
import com.itbank.verlin.model.MemberDAO;
import com.itbank.verlin.model.MemberFindIdResultDTO;
import com.itbank.verlin.model.MemberJoinDTO;
import com.itbank.verlin.model.MemberModifyDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public int addMember(MemberJoinDTO dto) {
		return memberDAO.insertMember(dto);
	}

	public int addLogin(MemberJoinDTO dto) {
		return memberDAO.insertLogin(dto);
	}

	public int addMemberDetail(MemberJoinDTO dto) {
		return memberDAO.insertMemberDetail(dto);
	}

	public int addAddress(int MEMBER_UID, AddressDataDTO dto) {
		return memberDAO.insertAddress(MEMBER_UID, dto);
	}

	public int modifyMemberDeleted(int MEMBER_UID) {
		return memberDAO.updateMemberDeleted(MEMBER_UID);
	}

	public LoginDTO checkLoginMemberId(String MEMBER_ID) {
		return memberDAO.selectLoginCheckByMemberId(MEMBER_ID);
	}

	public int modifyLoginPassword(MemberModifyDTO memberModifyDTO) {
		return memberDAO.updateLoginModifyPassword(memberModifyDTO);
	}

	public MemberModifyDTO findMemberFindIdByUid(int member_uid) {
		return memberDAO.selectMemberToModifyDTO(member_uid);
	}

	public int modifyMember(MemberModifyDTO memberModifyDTO) {
		return memberDAO.updateMember(memberModifyDTO);
	}

	public int modifyMemberDetail(MemberModifyDTO memberModifyDTO) {
		return memberDAO.updateMemberDetail(memberModifyDTO);
	}

	public LoginDTO checkLoginMemberIdPw(LoginDTO loginDTO) {
		return memberDAO.selectLoginCheckByMemberIdPw(loginDTO);
	}

	public LoginDTO checkLoginMemberUid(int MEMBER_UID, String MEMBER_PW) {
		return memberDAO.selectLoginCheckByMemberUid(MEMBER_UID, MEMBER_PW);
	}

	public MemberFindIdResultDTO findLoginFindIdByEmail(String member_name, String member_email) {
		return memberDAO.selectLoginFindIdByEmail(member_name, member_email);
	}

	public MemberFindIdResultDTO findLoginFindIdByPhone(String member_name, String member_phone) {
		return memberDAO.selectLoginFindIdByPhone(member_name, member_phone);
	}

	public List<AddressDataDTO> findAddressList(int MEMBER_UID) {
		return memberDAO.selectAddressList(MEMBER_UID);
	}

	public int modifyAddress(int MEMBER_UID, AddressDataDTO dto) {
		return memberDAO.updateAddress(MEMBER_UID, dto);
	}

	public AddressDataDTO selectAddress(int ADDRESS_UID) {
		return memberDAO.selectAddress(ADDRESS_UID);
	}

	public int modifyAddressFix(char ADDRESS_FIX, int ADDRESS_UID) {
		return memberDAO.updateAddressFix(ADDRESS_FIX, ADDRESS_UID);
	}

	public int removeAddress(int ADDRESS_UID) {
		return memberDAO.deleteAddressRemove(ADDRESS_UID);
	}

	public int addLogMemberLeave(int MEMBER_UID, String LEAVE_REASON) {
		return memberDAO.insertLogMemberLeaveAdd(MEMBER_UID, LEAVE_REASON);
	}
}
