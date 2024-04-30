import db.Car;
import db.City;
import db.DBConnector;
import db.News;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/update-news")
public class UpdateNewsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newsTitle = request.getParameter("newsTitle");
        String newsContent = request.getParameter("newsContent");
        int id = Integer.parseInt(request.getParameter("newsId"));

        News news = DBConnector.getNewsById(id);

        news.setTitle(newsTitle);
        news.setContent(newsContent);

        DBConnector.updateNews(news);

        response.sendRedirect("/details-news?id=" + id);
    }
}
