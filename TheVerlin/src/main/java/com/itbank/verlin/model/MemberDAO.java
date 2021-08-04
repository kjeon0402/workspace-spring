package com.itbank.verlin.model;


import java.util.List;

import org.apache.ibatis.annotations.*;



@Mapper
public interface MemberDAO {

    /*
    *   Member
    */
    @Insert("insert into MEMBER (MEMBER_NAME,MEMBER_PHONE,MEMBER_EMAIL,MEMBER_POST,MEMBER_ADDRESS_INFO,MEMBER_ADDRESS_DETAIL) VALUES (#{MEMBER_NAME},#{MEMBER_PHONE},#{MEMBER_EMAIL},#{MEMBER_POST},#{MEMBER_ADDRESS_INFO},#{MEMBER_ADDRESS_DETAIL})")
    @SelectKey(statement = "select MEMBER_UID_SEQ.CURRVAL FROM DUAL", keyProperty = "MEMBER_UID", before = false, resultType = int.class)
    int insertMember(MemberJoinDTO dto);

    @Select("select\n" +
            "    MEMBER_ID,\n" +
            "    MEMBER_PW,\n" +
            "    MEMBER_NAME,\n" +
            "    MEMBER_PHONE,\n" +
            "    MEMBER_EMAIL,\n" +
            "    MEMBER_POST,\n" +
            "    MEMBER_ADDRESS_INFO,\n" +
            "    MEMBER_ADDRESS_DETAIL,\n" +
            "    MEMBER_EMAIL_CHECK,\n" +
            "    MEMBER_ACCOUNT_NUMBER,\n" +
            "    MEMBER_POINT,\n" +
            "    MEMBER_ACCOUNT_BANK\n" +
            "from MEMBER\n" +
            "    inner join MEMBER_DETAIL on MEMBER.MEMBER_UID = MEMBER_DETAIL.MEMBER_UID\n" +
            "    inner join LOGIN on MEMBER.MEMBER_UID = LOGIN.MEMBER_UID\n" +
            "where Member.MEMBER_UID=#{MEMBER_UID}")
    MemberModifyDTO selectMemberToModifyDTO(int MEMBER_UID);


    @Update("update MEMBER \n" +
            "set MEMBER_POST=#{MEMBER_POST},\n" +
            "    MEMBER_ADDRESS_INFO=#{MEMBER_ADDRESS_INFO},\n" +
            "    MEMBER_ADDRESS_DETAIL=#{MEMBER_ADDRESS_DETAIL},\n" +
            "    MEMBER_PHONE=#{MEMBER_PHONE},\n" +
            "    MEMBER_EMAIL=#{MEMBER_EMAIL}\n" +
            "where MEMBER_UID=#{MEMBER_UID}")
    int updateMember(MemberModifyDTO memberModifyDTO);

    @Update("update member set MEMBER_DELETED='y' where MEMBER_UID=#{MEMBER_UID}")
    int updateMemberDeleted(int MEMBER_UID);

    /*
     *   MEMBER_DETAIL
     */
    @Update("update MEMBER_DETAIL\n" +
            "set MEMBER_ACCOUNT_BANK=#{MEMBER_ACCOUNT_BANK},\n" +
            "    MEMBER_ACCOUNT_NUMBER=#{MEMBER_ACCOUNT_NUMBER},\n" +
            "    MEMBER_EMAIL_CHECK=#{MEMBER_EMAIL_CHECK}\n" +
            "where MEMBER_DETAIL.MEMBER_UID=#{MEMBER_UID}")
    int updateMemberDetail(MemberModifyDTO memberModifyDTO);

    @Insert("insert into MEMBER_DETAIL (MEMBER_UID,MEMBER_EMAIL_CHECK,MEMBER_POINT) values (#{MEMBER_UID},#{MEMBER_EMAIL_CHECK},#{MEMBER_POINT})")
    int insertMemberDetail(MemberJoinDTO memberJoinDTO);

    /*
     *   Login
     */
    @Insert("insert into LOGIN (MEMBER_UID, MEMBER_ID, MEMBER_PW) VALUES (#{MEMBER_UID},#{MEMBER_ID},#{MEMBER_PW})")
    int insertLogin(MemberJoinDTO dto);

    @Select("select MEMBER_ID,MEMBER_NAME,MEMBER_RDATE,MEMBER_LEVEL from LOGIN\n" +
            "    inner join MEMBER on LOGIN.MEMBER_UID = MEMBER.MEMBER_UID\n" +
            "    inner join MEMBER_DETAIL on login.MEMBER_UID = MEMBER_DETAIL.MEMBER_UID\n" +
            "where MEMBER_NAME=#{MEMBER_NAME} and MEMBER_EMAIL=#{MEMBER_EMAIL}")
    MemberFindIdResultDTO selectLoginFindIdByEmail(@Param("MEMBER_NAME") String MEMBER_NAME , @Param("MEMBER_EMAIL") String MEMBER_EMAIL);

    @Select("select MEMBER_ID,MEMBER_NAME,MEMBER_RDATE,MEMBER_LEVEL from LOGIN\n" +
            "    inner join MEMBER on LOGIN.MEMBER_UID = MEMBER.MEMBER_UID\n" +
            "    inner join MEMBER_DETAIL on login.MEMBER_UID = MEMBER_DETAIL.MEMBER_UID\n" +
            "where MEMBER_NAME=#{MEMBER_NAME} and MEMBER_PHONE=#{MEMBER_PHONE}")
    MemberFindIdResultDTO selectLoginFindIdByPhone(@Param("MEMBER_NAME") String MEMBER_NAME , @Param("MEMBER_PHONE") String MEMBER_PHONE);

    @Select("select LOGIN.MEMBER_UID,MEMBER_ID,MEMBER_PW,MEMBER_DELETED from LOGIN\n" +
            "    inner join MEMBER on LOGIN.MEMBER_UID = MEMBER.MEMBER_UID\n" +
            "where MEMBER_DELETED=#{MEMBER_DELETED} and MEMBER_ID=#{MEMBER_ID} and MEMBER_PW=#{MEMBER_PW}")
    LoginDTO selectLoginCheckByMemberIdPw(LoginDTO loginDTO);

    @Select("select * from login where MEMBER_UID=#{MEMBER_UID} and MEMBER_PW=#{MEMBER_PW}")
    LoginDTO selectLoginCheckByMemberUid(@Param("MEMBER_UID") int MEMBER_UID, @Param("MEMBER_PW") String MEMBER_PW);

    @Select("select * from LOGIN where MEMBER_ID=#{MEMBER_ID}")
    LoginDTO selectLoginCheckByMemberId(@Param("MEMBER_ID") String MEMBER_ID);

    @Update("update LOGIN set MEMBER_PW = #{MEMBER_PW} where MEMBER_UID = #{MEMBER_UID}")
    int updateLoginModifyPassword(MemberModifyDTO memberModifyDTO);
    /*
     *   Address
     */
    @Insert("insert into ADDRESS    (MEMBER_UID, ADDRESS_NAME, ADDRESS_RECIPIENT, ADDRESS_INFO, ADDRESS_DETAIL, ADDRESS_POST, ADDRESS_HPHONE, ADDRESS_MPHONE)\n" +
            " VALUES (#{MEMBER_UID},#{dto.ADDRESS_NAME},#{dto.ADDRESS_RECIPIENT},#{dto.ADDRESS_INFO},#{dto.ADDRESS_DETAIL},#{dto.ADDRESS_POST},#{dto.ADDRESS_HPHONE},#{dto.ADDRESS_MPHONE})")
    int insertAddress(@Param("MEMBER_UID") int MEMBER_UID,@Param("dto") AddressDataDTO dto);

    @Select("select * from (select * from ADDRESS where MEMBER_UID=#{MEMBER_UID}) order by ADDRESS_UID")
    List<AddressDataDTO> selectAddressList(int MEMBER_UID);

    @Select("select * from address where ADDRESS_UID=#{ADDRESS_UID}")
    AddressDataDTO selectAddress(int ADDRESS_UID);

    @Update("update address set ADDRESS_NAME=#{dto.ADDRESS_NAME}, ADDRESS_RECIPIENT=#{dto.ADDRESS_RECIPIENT}, ADDRESS_INFO=#{dto.ADDRESS_INFO}, ADDRESS_DETAIL=#{dto.ADDRESS_DETAIL}, ADDRESS_POST=#{dto.ADDRESS_POST}, ADDRESS_HPHONE=#{dto.ADDRESS_HPHONE}, ADDRESS_MPHONE=#{dto.ADDRESS_MPHONE}\n" +
            "where MEMBER_UID=#{MEMBER_UID} and ADDRESS_UID=#{dto.ADDRESS_UID}")
    int updateAddress(@Param("MEMBER_UID") int MEMBER_UID,@Param("dto") AddressDataDTO dto);

    @Update("update address set ADDRESS_FIX=#{ADDRESS_FIX} where ADDRESS_UID=#{ADDRESS_UID}")
    int updateAddressFix(@Param("ADDRESS_FIX") char ADDRESS_FIX, @Param("ADDRESS_UID") int ADDRESS_UID);

    @Delete("delete address where ADDRESS_UID=#{ADDRESS_UID}")
    int deleteAddressRemove(int ADDRESS_UID);

    /*
     *  Log
     */
    @Insert("insert into log_member_leave (MEMBER_UID, LEAVE_REASON) values (#{MEMBER_UID},#{LEAVE_REASON})")
    int insertLogMemberLeaveAdd(@Param("MEMBER_UID") int MEMBER_UID,@Param("LEAVE_REASON") String LEAVE_REASON);
}
