package webs.servlets;

import beans.Order;
import beans.User;
import daos.OrderDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/orders.jsp")
public class InitOrderServlet extends HttpServlet {
    private List<Order> unPay;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入初始化订单Servlet...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        //获取参数
        String user_id = "";
        if (((User) (req.getSession().getAttribute("user"))) != null) {
            user_id = ((User) (req.getSession().getAttribute("user"))).getUser_id();
        }
        int start = 0, top_index = -1;
        String startStr = req.getParameter("start");
        if (startStr != null) {
            start = Integer.parseInt(startStr);
        }
        String top_indexStr = req.getParameter("top_index");
        if (top_indexStr != null) {
            top_index = Integer.parseInt(top_indexStr);
        }
        List<Order> unPay = null;
        List<Order> receive = null;
        List<Order> prise = null;
        List<Order> already = null;
        List<Order> mySale = null;
        int size=0;
        //调用Dao层
        OrderDao orderDao = new OrderDao();
        if(top_index==-1){
            System.out.println("top_index==-1");
            //未付款
            System.out.println("start : " + start);
            unPay = orderDao.findAbout(user_id, "未付款", start);
            //待收货
            receive = orderDao.findAbout(user_id, "待收货", start);
            //待评价
            prise = orderDao.findAbout(user_id, "待评价", start);
            //已完成
            already = orderDao.findAbout(user_id, "已完成", start);
            //我的售卖
            mySale = orderDao.findAbout(user_id, "我的售卖", start);
            size = orderDao.getSize(user_id,"未付款");
        }
        if (top_index == 1) {
            System.out.println(top_index+"  "+start);
            size = orderDao.getSize(user_id,"未付款");
            unPay = orderDao.findAbout(user_id, "未付款", start);
        } else if (top_index == 2) {
            size = orderDao.getSize(user_id,"待收货");
            receive = orderDao.findAbout(user_id, "待收货", start);
        } else if (top_index == 3) {
            size = orderDao.getSize(user_id,"待评价");
            prise = orderDao.findAbout(user_id, "待评价", start);
        } else if (top_index == 4) {
            size = orderDao.getSize(user_id,"已完成");
            already = orderDao.findAbout(user_id, "已完成", start);
        } else if (top_index == 5) {
            size = orderDao.getSize(user_id,"我的售卖");
            mySale = orderDao.findAbout(user_id, "我的售卖", start);
        }
        //写入页数
        System.out.println("size: "+size);
        req.setAttribute("size",size%5==0?size/5:size/5+1);
        //未付款
        req.setAttribute("unPay", unPay);
        //待收货
        req.setAttribute("receive", receive);
        //待评价
        req.setAttribute("prise", prise);
        //已完成
        req.setAttribute("already", already);
        //我的售卖
        req.setAttribute("mySale", mySale);
        //当前页
        req.setAttribute("start",start);
        req.setAttribute("index",(start/5+1));
        req.setAttribute("top_index",top_index);
        //转发
        req.getRequestDispatcher("/order.jsp").forward(req, resp);
    }
}
