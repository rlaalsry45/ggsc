package utility;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
 
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
 
import com.nhncorp.lucy.security.xss.XssFilter;
 
public class RequestWrapper extends HttpServletRequestWrapper {
    private byte[] b;
 
    public RequestWrapper(HttpServletRequest request) throws IOException {
        super(request);
        XssFilter filter = XssFilter.getInstance("lucy-xss-sax.xml");
        b = new String(filter.doFilter(getBody(request))).getBytes("UTF-8");
    }
 
    public ServletInputStream getInputStream() throws IOException {
        final ByteArrayInputStream bis = new ByteArrayInputStream(b);
        return new ServletInputStreamImpl(bis);
    }
 
    class ServletInputStreamImpl extends ServletInputStream {
        private InputStream is;
 
        public ServletInputStreamImpl(InputStream bis) {
            is = bis;
        }
 
        public int read() throws IOException {
            return is.read();
        }
 
        public int read(byte[] b) throws IOException {
            return is.read(b);
        }
    }
 
    public static String getBody(HttpServletRequest request) throws IOException {
        String body = null;
        BufferedReader br= null;
       StringBuilder sb= new StringBuilder();
        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
               br = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = br.read(charBuffer)) > 0) {
                   sb.append(charBuffer, 0, bytesRead);
                }
              
            } else {
               sb.append("");
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (br!= null) {
                try {
                   br.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
        body = sb.toString();
        return body;
    }
}