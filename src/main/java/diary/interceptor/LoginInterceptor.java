package diary.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        // 로그인이 필요한 경우
        if (request.getSession().getAttribute("userId") == null
                || request.getSession().getAttribute("userName") == null
                || request.getSession().getAttribute("userType") == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return false;
        }

        return true;
    }

}
