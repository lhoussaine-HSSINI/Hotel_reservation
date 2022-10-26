package MVC.metier;

public class Co_chambre {


    public Co_chambre() {

    }

    public int getId_co_chambre() {
        return id_co_chambre;
    }

    public void setId_co_chambre(int id_co_chambre) {
        this.id_co_chambre = id_co_chambre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_co_chambre() {
        return nom_co_chambre;
    }

    public void setNom_co_chambre(String nom_co_chambre) {
        this.nom_co_chambre = nom_co_chambre;
    }

    public String getPrénom_co_chambre() {
        return prénom_co_chambre;
    }

    public void setPrénom_co_chambre(String prénom_co_chambre) {
        this.prénom_co_chambre = prénom_co_chambre;
    }

    public String getCin_co_chambre() {
        return cin_co_chambre;
    }

    public void setCin_co_chambre(String cin_co_chambre) {
        this.cin_co_chambre = cin_co_chambre;
    }

    public String getDate_de_naissance_co_chambre() {
        return date_de_naissance_co_chambre;
    }

    public void setDate_de_naissance_co_chambre(String date_de_naissance_co_chambre) {
        this.date_de_naissance_co_chambre = date_de_naissance_co_chambre;
    }

    private int id_co_chambre;
    private int id;

    public int getExtras_réservation_id() {
        return extras_réservation_id;
    }

    public void setExtras_réservation_id(int extras_réservation_id) {
        this.extras_réservation_id = extras_réservation_id;
    }

    private int extras_réservation_id;
    private String nom_co_chambre, prénom_co_chambre, cin_co_chambre, date_de_naissance_co_chambre;


    public Co_chambre(int id, String nom_co_chambre, String prénom_co_chambre, String cin_co_chambre, String date_de_naissance_co_chambre, int extras_réservation_id) {
        this.id = id;
        this.nom_co_chambre = nom_co_chambre;
        this.prénom_co_chambre = prénom_co_chambre;
        this.cin_co_chambre = cin_co_chambre;
        this.date_de_naissance_co_chambre = date_de_naissance_co_chambre;
        this.extras_réservation_id=extras_réservation_id;
    }
    public Co_chambre(int id_co_chambre, int id, String nom_co_chambre, String prénom_co_chambre, String cin_co_chambre, String date_de_naissance_co_chambre, int extras_réservation_id) {
        this.id_co_chambre = id_co_chambre;
        this.id = id;
        this.nom_co_chambre = nom_co_chambre;
        this.prénom_co_chambre = prénom_co_chambre;
        this.cin_co_chambre = cin_co_chambre;
        this.date_de_naissance_co_chambre = date_de_naissance_co_chambre;
        this.extras_réservation_id =extras_réservation_id;
    }
}
