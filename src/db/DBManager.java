package db;

import java.util.ArrayList;

public class DBManager {

    public static ArrayList<Car> cars = new ArrayList<>();

    private static int id = 5;

//    static {
//        cars.add(new Car(1, "Toyota Camry 75", "Japan", 2.5, "red", 35000));
//        cars.add(new Car(2, "Toyota Land Cruiser", "Japan", 4.0, "black", 100000));
//        cars.add(new Car(3, "BMW X6", "Germany", 3.0, "red", 900000));
//        cars.add(new Car(4, "BMW X5", "Germany", 4.0, "silver", 100000));
//    }

    public static void addCar(Car car) {
        car.setId(id);
        id++;
        cars.add(car);
    }

    public static ArrayList<Car> getCars() {
        return cars;
    }

    public static Car getCarById(int id) {
        return cars.stream().filter(s -> s.getId() == id).findFirst().orElse(null);
    }
}
