package MVC.model;


import MVC.metier.Reservation;

import java.util.ArrayList;

public class ReservationBeans {
    private Reservation reservation = new Reservation();
    private ArrayList<Reservation> list_reservation = new ArrayList<Reservation>();

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public ArrayList<Reservation> getList_reservation() {
        return list_reservation;
    }

    public void setList_reservation(ArrayList<Reservation> list_reservation) {
        this.list_reservation = list_reservation;
    }
}
