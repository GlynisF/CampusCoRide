package com.campuscoride.util;

import com.campuscoride.entity.Student;
import com.campuscoride.persistence.GenericDao;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(
        name = "authServlet",
        urlPatterns = {"/auth", "/signup"}
    )
public class Auth extends HttpServlet {
    private final Logger logger = LogManager.getLogger(this.getClass());
    private GenericDao<Student> studentDao;

    public Auth() {
        studentDao = new GenericDao<>(Student.class);

    }


    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NumberFormatException {
        if (req.getRequestURI().endsWith("/signup")) {
            try {
                Student student = new Student(
                        req.getParameter("firstName"), req.getParameter("lastName"),
                        req.getParameter("email"), req.getParameter("password"),
                        Integer.parseInt(req.getParameter("studentId")));

                Student insertedStudent = studentDao.insert(student);
                logger.info(student);

                HttpSession session = req.getSession();
                session.setAttribute("student", insertedStudent);

                RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
                dispatcher.forward(req, resp);

            } catch (NumberFormatException e) {
                logger.error(e);
            }
        } else if (req.getRequestURI().endsWith("/auth")) {
            List<Student> students = studentDao.getAll();
            Map<String, Object> map = new HashMap<>();
            map.put("email", students.get(0).getEmail());
            map.put("password", students.get(0).getPassword());
            List<Student> foundStudent = studentDao.findByPropertyMapEqual(map);
        }
    }
}
