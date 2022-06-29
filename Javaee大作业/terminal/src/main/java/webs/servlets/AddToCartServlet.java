package webs.servlets;

import daos.MerchandiseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入加入购物车...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //获取参数
        String user_id = req.getParameter("user_id");
        String merName = req.getParameter("merName");
        Double merPrice = Double.parseDouble(req.getParameter("merPrice"));
        Integer cnt = Integer.parseInt(req.getParameter("cnt"));
        System.out.println("user_id : " + user_id + ",merName : " + merName + ",merPrice : "
                + merPrice + ",cnt : " + cnt);

        //调用Dao层
        MerchandiseDao merchandiseDao = new MerchandiseDao();
        boolean b = merchandiseDao.addToCart(user_id, merName, merPrice, cnt);
        System.out.println(b);
        out.print(b);
    }
}
