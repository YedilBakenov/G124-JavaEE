import db.City;
import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/city-update")
public class UpdateCityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("cityName");
        String region = request.getParameter("cityRegion");
        int city_id = Integer.parseInt(request.getParameter("id"));

        City city = new City();
        city.setId(city_id);
        city.setRegion(region);
        city.setCity_name(name);

        DBConnector.updateCity(city);

        response.sendRedirect("/all-cities");
    }
}
