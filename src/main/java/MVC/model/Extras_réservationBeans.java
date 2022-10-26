package MVC.model;

import MVC.metier.Extras_réservation;

import java.util.ArrayList;

public class Extras_réservationBeans {
    public Extras_réservation getExtras_réservation() {
        return extras_réservation;
    }

    public void setExtras_réservation(Extras_réservation extras_réservation) {
        this.extras_réservation = extras_réservation;
    }

    public ArrayList<Extras_réservation> getList_extras_réservation() {
        return list_extras_réservation;
    }

    public void setList_extras_réservation(ArrayList<Extras_réservation> list_extras_réservation) {
        this.list_extras_réservation = list_extras_réservation;
    }

    private Extras_réservation extras_réservation=new Extras_réservation();
    private ArrayList<Extras_réservation> list_extras_réservation=new ArrayList<Extras_réservation>();


}
