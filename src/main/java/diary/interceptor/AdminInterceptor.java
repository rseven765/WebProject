package diary.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        // 관리자가 아닐 경우
        if (!request.getSession().getAttribute("userType").equals("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/auth/logout");
            return false;
        }

        return true;
    }

}
