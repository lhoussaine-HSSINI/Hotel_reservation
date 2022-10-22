package controller;

import Config.DB;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChambreServlet", value = "/ChambreServlet")
public class ChambreServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String Type_chambre = request.getParameter("Type_chambre");
        int Prix = Integer.parseInt(request.getParameter("Prix"));
        int Promo = Integer.parseInt(request.getParameter("Promo"));
        try (PrintWriter out = response.getWriter()) {
                out.println("information <br>");
                out.println("<br> Type chambre : "+Type_chambre);
                out.println("<br> Prix : "+Prix);
                out.println("<br> Promo : "+Promo);
        }
    }
}
