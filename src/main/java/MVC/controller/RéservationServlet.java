package MVC.controller;

import MVC.metier.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import static java.lang.System.out;

@WebServlet(name = "RéservationServlet", value = "/RéservationServlet")

public class RéservationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
//            out.println("get");
//            out.println(request.getServletPath().substring(1));
            
            if (request.getServletPath().substring(1).equals("Home") || request.getServletPath().substring(1).equals("home")){
                out.println("page home");
            } else if (request.getServletPath().substring(1).equals("reservation") || request.getServletPath().substring(1).equals("Reservation")) {
                out.println("page reservation");
            }
        } finally {
            out.close();
        }

//        request.getRequestDispatcher("Reservationuser.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Operation_reservation op = new Operation_reservation();
        double prix_reservation = 0;
        PrintWriter out = response.getWriter();
        try {
            int le_petit_déjeuner = (request.getParameter("le_petit_déjeuner")) == null ? 0 : 1;
            out.println(le_petit_déjeuner);
            prix_reservation+=le_petit_déjeuner*12;
            int déjeuner = (request.getParameter("déjeuner")) == null ? 0 : 1;
            out.println(déjeuner);

            prix_reservation+=déjeuner*20;
            int dîner = (request.getParameter("dîner")) == null ? 0 : 1;
            out.println(dîner);
            prix_reservation+=dîner*10;
            int fruits = (request.getParameter("fruits")) == null ? 0 : 1;
            prix_reservation+=fruits*13;
            int musique = (request.getParameter("musique")) == null ? 0 : 1;
            prix_reservation+=musique*9;
            int spa = (request.getParameter("spa")) == null ? 0 : 1;
            prix_reservation+=spa*24;
            int massage = (request.getParameter("massage")) == null ? 0 : 1;
            prix_reservation+=massage*13;
            int soin = (request.getParameter("soin")) == null ? 0 : 1;
            prix_reservation+=soin*8;
            int Excursion = (request.getParameter("Excursion")) == null ? 0 : 1;
            prix_reservation+=Excursion*120;
            String residence_date = request.getParameter("residence_date");
            String exit_date = request.getParameter("exit_date");
            int id_chambre = Integer.parseInt(request.getParameter("id_chambre"));
            int id_user = Integer.parseInt(request.getParameter("id_user"));
            int days_reserve = Integer.parseInt(request.getParameter("days_reserve"));
            int prix_chambre = Integer.parseInt(request.getParameter("Prix"))*days_reserve;
            int Numbre_persone =1;

            prix_reservation+=prix_chambre;

            op.addextra(new Extras_réservation(le_petit_déjeuner, déjeuner,  dîner,  fruits,  musique,  spa,  massage,  soin,  Excursion));
            op.add(new Reservation(1, 2, id_chambre,Numbre_persone, residence_date, exit_date, "nom","nom","nom","nom","nom", prix_reservation, 1));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            out.close();
        }
//        try {
////            op.edit(id_edit, type_chambre_edit, prix_edit, promo_edit);
//        }

//            request.getRequestDispatcher("Reservationuser.jsp").forward(request, response);
//            out.println("post");
//            out.println(request.getServletPath());
    }
}
