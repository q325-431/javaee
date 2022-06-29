package webs.servlets;

import daos.OrderDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/buyServlet")
public class BuyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入BuyServlet...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //获取参数
        String user_id = req.getParameter("user_id");
        String status = req.getParameter("status");
        String merID = req.getParameter("merID");
        Integer cnt = Integer.parseInt(req.getParameter("cnt"));

        //调用Dao层
        OrderDao orderDao = new OrderDao();
        boolean b = orderDao.buyItem(user_id, merID, status, cnt);
        out.print(b);
    }
}
