package MVC.model;


import MVC.metier.Co_chambre;

import java.util.ArrayList;

public class Co_chambreBeans {

    private Co_chambre co_chambre = new Co_chambre();
    private ArrayList<Co_chambre> list_co_chambre = new ArrayList<Co_chambre>();

    public Co_chambre getCo_chambre() {
        return co_chambre;
    }

    public void setCo_chambre(Co_chambre co_chambre) {
        this.co_chambre = co_chambre;
    }

    public ArrayList<Co_chambre> getList_co_chambre() {
        return list_co_chambre;
    }

    public void setList_co_chambre(ArrayList<Co_chambre> list_co_chambre) {
        this.list_co_chambre = list_co_chambre;
    }
}
