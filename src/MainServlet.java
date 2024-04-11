import db.DBManager;
import db.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(value = "/main")
public class MainServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.print("<html>");
        out.print("<head>");
        out.print("<meta charset=\"UTF-8\">");
        out.print("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">");
        out.println("</head>");
        out.print("<body>");
        out.print("<table class = 'table table-striped '>");
        out.print("<thead>");
        out.print("<tr>");
        out.print("<th>NAME</th>");
        out.print("<th>SURNAME</th>");
        out.print("<th>GPA</th>");
        out.print("</tr>");
        out.print("</thead>");
        out.print("<tbody>");

        for(Student st: DBManager.students){
            out.print("<tr>");
            out.print("<td>" + st.name + "</td>");
            out.print("<td>" + st.surname + "</td>");
            out.print("<td>" + st.gpa + "</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        out.print("</tbody>");
        out.print("<br>");

        out.print("<form action='/student-info' method ='get'>");
        out.print("<label class ='mb-3'>NAME: </label>");
        out.print("<input type ='text' name = 'studentName' class='form-control w-50 mb-3'>");
        out.print("<label class ='mb-3'>SURNAME: </label>");
        out.print("<input type ='text' name ='studentSurname' class='form-control w-50 mb-3'>");
        out.print("<label class ='mb-3'>GPA: </label>");
        out.print("<input type ='number' name = 'studentGpa' class='form-control w-50 mb-3'> ");
        out.print("<button>ADD STUDENT</button>");
        out.print("</form>");

        out.print("</body>");
        out.print("</html>");



    }
}
