package cn.swu.Listerner;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener

public class MyHttpListen implements HttpSessionListener, ServletContextListener {
    private static int count=-1;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().setAttribute("Count",0);
        //System.out.println(count);
    }


    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        //System.out.println("我是你爸爸");
        ServletContext servletContext = httpSessionEvent.getSession().getServletContext();

        //count = (Integer) servletContext.getAttribute("Count");

        //System.out.println(count);


        count++;
        servletContext.setAttribute("Count",count);

        if((Integer) servletContext.getAttribute("Count") <= 1){
            servletContext.setAttribute("Count",1);
        }

        //System.out.println(count);

        /*

        count++;
        httpSessionEvent.getSession().getServletContext().setAttribute("Count",count);

         */


    }


    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        /*
        if (count>=1){
            count--;
        }
        httpSessionEvent.getSession().getServletContext().setAttribute("Count",count);

         */

        ServletContext servletContext = httpSessionEvent.getSession().getServletContext();
        //count = (Integer) servletContext.getAttribute("Count");
        count--;
        if(count <= 1){
            servletContext.setAttribute("Count",1);
        }
        else{
            servletContext.setAttribute("Count",count);
        }
        //System.out.println(count);


    }


    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }


}
