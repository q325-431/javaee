package webs.servlets;

import daos.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/checkEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入检测");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");

        //获取参数email_phone
        String email_phone = req.getParameter("email_phone");
        System.out.println("email_phone : "+email_phone);

        //调用dao层进行查询
        UserDao userDao = new UserDao();
        boolean checkUser = userDao.checkUser(email_phone);
        PrintWriter writer = resp.getWriter();
        System.out.println(checkUser);
        writer.print(checkUser);
    }
}
