package MVC.model;

import MVC.metier.Chambre;

import java.util.ArrayList;

public class ChambreBeans {
    private Chambre chambre = new Chambre();
    private ArrayList<Chambre> list = new ArrayList<Chambre>();

    public Chambre getChambre() {
        return chambre;
    }

    public void setChambre(Chambre chambre) {
        this.chambre = chambre;
    }

    public ArrayList<Chambre> getList() {
        return list;
    }

    public void setList(ArrayList<Chambre> list) {
        this.list = list;
    }
}