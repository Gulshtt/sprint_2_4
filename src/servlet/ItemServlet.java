package servlet;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/items")
public class ItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Item> items = DBManager.getAllItems();
        req.setAttribute("items", items);
        req.getRequestDispatcher("itemsPage.jsp").forward(req,resp);
    }
}
