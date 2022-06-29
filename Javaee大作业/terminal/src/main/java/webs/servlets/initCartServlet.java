package webs.servlets;

import beans.Cart;
import beans.User;
import daos.CartDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/purchaseCart.jsp")
public class initCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("初始化购物车...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");

        //调用Dao层
        CartDao cartDao = new CartDao();
        String user_id="";
        if(((User) (req.getSession().getAttribute("user")))!=null){
            user_id = ((User) (req.getSession().getAttribute("user"))).getUser_id();
        }
        List<Cart> cartList = cartDao.findAll(user_id);
        req.setAttribute("cartList",cartList);
        //获取总个数
        int size = cartDao.getSize(user_id);
        req.setAttribute("cartSize",size);
        req.getRequestDispatcher("shoppingCar.jsp").forward(req,resp);
    }
}
