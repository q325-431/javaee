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

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入登录服务器...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        //获取数据
        String email_phone = req.getParameter("email_phone");
        String password = req.getParameter("password");
        System.out.println("user: " + email_phone + ",password: " + password);

        //调用dao层进行处理
        //先检测用户是否被注册
        UserDao userDao = new UserDao();
        if (!userDao.checkUser(email_phone) && !userDao.checkUser3(email_phone)) {
            out.print("用户名不存在");
        } else {
            //用户名存在检测密码
            User user = userDao.login(email_phone, password);
            if (user != null) {
                System.out.println("登录成功");
                out.print("登录成功");
                req.getSession().setAttribute("user", user);
                req.getSession().setAttribute("isLogin",true);
            } else {
                out.print("密码错误");
            }
        }
    }
}
