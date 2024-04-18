import db.Car;
import db.City;
import db.DBConnector;
import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-car")
public class AddCarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("goroda", DBConnector.getAllCities());
        request.getRequestDispatcher("/html/add-car.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String model = request.getParameter("carModel");
        String country = request.getParameter("carCountry");
        double volume = Double.parseDouble(request.getParameter("carVolume"));
        String color = request.getParameter("carColor");
        int price = Integer.parseInt(request.getParameter("carPrice"));
        int city_id = Integer.parseInt(request.getParameter("car_city_id"));

        City city = DBConnector.getCityById(city_id);

        Car car = new Car();
        car.setColor(color);
        car.setCountry(country);
        car.setPrice(price);
        car.setVolume(volume);
        car.setModel(model);
        car.setCity(city);

        DBConnector.addCar(car);

        response.sendRedirect("/main");
    }
}
