package com.artfactory.project01.todayart.controller;

import com.artfactory.project01.todayart.entity.EmailVerify;
import com.artfactory.project01.todayart.entity.Member;
import com.artfactory.project01.todayart.model.EmailVerifyModel;
import com.artfactory.project01.todayart.model.MemberRegister;
import com.artfactory.project01.todayart.model.MemberUpdate;
import com.artfactory.project01.todayart.model.HttpStatusMessage;
import com.artfactory.project01.todayart.service.EmailService;
import com.artfactory.project01.todayart.service.EmailVerifyService;
import com.artfactory.project01.todayart.service.MemberService;
import com.artfactory.project01.todayart.util.HashingUtil;
import com.artfactory.project01.todayart.util.MemberDetailServiceImpl;
import com.artfactory.project01.todayart.util.PrincipalUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.security.InvalidParameterException;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Map;

@RestController
@RequestMapping("/members")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MemberDetailServiceImpl memberDetailsService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private EmailVerifyService emailVerifyService;

    /*
      작성자:  희창
      기능 설명 : 비회원인지 확인하고 이메일 중복체크후 회원가입
      @param MemberRegister
      @return Member
   */
    @PreAuthorize("hasRole('GUEST')")
    @PostMapping(produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Member createMember(@RequestBody MemberRegister memberRegister) {
        if (memberService.findByEmail(memberRegister.getEmail()) == null) {
            return memberService.createMember(memberRegister.setMember());
        } else {
            throw new BadCredentialsException("이미 가입된 이메일입니다");
        }
    }

    /*
       작성자:  희창
       기능 설명 : 로그인
      @param Member
      @return Member
    */
//    @PreAuthorize("hasRole('GUEST')")
    @PostMapping(path = "/signIn", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public UserDetails signIn(@RequestBody Map<String, String> signMember) {
        String email = signMember.get("email");
        String password = signMember.get("password");

        if(email == null || email.isEmpty() || memberService.findByEmail(email) == null){
            throw new InvalidParameterException("없는 이메일이거나 이메일을 입력하지 않았습니다");
        } else if(password == null || password.isEmpty()){
            throw new InvalidParameterException("비밀번호를 입력하지 않았습니다");
        }

        Member member = (Member) memberDetailsService.loadUserByUsername(email);
        if (member != null && password.compareTo(member.getPassword()) != 0) {
            throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
        }

        return member;
    }

    /*
       작성자:  희창
       기능 설명 : 회원 정보 조회(개인)
      @param id(PathVariable), passwordMap, principal
      @return id에 맞는 Member객체
    */
    @GetMapping(path = "/{id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public UserDetails retrieveMember(@PathVariable("id") int id,@RequestBody Map<String, String> passwordMap, Principal principal) {
        if(PrincipalUtil.from(principal).getPassword().equals(passwordMap.get("password"))) {
            return memberService.retrieveMember(id);
        } else {
            throw new BadCredentialsException("비밀번호가 일치하지 않습니다");
        }
    }

    /*
       작성자:  희창
       기능 설명 : 회원 정보 수정
      @param int id(PathVariable), UpdateMember Model
      @return id,updateMember에 맞게 수정된 Member 객체
    */
//    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
//    @PatchMapping(path = "/update", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//    public UserDetails updateMember(@RequestBody Map<String, String> updateMap,
//                                    Principal principal) {
//
//        // JSON받을때 확인용으로 현재 비밀번호 받아서 비교
//        if(PrincipalUtil.from(principal).getPassword().equals(updateMap.get("chkPassword"))) {
//            return memberService.updateMember(principal, updateMap);
//        } else{
//            throw new BadCredentialsException("정보가 일치하지 않습니다");
//        }
//    }

    /*
       작성자:  희창
       기능 설명 : 회원 삭제(탈퇴 여부 체크)
      @param int id(PathVariable), UpdateMember Model
      @return id, updateMember에 맞게 체크된 Member 객체
    */
    @PreAuthorize("hasAnyRole('CUSTOMER','ARTIST')")
    @DeleteMapping(produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public UserDetails deleteMember(@RequestBody Map<String, String> passwordMap, Principal principal) {
        if (PrincipalUtil.from(principal).getPassword().equals(passwordMap.get("password"))) {
            return memberService.deleteMember((Member) PrincipalUtil.from(principal));
        } else {
            throw new BadCredentialsException("정보가 일치하지 않습니다");
        }
    }

    /*
       작성자:  희창
       기능 설명 : 비밀번호 확인
      @param @RequestParam String password, Principal principal
      @return http 상태메시지
    */
    @GetMapping(path = "/checkPassword", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage checkPassword(@RequestParam String password, Principal principal) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();
        if(PrincipalUtil.from(principal).getPassword().equals(password)) {
            httpStatusMessage.setStatusCode(HttpStatus.OK);
            httpStatusMessage.setStatusMessage("현재 비밀번호와 일치합니다.");
        } else {
            httpStatusMessage.setStatusCode(HttpStatus.CONFLICT);
            httpStatusMessage.setStatusMessage("현재 비밀번호와 일치하지 않습니다.");
        }
        return httpStatusMessage;
    }

    /*
     * 작성자 : 상현
     * 기능 : 토큰 인증 후 사용자 정보를 얻는다
     */
    @GetMapping(path = "/me", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public Member me(Principal principal) {
        return (Member) memberDetailsService.loadUserByUsername(principal.getName());
    }

    /*
     * 작성자 : 상현
     * 기능 : 중복확인
     * 인자 : data, flag
     * 리턴 : HttpStatusMessage 객체
     */
    @GetMapping(path = "/checkEmail", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage checkEmail(@RequestParam String email) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();
        Member member = memberService.findByEmail(email);

        if (member == null) {
            httpStatusMessage.setStatusCode(HttpStatus.OK);
            httpStatusMessage.setStatusMessage("사용 가능 한 이메일 입니다.");
        } else {
            httpStatusMessage.setStatusCode(HttpStatus.CONFLICT);
            httpStatusMessage.setStatusMessage("이미 사용중인 이메일 입니다.");
        }

        return httpStatusMessage;
    }

    /*
     * 작성자 : 상현
     * 기능 : 닉네임 중복확인
     * 인자 : nickname
     * 리턴 : HttpStatusMessage 객체
     */
    @GetMapping(path = "/checkNickname", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage checkNickname(@RequestParam String nickname) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();
        Member member = memberService.findByNickname(nickname);

        if (member == null) {
            httpStatusMessage.setStatusCode(HttpStatus.OK);
            httpStatusMessage.setStatusMessage("사용 가능 한 닉네임 입니다.");
        } else {
            httpStatusMessage.setStatusCode(HttpStatus.CONFLICT);
            httpStatusMessage.setStatusMessage("이미 사용중인 닉네임 입니다.");
        }

        return httpStatusMessage;
    }

    /*
     * 작성자 : 상현
     * 용도 : 닉네임 업데이트
     */
    @PatchMapping(produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage updateNickname(Principal principal, @RequestBody MemberUpdate memberUpdate) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();
        Member member = memberService.findByEmail(PrincipalUtil.from(principal).getUsername());

        if(memberUpdate.getNickname() != null) {
            member.setNickname(memberUpdate.getNickname());
        } else if(memberUpdate.getRealName() != null) {
            member.setRealName(memberUpdate.getRealName());
        } else if(memberUpdate.getPhone() != null) {
            member.setPhone(memberUpdate.getPhone());
        } else if(memberUpdate.getPassword() != null) {
            member.setPassword(memberUpdate.getPassword());
        } else {
            httpStatusMessage.setStatusCode(HttpStatus.CONFLICT);
            httpStatusMessage.setStatusMessage("변경 중 오류가 발생 했습니다.");

            return httpStatusMessage;
        }

        memberService.updateMember(member);
        httpStatusMessage.setStatusCode(HttpStatus.OK);
        httpStatusMessage.setStatusMessage("변경이 완료되었습니다.");

        return httpStatusMessage;
    }

    /*
     * 작성자 : 상현
     * 용도 : 비밀번호 재설정 / 회원 승인 메일 발송 기능
     */
    @PostMapping(path="/sendEmail", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage sendEmail(@RequestBody EmailVerifyModel emailVerifyModel) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();

        if(emailVerifyModel == null) {
            httpStatusMessage.setStatusCode(HttpStatus.BAD_REQUEST);
            httpStatusMessage.setStatusMessage("오류가 발생 했습니다.");
        } else {
            Integer memberId = memberService.findByEmail(emailVerifyModel.getEmail()).getMemberId();
            LocalDateTime localDateTime = LocalDateTime.now();
            HashingUtil hashingUtil = new HashingUtil();

            EmailVerify emailVerify = new EmailVerify();
            emailVerify.setMemberId(memberId);
            emailVerify.setType(emailVerifyModel.getType());
            emailVerify.setExpireDated(localDateTime.plusHours(1));
            emailVerify.setVerifyText(hashingUtil.sha256Encoding(emailVerifyModel.getEmail() + localDateTime));
            emailVerifyService.createEmailVerify(emailVerify);

            String token = emailVerifyService.findByMemberId(memberId).getVerifyText();

            String subject = "[오늘의아트] 회원가입을 환영합니다.";
            String text = token;
            emailService.sendSimpleMessage(emailVerifyModel.getEmail(), subject, text);

            httpStatusMessage.setStatusCode(HttpStatus.OK);
            httpStatusMessage.setStatusMessage("발송 성공");
        }

        return httpStatusMessage;
    };

    /*
     * 작성자 : 상현
     * 기능 : 가입 승인 메일 토큰 확인
     * 인자 : token
     * 리턴 : HttpStatusMessage 객체
     */
    @GetMapping(path = "/checkRegisterToken", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
    public HttpStatusMessage checkRegisterToken(@RequestParam String token) {
        HttpStatusMessage httpStatusMessage = new HttpStatusMessage();

        EmailVerify emailVerify = emailVerifyService.findByVerifyText(token);


        if (emailVerify == null) {
            httpStatusMessage.setStatusCode(HttpStatus.CONFLICT);
            httpStatusMessage.setStatusMessage("오류가 발생 했습니다.");
        } else {
            Member member = memberService.retrieveMember(emailVerify.getMemberId());
            member.setEmailChecked("Y");
            memberService.updateMember(member);

            httpStatusMessage.setStatusCode(HttpStatus.OK);
            httpStatusMessage.setStatusMessage("승인 완료!");
        }

        return httpStatusMessage;
    }
}
