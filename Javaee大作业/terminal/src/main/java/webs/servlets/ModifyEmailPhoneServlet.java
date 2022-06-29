package webs.servlets;

import beans.User;
import daos.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/modifyEmailPhoneServlet")
public class ModifyEmailPhoneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入修改手机Servlet...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //获取参数
        String user_id = req.getParameter("user_id");
        String email_phone = req.getParameter("email_phone");
        System.out.println(user_id+","+email_phone);

        //调用dao层修改
        UserDao userDao = new UserDao();
        boolean b = userDao.modifyEmailPhone(user_id, email_phone);
        User user = userDao.findUserByUID(user_id);
        req.getSession().setAttribute("user",user);
        out.print(b);
        System.out.println("modifyPhone: "+b);
    }
}
