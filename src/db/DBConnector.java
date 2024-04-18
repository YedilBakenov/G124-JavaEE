package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnector {

    private static Connection connection;
    private static String url = "jdbc:postgresql://localhost:5432/g124";
    private static String login = "postgres";
    private static String password = "postgres";

    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, login, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static ArrayList<Car> getAllCars() {
        ArrayList<Car> cars = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * " +
                    "FROM cars c " +
                    "INNER JOIN cities c2 " +
                    "ON c.city_id = c2.id " +
                    "ORDER BY c.id ASC ");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setModel(resultSet.getString("model"));
                car.setVolume(resultSet.getDouble("volume"));
                car.setPrice(resultSet.getInt("price"));
                car.setCountry(resultSet.getString("country"));
                car.setColor(resultSet.getString("color"));

                City city = new City();
                city.setId(resultSet.getInt("city_id"));
                city.setRegion(resultSet.getString("region"));
                city.setCity_name(resultSet.getString("city_name"));

                car.setCity(city);

                cars.add(car);
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return cars;
    }

    public static void addCar(Car car){
        try{
          PreparedStatement statement = connection.prepareStatement("INSERT INTO cars (model,volume, price, " +
                  "country, color, city_id) VALUES (?, ?, ?, ?, ?, ?)");
          statement.setString(1, car.getModel());
          statement.setDouble(2, car.getVolume());
          statement.setInt(3, car.getPrice());
          statement.setString(4, car.getCountry());
          statement.setString(5, car.getColor());
          statement.setInt(6, car.getCity().getId());

          statement.executeUpdate();
          statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static Car getCarById(int id){
        Car car = new Car();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM cars WHERE id = ? ");
            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                car.setId(resultSet.getInt("id"));
                car.setColor(resultSet.getString("color"));
                car.setVolume(resultSet.getDouble("volume"));
                car.setPrice(resultSet.getInt("price"));
                car.setModel(resultSet.getString("model"));
                car.setCountry(resultSet.getString("country"));

                statement.close();
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return car;
    }

    public static void updateCar(Car car) {

        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE cars SET " +
                    "color = ?, price = ?, volume = ?, model = ?, country = ?, city_id = ?  WHERE id = ? ");

            statement.setString(1, car.getColor());
            statement.setInt(2, car.getPrice());
            statement.setDouble(3, car.getVolume());
            statement.setString(4, car.getModel());
            statement.setString(5, car.getCountry());
            statement.setInt(6, car.getCity().getId());
            statement.setInt(7, car.getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteCar(int id) {
        try{

            PreparedStatement statement = connection.prepareStatement("DELETE FROM cars WHERE id = ? ");
            statement.setInt(1, id);

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<City> getAllCities() {
        ArrayList<City> cities = new ArrayList<>();

        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM cities");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                City city = new City();
                city.setId(resultSet.getInt("id"));
                city.setCity_name(resultSet.getString("city_name"));
                city.setRegion(resultSet.getString("region"));

                cities.add(city);
            }

            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

        return cities;
    }

    public static City getCityById(int cityId) {
        City city = new City();

        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM cities WHERE id = ? ");
            statement.setInt(1, cityId);

            ResultSet resultSet = statement.executeQuery();

            if(resultSet.next()){
                city.setId(resultSet.getInt("id"));
                city.setCity_name(resultSet.getString("city_name"));
                city.setRegion(resultSet.getString("region"));

                statement.close();
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return city;
    }
}
