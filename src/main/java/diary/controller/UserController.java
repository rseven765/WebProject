package diary.controller;

import diary.domain.UserVo;
import diary.service.UserService;
import jeongps.MyLibrary;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// 등록 화면
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView createGET(ModelAndView mav, UserVo userVo) {
		mav.setViewName("user/create");
		return mav;
	}

	// 등록 처리
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPOST(ModelAndView mav, UserVo userVo) throws Exception {
		// 비밀번호 암호화
		String encPassword = MyLibrary.encString(userVo.getUserPassword());
		userVo.setUserPassword(encPassword);

		// 등록일시, 수정일시
		userVo.setCreateDateTime(MyLibrary.dateTime());
		userVo.setUpdateDateTime(MyLibrary.dateTime());

		// 사용자 정보 저장
		userService.create(userVo);

		// 사용자 목록으로 이동
		mav.setViewName("redirect:/user/list");
		return mav;
	}

	// 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public ModelAndView readGET(ModelAndView mav, UserVo userVo) throws Exception {
		// 사용자 정보 조회
		userVo = userService.read(userVo);

		mav.addObject("user", userVo);
		mav.setViewName("user/read");
		return mav;
	}

	// 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listGET(ModelAndView mav, UserVo userVo) throws Exception {
		// 사용자 목록 조회
		List<UserVo> userVoList = userService.all(userVo);

		mav.addObject("userList", userVoList);
		mav.setViewName("user/list");
		return mav;
	}

	// 수정 화면
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView updateGET(ModelAndView mav, UserVo userVo) throws Exception {
		// 사용자 정보 조회
		userVo = userService.read(userVo);

		mav.addObject("user", userVo);
		mav.setViewName("user/update");
		return mav;
	}

	// 수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePOST(ModelAndView mav, UserVo userVo) throws Exception {
		// 사용자 비밀번호를 수정할 경우 암호화 처리
		if (userVo.getUserPassword() != null) {
			String encPassword = MyLibrary.encString(userVo.getUserPassword());
			userVo.setUserPassword(encPassword);
		}

		// 수정일시
		userVo.setUpdateDateTime(MyLibrary.dateTime());

		// 사용자 정보 수정
		userService.update(userVo);

		mav.setViewName("redirect:/user/read?userId=" + userVo.getUserId());
		return mav;
	}

	// 삭제 처리
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePOST(ModelAndView mav, UserVo userVo) throws Exception {
		// 사용자 정보 삭제
		userService.delete(userVo);

		mav.setViewName("redirect:/user/list");
		return mav;
	}

}
