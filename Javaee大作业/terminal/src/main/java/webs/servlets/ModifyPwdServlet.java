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

@WebServlet("/modifyPwdServlet")
public class ModifyPwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入修改密码Servlet...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //获取参数
        String email = req.getParameter("email");
        String old_password = req.getParameter("old_password");
        String new_password = req.getParameter("new_password");
        System.out.println("email: "+email+",old_password: "+old_password+",new_password: "+new_password);

        //验证登录
        UserDao userDao = new UserDao();
        User user = userDao.login(email, old_password);
        if(user==null){
            out.print("原密码错误");
            return;
        }
        //修改密码
        boolean b = userDao.modifyPassword(email, new_password);
        if(b){
            out.print("修改成功,请重新登录");
            req.getSession().removeAttribute("user");
            req.getSession().removeAttribute("isLogin");
        }else{
            out.print("服务器错误,代码9821");
        }
    }
}
