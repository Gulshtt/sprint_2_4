package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

import java.io.IOException;

@WebServlet(value = "/updateTask")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("taskName");
        String desc = req.getParameter("description");
        String amount = req.getParameter("myDate");
        String statestr = req.getParameter("isDone");
        boolean state = false;
        if (statestr.equals("on")){
            state = true;
        }
        Item item = new Item(Long.valueOf(id), name, desc, amount, state);
        DBManager.updateItem(item);
        resp.sendRedirect("/items");
    }
}
