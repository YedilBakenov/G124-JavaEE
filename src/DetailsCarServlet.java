import db.Car;
import db.DBConnector;
import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/car-details")
public class DetailsCarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        request.setAttribute("mashina", DBConnector.getCarById(id));
        request.setAttribute("goroda", DBConnector.getAllCities());

        request.getRequestDispatcher("/html/car-details.jsp").forward(request, response);
    }
}
