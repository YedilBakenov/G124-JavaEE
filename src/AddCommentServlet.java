import db.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/add-comment")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user =(User)request.getSession().getAttribute("currentUser");

        String news_comment = request.getParameter("news_comment");
        int news_id = Integer.parseInt(request.getParameter("news_id"));
        int user_id = Integer.parseInt(request.getParameter("user_id"));

        User user1 = DBConnector.getUserById(user_id);

        News news = DBConnector.getNewsById(news_id);

        Comment comment = new Comment();
        comment.setContent_comment(news_comment);
        comment.setUser(user1);
        comment.setNews(news);

        DBConnector.addComment(comment);

        response.sendRedirect("/details-news?id=" + news_id);
    }
}
