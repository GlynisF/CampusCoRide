package com.campuscoride.controller;

import com.campuscoride.util.PropertiesLoader;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.Properties;

@WebServlet(
        name="applicationStartup",
        urlPatterns = {"/appStartup"},
        loadOnStartup = 1
)

public class ApplicationStartup<T> extends HttpServlet implements PropertiesLoader {
    private Properties properties;
  ;

    @Override
    public void init() throws ServletException {
        properties = new Properties(loadProperties("/database.properties"));
        ServletContext context = getServletContext();
        context.setAttribute("database", properties);
    }

}