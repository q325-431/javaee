package webs.servlets;

import daos.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/signServlet")
public class SignServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入注册服务器:");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        //获取传来的数据
        String email_phone = req.getParameter("email_phone");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        System.out.println("开始注册 : ");
        //调用dao层注册
        UserDao userDao = new UserDao();
        System.out.println("new 了对象");
        System.out.println("email_phone: "+email_phone+",passowrd: "+password+",remember: "+remember);
        boolean b = userDao.signUser(email_phone, password);
        if(b&&remember.equals("true")){
            //记住密码
        }
        out.print(b);
    }
}
