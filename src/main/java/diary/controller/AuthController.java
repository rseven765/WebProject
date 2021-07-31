package diary.controller;

import diary.domain.UserVo;
import diary.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Inject
    private UserService userService;

    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

    // 로그인
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginGET(ModelAndView mav, String errorCode, HttpServletRequest request) throws Exception {
		/*
		// 관리자 정보 조회
		UserVo userVo = new UserVo();
		userVo.setUserId("admin");
		userVo = userService.read(userVo);

		// 관리자 비밀번호 암호화
		String userPassword = "1234";
		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
		String encPassword = bCryptPasswordEncoder.encode(userPassword);

		// 암호화된 비밀번호로 변경
		userVo.setUserPassword(encPassword);
		userService.update(userVo);
		*/

        if (request.getSession().getAttribute("userId") != null
                && request.getSession().getAttribute("userName") != null) {
            mav.setViewName("redirect:/main");
        } else {
            mav.addObject("errorCode", errorCode);
            mav.setViewName("auth/login");
        }

        return mav;
    }

    // 로그인
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginPOST(ModelAndView mav, UserVo userVo, HttpServletRequest request) throws Exception {
        //입력받은 비밀번호
        String userPassword = userVo.getUserPassword();
        //입력받은 타입
        String userType = userVo.getUserType();
        // 사용자 정보 조회
        userVo = userService.read(userVo);


        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

        // 사용자 없음
        if (userVo == null) {
            mav.addObject("errorCode", "201");
            mav.setViewName("redirect:/auth/login");
            return mav;
        }
        // 비밀번호 틀림(스프링시큐리티를 이용하여 비교)
        else if (!bCryptPasswordEncoder.matches(userPassword, userVo.getUserPassword())) {
            mav.addObject("errorCode", "202");
            mav.setViewName("redirect:/auth/login");
            return mav;
        }
        //관리자 미리 빼기
        else if(userVo.getUserType().equals("ADMIN")){

        }
        //유저 타입 확인
        else if (!(userType.equals(userVo.getUserType()))) {
            logger.info(userType);
            logger.info(userVo.getUserType());
            mav.addObject("errorCode", "203");
            mav.setViewName("redirect:/auth/login");
            return mav;

        }
        // 로그인 성공
        HttpSession session = request.getSession(true);
        session.setAttribute("userId", userVo.getUserId());
        session.setAttribute("userName", userVo.getUserName());
        session.setAttribute("userType", userVo.getUserType());
        mav.setViewName("redirect:/");

        return mav;
    }

    // 회원가입 화면
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView registerGET(ModelAndView mav) throws Exception {
        mav.setViewName("auth/register");
        return mav;
    }

    // 회원가입 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView registerPOST(ModelAndView mav, UserVo userVo) throws Exception {
        // 비밀번호 암호화
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encPassword = bCryptPasswordEncoder.encode(userVo.getUserPassword());
        userVo.setUserPassword(encPassword);

        // 등록일시, 수정일시
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
        Date currentTime = new Date();
        String dateTime = formatter.format(currentTime);
        userVo.setCreateDateTime(dateTime);
        userVo.setUpdateDateTime(dateTime);

        // 사용자 정보 저장
        userService.create(userVo);

        // 로그인 화면으로 이동
        mav.setViewName("redirect:/auth/login");
        return mav;
    }

    // 아이디,비밀번호찾기
    @RequestMapping(value = "/find_password", method = RequestMethod.GET)
    public ModelAndView findPasswordGET(ModelAndView mav) {
        mav.setViewName("auth/find_password");
        return mav;
    }

    // 로그아웃
    @RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView logout(ModelAndView mav, HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        session.invalidate();
        mav.setViewName("redirect:/auth/login");
        return mav;
    }

}
