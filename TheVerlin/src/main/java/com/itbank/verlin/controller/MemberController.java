package com.itbank.verlin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.verlin.model.AddressDataDTO;
import com.itbank.verlin.model.LoginDTO;
import com.itbank.verlin.model.MemberJoinDTO;
import com.itbank.verlin.model.MemberModifyDTO;
import com.itbank.verlin.service.MemberService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired private MemberService memberService;

    

    @GetMapping("/my_order")
    public ModelAndView my_Order(){
        return new ModelAndView("/member/my_order");
    }

    @GetMapping("/modify")
    public ModelAndView modify(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("/member/mypage/modify");
        int userid = Integer.parseInt(session.getAttribute("login").toString());
        System.out.println(userid);
        modelAndView.addObject("MemberInfo",memberService.findMemberFindIdByUid(userid));
        //System.out.println(memberService.findMemberFindIdByUid(userid).toString());
        return modelAndView;
    }

    @GetMapping("/address")
    public String address(){
        return "/member/mypage/address";
    }

    @GetMapping("/point")
    public ModelAndView point(){
        return new ModelAndView("member/point");
    }

    @GetMapping("/coupon")
    public ModelAndView coupon(){
        return new ModelAndView("member/coupon");
    }

    @GetMapping("/my_board")
    public ModelAndView my_board(){
        return new ModelAndView("member/my_board");
    }

    @GetMapping("/cart")
    public void cart(){}

    @GetMapping("/login")
    public String login(){
        return "member/login/login";
    }

    @GetMapping("/logout")
    public String logoutProcess(HttpSession session){

        if(session.getAttribute("login") != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @GetMapping("/findid")
    public String findid(){
        return "member/login/findid";
    }

    @GetMapping("/findpw")
    public String findpw(){
        return "member/login/findpw";
    }

    @GetMapping("/join")
    public void join(){}

    @GetMapping("/mypage")
    public ModelAndView mypage(HttpSession session){
        ModelAndView modelAndView = new ModelAndView("/member/mypage/mypage");
//        MemberDTO member_info = memberService.findByMember(Integer.parseInt(session.getAttribute("login").toString()));
//        modelAndView.addObject("member_info",member_info);
        return modelAndView;
    }

    @GetMapping("/address_register")
    public String address_register(){
        return "/member/mypage/address_register";
    }

    @GetMapping("/address_modify")
    public ModelAndView address_modify(int idx){
        ModelAndView modelAndView = new ModelAndView("/member/mypage/address_modify");
        modelAndView.addObject("Address",memberService.selectAddress(idx));
        return modelAndView;
    }


    @PostMapping("/login")
    public String loginCheck(@RequestParam Map<String, String> param,HttpSession session){
    	LoginDTO loginDTO = new LoginDTO();
    	loginDTO.setMEMBER_ID(param.get("id"));
    	loginDTO.setMEMBER_PW(param.get("pw"));
    	loginDTO.setMEMBER_DELETED("n");

    	System.out.println(param.toString());
    	
        LoginDTO result = memberService.checkLoginMemberIdPw(loginDTO);             

        System.out.println(result);
        if( result != null){
            session.setAttribute("login",result.getMEMBER_UID());
            return "/member/mypage/mypage";
        }
        return "redirect:/member/login?result=false";
    }

    @PostMapping("/findid_email")
    public ModelAndView loginFindIdByEmail(@RequestParam Map<String, String> param){
        ModelAndView modelAndView = new ModelAndView("findid_result");
        System.out.println(memberService.findLoginFindIdByEmail("源�泥좎닔","lukeuen7777@gmail.com"));
        return modelAndView;
    }

    @PostMapping("/findid_phone")
    public ModelAndView loginFindIdByPhone(@RequestParam Map<String, String> param){
        ModelAndView modelAndView = new ModelAndView("findid_result");
        System.out.println(memberService.findLoginFindIdByPhone("源�泥좎닔","lukeuen7777@gmail.com"));
        return modelAndView;
    }

    @PostMapping("/modify")
    public void memberModify(HttpServletResponse response,@RequestParam Map<String, String> param, HttpSession session) throws Exception {
    	MemberModifyDTO dto = new MemberModifyDTO();
    	dto.setMEMBER_UID(Integer.parseInt(session.getAttribute("login").toString()));
    	dto.setMEMBER_PW(param.get("pw"));
    	dto.setMEMBER_POST(param.get("postcode"));
    	dto.setMEMBER_ADDRESS_INFO(param.get("address"));
    	dto.setMEMBER_ADDRESS_DETAIL(param.get("postDetail"));
    	dto.setMEMBER_PHONE(param.get("mp0")+"-"+param.get("mp1") + "-" + param.get("mp2"));
    	dto.setMEMBER_EMAIL(param.get("email"));
    	dto.setMEMBER_EMAIL_CHECK(param.get("email_receive_check"));
    	dto.setMEMBER_ACCOUNT_BANK(param.get("bank"));
    	dto.setMEMBER_ACCOUNT_NUMBER(param.get("account_number"));

//        if(!dto.getMEMBER_PW().equals(""))

    	memberService.modifyLoginPassword(dto);
        memberService.modifyMember(dto);
        memberService.modifyMemberDetail(dto);
        response.sendRedirect("/member/mypage");
    }

    @PostMapping("/join")
    public void memberAdd(@RequestParam Map<String, String> param,HttpServletResponse response) throws Exception{
        System.out.println(param);
        MemberJoinDTO dto = new MemberJoinDTO();
        dto.setMEMBER_ID(param.get("id"));
        dto.setMEMBER_PW(param.get("pw"));
        dto.setMEMBER_NAME(param.get("name"));
        dto.setMEMBER_POST(param.get("postcode"));
        dto.setMEMBER_ADDRESS_INFO(param.get("address"));
        dto.setMEMBER_ADDRESS_DETAIL(param.get("postDetail"));
        dto.setMEMBER_PHONE(param.get("mp0") + "-" + param.get("mp1") + "-" + param.get("mp2"));
        dto.setMEMBER_EMAIL(param.get("email"));
        dto.setMEMBER_EMAIL_CHECK(param.get("email_receive_check").equals("on") ? "y" : "n");
        dto.setMEMBER_POINT(3000);

        memberService.addMember(dto);
        memberService.addLogin(dto);
        memberService.addMemberDetail(dto);
        response.sendRedirect("/member/login");
    }

    @PostMapping("/address_register")
    public void addressAdd(@RequestParam Map<String, String> param,HttpSession session,HttpServletResponse response) throws Exception{
        int userid = Integer.parseInt(session.getAttribute("login").toString());
        System.out.println(param.toString());

        String  hp1 = param.get("hp1"),
                hp2 = param.get("hp2");
        AddressDataDTO dto = new AddressDataDTO();
        dto.setADDRESS_NAME(param.get("address_name"));
        dto.setADDRESS_RECIPIENT(param.get("address_recipient"));
        dto.setADDRESS_POST(param.get("address_post"));
        dto.setADDRESS_INFO(param.get("address_info"));
        dto.setADDRESS_DETAIL(param.get("address_detail"));
        dto.setADDRESS_HPHONE((hp1.equals("") || hp2.equals("")) ? "" : param.get("hp0")+"-"+hp1+"-"+hp2);
        dto.setADDRESS_MPHONE(param.get("mp0")+"-"+param.get("mp1")+"-"+param.get("mp2"));

        if(memberService.addAddress(userid,dto) != 0 ){
            System.out.println("�벑濡� �꽦怨�");
            response.sendRedirect("/member/address");
        }
        else{
            System.out.println("�벑濡� �떎�뙣");
        }
    }

    @PostMapping("/address_modify")
    public void addressModify(@RequestParam Map<String, String> param,HttpSession session,HttpServletResponse response) throws Exception{
        int userid = Integer.parseInt(session.getAttribute("login").toString());
        System.out.println(param.toString());

        String  hp1 = param.get("hp1"),
                hp2 = param.get("hp2");

        AddressDataDTO dto = new AddressDataDTO();
        dto.setADDRESS_UID(Integer.parseInt(param.get("idx")));
        dto.setADDRESS_NAME(param.get("address_name"));
        dto.setADDRESS_RECIPIENT(param.get("address_recipient"));
        dto.setADDRESS_POST(param.get("address_post"));
        dto.setADDRESS_INFO(param.get("address_info"));
        dto.setADDRESS_DETAIL(param.get("address_detail"));
        dto.setADDRESS_HPHONE((hp1.equals("") || hp2.equals("")) ? "" : param.get("hp0")+"-"+hp1+"-"+hp2);
        dto.setADDRESS_MPHONE(param.get("mp0")+"-"+param.get("mp1")+"-"+param.get("mp2") );
        

        if(memberService.modifyAddress(userid,dto) != 0 ){
            System.out.println("�닔�젙 �꽦怨�");
            response.sendRedirect("/member/address");
        }
        else{
            System.out.println("�닔�젙 �떎�뙣");
        }
    }
}

