import db.DBConnector;
import db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(value = "/registration-user")
public class RegistrationUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.sendRedirect("/html/register-user.jsp");
    }

    protected void doPost(HttpServletRequest request,   HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("passwordRetype");

        User user = new User();
        boolean check = false;

        ArrayList<User>users = DBConnector.getAllUsers();

        for (User user1: users){
            if (user1.getEmail().equals(email)){
                check = true;
            }
        }

        if(password.equals(rePassword) && !check){
            user.setEmail(email);
            user.setPassword(password);
            user.setRole_id(2);
            DBConnector.addUser(user);
            response.sendRedirect("/");
        }
        else response.sendRedirect("/html/403-2.jsp");
    }
}
