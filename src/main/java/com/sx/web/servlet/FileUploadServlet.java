package com.sx.web.servlet;

import com.sx.base.ApiResponse;
import com.sx.base.Status;
import com.sx.utils.FileUtil;
import com.sx.web.dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet("/upload")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    @Override
    public void init() {

        FileUtil.createDir();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        PrintWriter out = resp.getWriter();

        req.setCharacterEncoding("utf-8");

        resp.setContentType("text/html;charset=utf-8");

        try {

            Part part = req.getPart("file");

            String header = part.getHeader("content-disposition");

            String path = header.substring(header.indexOf("filename=") + 10, header.length() - 1);

            int idx = path.replaceAll("\\\\", "/").indexOf("/");

            String fileName = path.substring(idx + 1);

            String ext = fileName.substring(fileName.lastIndexOf("."));

            String uid = UUID.randomUUID().toString() + "." + ext;

            String result = FileUtil.saveFile(uid, part.getInputStream());

            if(result != null){

                HttpSession session = req.getSession();

                session.setAttribute(fileName.substring(0, fileName.lastIndexOf(".") - 1), result);

                out.println(ApiResponse.ofSuccess(null));

            }else {
                out.println(ApiResponse.ofStatus(Status.BAD_REQUEST).toString());
            }

        } catch (Exception e) {

            e.printStackTrace();

            out.println(ApiResponse.ofStatus(Status.BAD_REQUEST).toString());

        } finally {

            out.flush();

            out.close();

        }


    }
}
