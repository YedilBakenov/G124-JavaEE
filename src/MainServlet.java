import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet(value = "/main")
public class MainServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
           request.setAttribute("mashinki", DBConnector.getAllCars());
           request.setAttribute("goroda", DBConnector.getAllCities());
           request.getRequestDispatcher("/html/main.jsp").forward(request, response);
    }
}
