import db.Comment;
import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/details-news")
public class DetailsNewsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("news", DBConnector.getNewsById(id));
        request.setAttribute("comments", DBConnector.getAllCommentsByNewsId(id));

        for(Comment comment: DBConnector.getAllCommentsByNewsId(id)){
            System.out.println(comment.getUser().getId());
        }

        request.getRequestDispatcher("/html/news-details.jsp").forward(request, response);
    }
}
