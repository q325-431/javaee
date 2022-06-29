package webs.servlets;

import beans.Merchandise;
import daos.MerchandiseDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/index.jsp")
public class InitIndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入了初始化index.jsp...");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //调用Dao层查询
        MerchandiseDao merchandiseDao = new MerchandiseDao();
        //查找各类书籍
        List<Merchandise> booksList = merchandiseDao.findAbout("各类书籍");
        req.setAttribute("booksList",booksList);
        //查找文具用品
        List<Merchandise> stationeryList = merchandiseDao.findAbout("文具用品");
        req.setAttribute("stationeryList",stationeryList);
        //查找运动器材
        List<Merchandise> sportsList = merchandiseDao.findAbout("运动器材");
        req.setAttribute("sportsList",sportsList);
        //查找床上用品
        List<Merchandise> beddingList = merchandiseDao.findAbout("床上用品");
        req.setAttribute("beddingList",beddingList);
        //查找穿搭物品
        List<Merchandise> clothesList = merchandiseDao.findAbout("穿搭物品");
        req.setAttribute("clothesList",clothesList);
        //查找数码物品
        List<Merchandise> digitalList = merchandiseDao.findAbout("数码物品");
        req.setAttribute("digitalList",digitalList);
        //查询其他物品
        List<Merchandise> othersList = merchandiseDao.findAbout("");
        req.setAttribute("othersList",othersList);
        req.getRequestDispatcher("main.jsp").forward(req,resp);
    }
}
