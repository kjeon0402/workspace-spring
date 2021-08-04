package com.itbank.verlin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.verlin.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/member/")
public class MemberRestController {
    @Autowired private MemberService memberService;
    private ObjectMapper mapper = new ObjectMapper();
    

    @GetMapping("/check/{pw}")
    public int loginPwCheck(@PathVariable String pw,HttpSession session){
        int member_uid = Integer.parseInt(session.getAttribute("login").toString());
        return memberService.checkLoginMemberUid(member_uid,pw)!= null ? 1 : 0;
    }

    @GetMapping("/address/fix/{idx}/{state}")
    public int addressFix(@PathVariable int idx, @PathVariable char state){
        return memberService.modifyAddressFix(state,idx);
    }
    @GetMapping("/address/remove/{idx}")
    public int addressRemove(@PathVariable int idx){
        return memberService.removeAddress(idx);
    }

    @GetMapping(value = "/check_id/{id}")
    public int test(@PathVariable String id){
        return memberService.checkLoginMemberId(id) != null ? 1 : 0;
    }

    @GetMapping(value="/address/list/",produces="application/json; charset=utf-8")
    public String addressList(HttpSession session)throws JsonProcessingException {
        int userid = Integer.parseInt(session.getAttribute("login").toString());
        return mapper.writeValueAsString(memberService.findAddressList(userid));
    }

    @DeleteMapping("/{reason}")
    public int memberRemove(@PathVariable String reason,HttpSession session){
        int userid = Integer.parseInt(session.getAttribute("login").toString());


        int successCount = memberService.addLogMemberLeave(userid,reason);
        successCount +=memberService.modifyMemberDeleted(userid);
        System.out.println(successCount);
        session.invalidate();
        return (successCount != 2) ? 0 : 1;
    }

}
