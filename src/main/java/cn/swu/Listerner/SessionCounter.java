package cn.swu.Listerner;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//本机获取到两个IP,困扰很久,后来增加输出语句调试,发现有一个IP是ipv6,意识到程序并没有问题

@WebListener

public class SessionCounter implements HttpSessionListener,ServletRequestListener {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    private static int activeSessions = 0;//当前活动的人数
    private HttpServletRequest request;
    private static ArrayList list = new ArrayList();//用来存放不同ip的地址


    public void init() throws ServletException {

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        HttpSession session = request.getSession();
    }

    public void destroy() {
    }
    @Override
    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {

    }

    public void requestInitialized(ServletRequestEvent sre){
        request=(HttpServletRequest)sre.getServletRequest();
    }

    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        boolean rs = true;
        if(list.size() > 0){
            for(int i = 0;i < list.size(); i ++){
                if(loginIp.equals(list.get(i))){
                    rs = false;
                }
            }
        }
        if(rs){                      //如果队列中存在相同的IP 则SESSION不增加
            list.add(loginIp);
            System.out.println("ipList队列新增ip: "+loginIp);
            activeSessions++;
            System.out.println("新增SESSION,sessionId = " + sessionId +"; createTime = " + createTime
                    + "; loginIp = " + loginIp +"; 当前总SESSION值为 "+activeSessions);
        }
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        String sessionId = httpSessionEvent.getSession().getId();
        Timestamp overTime = new Timestamp(System.currentTimeMillis());
        String loginIp = request.getRemoteAddr();
        if(activeSessions>0){
            activeSessions--;
            if(list.size() > 0){     //在用户销毁的时候,从队列中踢出这个IP
                for(int i = 0;i < list.size(); i ++){
                    if(loginIp.equals(list.get(i))){
                        list.remove(i);
                        System.out.println("ipList队列移除ip: "+loginIp);
                    }
                }
            }

            System.out.println("销毁SESSION,sessionId = " + sessionId +"; overTime = " + overTime
                    + "; loginIp = " + loginIp +"; 当前总SESSION值为 "+activeSessions);
        }
    }

    public static int getActiveSessions() {
        return activeSessions;
    }

    public void setActiveSessions(int i) {
        activeSessions = i;
    }

}