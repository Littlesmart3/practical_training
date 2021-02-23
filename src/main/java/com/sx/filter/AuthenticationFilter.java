package com.sx.filter;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.web.dto.UserDTO;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(value = "/*")
public class AuthenticationFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;

        String m = request.getParameter("method");

        String method = request.getMethod().toUpperCase();

        //System.out.println("filter : " + m);

        if (method.equals("POST")) {

            if (!m.equals("login") && !m.equals("signup") && !m.equals("vaild")) {

                HttpSession session = request.getSession();

                UserDTO user = (UserDTO) session.getAttribute("user");

                //System.out.println("filter -> post : " + user);

                if (user == null) {

                    servletResponse.setContentType("text/html;charset=utf-8");

                    PrintWriter out = servletResponse.getWriter();

                    out.println(ApiResponse.ofStatus(Status.NOT_LOGIN));

                    out.flush();

                    out.close();

                    return;
                }

                //System.out.println("filter : safe");
            }
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
