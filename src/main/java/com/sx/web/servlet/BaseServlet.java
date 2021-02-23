package com.sx.web.servlet;


import com.alibaba.fastjson.JSON;
import com.sx.base.ApiResponse;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class BaseServlet extends HttpServlet {

    public HttpSession session;

    public HttpServletRequest request;

    public HttpServletResponse response;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.session = request.getSession();

        this.request = request;

        this.response = response;

        request.setCharacterEncoding("utf-8");

        response.setContentType("text/html;charset=utf-8");

        HashMap<String, Object> params = new HashMap<>();

        request.getParameterMap().keySet().forEach(key -> {
            params.put(key, request.getParameter(key));
        });


        try {
            String executeMethod = this.request.getParameter("method");

            Class claz = this.getClass();

            Method method = claz.getDeclaredMethod(executeMethod, Map.class);
            //System.out.println("servlet : " + method);

            method.setAccessible(true);

            ApiResponse result = (ApiResponse) method.invoke(this, params);

            PrintWriter out = response.getWriter();

            out.write(result.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
