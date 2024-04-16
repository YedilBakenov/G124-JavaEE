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
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM cars ORDER BY id ASC");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Car car = new Car();
                car.setId(resultSet.getInt("id"));
                car.setModel(resultSet.getString("model"));
                car.setVolume(resultSet.getDouble("volume"));
                car.setPrice(resultSet.getInt("price"));
                car.setCountry(resultSet.getString("country"));
                car.setColor(resultSet.getString("color"));
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
                  "country, color) VALUES (?, ?, ?, ?, ?)");
          statement.setString(1, car.getModel());
          statement.setDouble(2, car.getVolume());
          statement.setInt(3, car.getPrice());
          statement.setString(4, car.getCountry());
          statement.setString(5, car.getColor());

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
                    "color = ?, price = ?, volume = ?, model = ?, country = ? WHERE id = ? ");

            statement.setString(1, car.getColor());
            statement.setInt(2, car.getPrice());
            statement.setDouble(3, car.getVolume());
            statement.setString(4, car.getModel());
            statement.setString(5, car.getCountry());
            statement.setInt(6, car.getId());

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
}
