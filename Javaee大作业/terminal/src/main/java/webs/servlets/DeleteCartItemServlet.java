package webs.servlets;

import daos.MerchandiseDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/deleteItem")
public class DeleteCartItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入删除购物车商品Servlet...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //获取参数
        String user_id = req.getParameter("user_id");
        String merName = req.getParameter("merName");
        String time_ = req.getParameter("time_");
        System.out.println("user_id: "+user_id+",merName: "+merName+",time_: "+time_);

        //调用Dao层执行
        MerchandiseDao merchandiseDao = new MerchandiseDao();
        boolean b = merchandiseDao.deleteItem(user_id, merName, time_);
        out.print(b);
    }
}
