import db.DBConnector;
import db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(value = "/authorization")
public class AuthorizationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = DBConnector.getUserByEmail(email);

        boolean flag = false;

        for(User user1: DBConnector.getAllUsers()){
            if(user1.getEmail().equals(email)){
                flag = true;
            }
        }

        if(!flag){
            response.sendRedirect("/html/403.jsp");
        } else if(user.getPassword().equals(password) && user.getEmail().equals(email)){
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            request.getRequestDispatcher("/register").forward(request, response);
        } else {
            response.sendRedirect("/html/403.jsp");
        }
    }
}
