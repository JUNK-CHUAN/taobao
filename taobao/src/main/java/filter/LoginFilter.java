package filter;

import define.Constants;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(
        filterName = "LocalLoginFilter",
        urlPatterns = "/*"
)
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse res = (HttpServletResponse) servletResponse;

        // if logout or login
        String uri = req.getRequestURI();
        if (uri.endsWith("logout.do") || uri.endsWith("login.do") || uri.endsWith("login.jsp"))
        {
            filterChain.doFilter(req, res);
            return;
        }

        // static source
        if (uri.endsWith(".jpg") || uri.endsWith(".png") || uri.endsWith(".gif") || uri.endsWith(".css") || uri.endsWith(".js"))
        {
            filterChain.doFilter(req, res);
            return;
        }

        // else: judge if login
        Cookie cookies[] = req.getCookies();
        if (cookies != null)
        {
            for (Cookie cookie : cookies)
            {
                if (cookie.getName().equals(Constants.COOKIE_USER))
                {
                    filterChain.doFilter(req, res);
                }
            }
        }
        res.sendRedirect(Constants.LOGIN_URL);
    }

        @Override
    public void destroy() {

    }
}
