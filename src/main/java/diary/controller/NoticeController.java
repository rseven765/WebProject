package diary.controller;

import diary.domain.NoticeVo;
import diary.service.NoticeService;
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
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	NoticeService noticeService;

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView createGET(ModelAndView mav) throws Exception {
		mav.setViewName("notice/create");
		return mav;
	}

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPOST(ModelAndView mav, NoticeVo noticeVo, HttpServletRequest request) throws Exception {
		// 등록일시, 수정일시
		noticeVo.setCreateDateTime(MyLibrary.dateTime());
		noticeVo.setUpdateDateTime(MyLibrary.dateTime());

		// 등록 아이디, 수정 아이디
		String userId = request.getSession().getAttribute("userId").toString();
		noticeVo.setCreateUserId(userId);
		noticeVo.setUpdateUserId(userId);

		// 공지사항 저장
		noticeService.create(noticeVo);

		mav.setViewName("redirect:/notice/list");
		return mav;
	}

	// 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public ModelAndView readGET(ModelAndView mav, NoticeVo noticeVo) throws Exception {
		noticeVo = noticeService.read(noticeVo);
		mav.addObject("notice", noticeVo);
		mav.setViewName("notice/read");
		return mav;
	}

	// 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView listGET(ModelAndView mav, NoticeVo noticeVo) throws Exception {
		List<NoticeVo> noticeList = noticeService.all(noticeVo);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("notice/list");
		return mav;
	}

	// 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView updateGET(ModelAndView mav, NoticeVo noticeVo) throws Exception {
		noticeVo = noticeService.read(noticeVo);
		mav.addObject("notice", noticeVo);
		mav.setViewName("notice/update");
		return mav;
	}

	// 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView updatePOST(ModelAndView mav, NoticeVo noticeVo, HttpServletRequest request) throws Exception {
		String userId = request.getSession().getAttribute("userId").toString();

		// 수정일시, 수정 아이디
		noticeVo.setUpdateDateTime(MyLibrary.dateTime());
		noticeVo.setUpdateUserId(userId);

		// 공지사항 수정
		noticeService.update(noticeVo);
		mav.setViewName("redirect:/notice/read?id=" + noticeVo.getId());
		return mav;
	}

	// 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ModelAndView deletePOST(ModelAndView mav, NoticeVo noticeVo) throws Exception {
		noticeService.delete(noticeVo);
		mav.setViewName("redirect:/notice/list");
		return mav;
	}

}
