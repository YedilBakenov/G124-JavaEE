import db.City;
import db.DBConnector;
import db.News;
import db.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-news")
public class AddNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int author_id = Integer.parseInt(request.getParameter("user_id"));
            News news = new News();
            news.setTitle(title);
            news.setContent(content);

            User user = DBConnector.getUserById(author_id);

            news.setUser(user);

            DBConnector.addNews(news);

            response.sendRedirect("/all-news");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User currentUser =(User) request.getSession().getAttribute("currentUser");

        if(currentUser==null){
            response.sendRedirect("/html/403.jsp");
        }
    }
}
