import db.DBManager;
import db.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(value = "/add-student")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("studentName");
        String surname = request.getParameter("studentSurname");
        double gpa = Double.parseDouble(request.getParameter("studentGpa"));

        Student student = new Student();
        student.setName(name);
        student.setSurname(surname);
        student.setGpa(gpa);

        DBManager.addStudent(student);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.print("<h1>HELLO WORLD!</h1>");
    }
}
