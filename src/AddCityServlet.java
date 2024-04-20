import db.City;
import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-city")
public class AddCityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cityName = request.getParameter("cityName");
        String region = request.getParameter("cityRegion");

        City city = new City();
        city.setRegion(region);
        city.setCity_name(cityName);

        DBConnector.addCity(city);

        response.sendRedirect("/all-cities");
    }
}
