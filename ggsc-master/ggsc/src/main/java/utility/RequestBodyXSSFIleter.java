package utility;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
public class RequestBodyXSSFIleter implements Filter {
    private List<String> extUrl;
 
    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
       RequestWrapper reqWrapper = null;
        String path = ((HttpServletRequest) req).getServletPath();
 
        try {
            if (!extUrl.contains(path)) {
              
               reqWrapper  = new RequestWrapper(request);
               chain.doFilter(reqWrapper , response);
            } else {
                chain.doFilter(request, response);
            }
 
        } catch (NullPointerException e) {
        	func.Logging(this.getClass().getName(), e);
        }
 
    }
 
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String excludePattern = filterConfig.getInitParameter("extUrls");
       extUrl = Arrays.asList(excludePattern.split(","));
    }
 
    @Override
    public void destroy() {
    }
}