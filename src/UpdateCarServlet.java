import db.Car;
import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/car-update")
public class UpdateCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String model = request.getParameter("carModel");
        String country = request.getParameter("carCountry");
        double volume = Double.parseDouble(request.getParameter("carVolume"));
        String color = request.getParameter("carColor");
        int price = Integer.parseInt(request.getParameter("carPrice"));
        int id = Integer.parseInt(request.getParameter("id"));

        Car car = new Car();
        car.setId(id);
        car.setColor(color);
        car.setCountry(country);
        car.setPrice(price);
        car.setVolume(volume);
        car.setModel(model);

        DBConnector.updateCar(car);

        response.sendRedirect("/main");
    }
}
