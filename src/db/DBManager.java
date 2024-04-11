package db;

import java.util.ArrayList;
public class DBManager {

    public static ArrayList<Student> students = new ArrayList<>();

    static {
        students.add(new Student("Yedil", "Bakenov", 8.0));
        students.add(new Student("Serik", "Serikov", 7.0));
        students.add(new Student("Berik", "Berikov", 6.0));
    }

    public static void addStudent(Student student){
        students.add(student);
    }
}
