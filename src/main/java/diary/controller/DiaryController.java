package diary.controller;

import diary.domain.DiaryVo;
import diary.service.DiaryService;
import jeongps.MyLibrary;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Inject
	DiaryService diaryService;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView createGET(ModelAndView mav) throws Exception {
		mav.setViewName("diary/create");
		return mav;
	}

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPOST(ModelAndView mav, DiaryVo diaryVo, HttpServletRequest request) throws Exception {
		String userId = request.getSession().getAttribute("userId").toString();

		// 등록일시, 수정일시
		diaryVo.setCreateDateTime(MyLibrary.dateTime());
		diaryVo.setUpdateDateTime(MyLibrary.dateTime());

		// 등록 아이디, 수정 아이디
		diaryVo.setCreateUserId(userId);
		diaryVo.setUpdateUserId(userId);

		// 일기 저장
		diaryVo.setUserId(userId);
		diaryService.create(diaryVo);

		mav.setViewName("redirect:/diary/list");
		return mav;
	}

	// 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public ModelAndView readGET(ModelAndView mav, DiaryVo diaryVo) throws Exception {
		diaryVo = diaryService.read(diaryVo);
		mav.addObject("diary", diaryVo);
		mav.setViewName("diary/read");
		return mav;
	}

	// 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listGET(ModelAndView mav, DiaryVo diaryVo, HttpServletRequest request) throws Exception {
		String userId = request.getSession().getAttribute("userId").toString();
		String userType = request.getSession().getAttribute("userType").toString();

		// 관리자가 아니라면 자신의 일기만 가져옴
		if (!userType.equals("ADMIN")) {
			diaryVo.setUserId(userId);
		}

		List<DiaryVo> diaryList = diaryService.all(diaryVo);
		mav.addObject("diaryList", diaryList);
		mav.setViewName("diary/list");
		return mav;
	}

	// 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView updateGET(ModelAndView mav, DiaryVo diaryVo) throws Exception {
		diaryVo = diaryService.read(diaryVo);
		mav.addObject("diary", diaryVo);
		mav.setViewName("diary/update");
		return mav;
	}

	// 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePOST(ModelAndView mav, DiaryVo diaryVo, HttpServletRequest request) throws Exception {
		String userId = request.getSession().getAttribute("userId").toString();

		// 수정일시, 수정 아이디
		diaryVo.setUpdateDateTime(MyLibrary.dateTime());
		diaryVo.setUpdateUserId(userId);

		// 일기 수정
		diaryService.update(diaryVo);
		mav.setViewName("redirect:/diary/read?userId=" + diaryVo.getUserId() + "&wdate=" + diaryVo.getWdate());
		return mav;
	}

	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePOST(ModelAndView mav, DiaryVo diaryVo) throws Exception {
		diaryService.delete(diaryVo);
		mav.setViewName("redirect:/diary/list");
		return mav;
	}

}
