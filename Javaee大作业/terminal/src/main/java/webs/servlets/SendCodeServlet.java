package webs.servlets;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/sendCodeServlet")
public class SendCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入发送验证码");
        //设置数据格式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();

        //生成验证码
        long code = generateCode();
        //获取邮件或电话
        String email_phone = req.getParameter("email_phone");
        System.out.println("email_phone : " + email_phone);
        if (email_phone.indexOf('@') == -1) {
            //发送手机验证码
            System.out.println("即将发送手机验证码");
            //发送手机验证码
            boolean b = sendPhone(email_phone, code);
            if (b)
                out.print(code);
            else
                out.print("验证码发送失败");
            System.out.println("发送完成");
        } else {
            System.out.println("即将发送邮箱验证码");
            //发送邮箱验证码
            boolean b = sendEmail(email_phone, code);
            if (b)
                out.print(code);
            else
                out.print("验证码发送失败");
            System.out.println("发送完成");
        }
    }

    private boolean sendEmail(String emailAddress, long code) {
        SimpleEmail email = new SimpleEmail();
        email.setHostName("smtp.email.ncu.edu.cn");//设置邮箱服务器
        email.setAuthentication("yfuxzpskbr@email.ncu.edu.cn", "Wjh001025");//设置用户名和密码
        try {
            email.addTo(emailAddress);//收件人
            email.setFrom("yfuxzpskbr@email.ncu.edu.cn");//发件人
            email.setSubject("计院小黑市注册验证码");//邮件主题
            email.setMsg("[计院小黑市]您的验证码为:" + code + ",请在两分钟内完成验证");//邮件内容
            System.out.println("验证码为 : " + code);
            email.send();//发送邮件
            return true;

        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean sendPhone(String mobile, long code) {
        int appID = 1400517293;
        String appKey = "02ae3cfde868c1b632fd9f3e21209406";
//        appKey = "";
        int templateID = 947528;
        String smsSign = "yfuxTest公众号";
        try {
            String[] params = {Long.toString(code), "2"};
            System.out.println("验证码为 : " + code);
            SmsSingleSender sender = new SmsSingleSender(appID, appKey);
            SmsSingleSenderResult result = sender.sendWithParam("86", mobile,
                    templateID, params, smsSign, "", "");
            System.out.println(result);
            if (result.errMsg.equals("OK"))
                return true;
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private long generateCode() {
        //[0,1)*899999 ==> [0,899999)+100000==> [100000,999999)
        long round = (Math.round(Math.random() * 899999 + 100000));
        return round;
    }
}
