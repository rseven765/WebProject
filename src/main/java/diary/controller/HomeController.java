package diary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// home
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mav, HttpServletRequest request) {
		if (request.getSession().getAttribute("userId") == null
				|| request.getSession().getAttribute("userName") == null)
		{
			mav.setViewName("redirect:/auth/login");
		} else {

			mav.setViewName("main");
		}

		return mav;
	}

}
