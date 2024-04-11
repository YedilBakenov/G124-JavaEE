import db.DBManager;
import db.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(value = "/student-info")
public class InfoStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("studentName");
        String surname = request.getParameter("studentSurname");
        double gpa = Double.parseDouble(request.getParameter("studentGpa"));

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        out.print("<h1 style='color: red'>"+ name + "</h1>");
        out.print("<h1 style = 'color: green'>"+ surname + "</h1>");
        out.print("<h1>"+ gpa + "</h1>");


    }
}
