package MVC.metier;

public class Reservation {
    private int id;
    private int id_utilisateur;
    private int id_chambre;
    private int numbre_persone;

    private double prix_reservation;
    private String residence_date, exit_date, nom, prenom, email, cin, type_chambre;

    private int extras_réservation_id;
    public int getExtras_réservation_id() {
        return extras_réservation_id;
    }

    public void setExtras_réservation_id(int extras_réservation_id) {
        this.extras_réservation_id = extras_réservation_id;
    }

    public double getPrix_reservation() {
        return prix_reservation;
    }

    public void setPrix_reservation(double prix_reservation) {
        this.prix_reservation = prix_reservation;
    }



    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getType_chambre() {
        return type_chambre;
    }

    public void setType_chambre(String type_chambre) {
        this.type_chambre = type_chambre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_utilisateur() {
        return id_utilisateur;
    }

    public void setId_utilisateur(int id_utilisateur) {
        this.id_utilisateur = id_utilisateur;
    }

    public int getId_chambre() {
        return id_chambre;
    }

    public void setId_chambre(int id_chambre) {
        this.id_chambre = id_chambre;
    }

    public int getNumbre_persone() {
        return numbre_persone;
    }

    public void setNumbre_persone(int numbre_persone) {
        this.numbre_persone = numbre_persone;
    }

    public String getResidence_date() {
        return residence_date;
    }

    public void setResidence_date(String residence_date) {
        this.residence_date = residence_date;
    }

    public String getExit_date() {
        return exit_date;
    }

    public void setExit_date(String exit_date) {
        this.exit_date = exit_date;
    }

    public Reservation() {
    }

    public Reservation(int id, int id_utilisateur, int id_chambre, int numbre_persone, String residence_date, String exit_date, String nom,String prenom,String email,String cin,String type_chambre,double prix_reservation, int extras_réservation_id) {
        this.id = id;
        this.id_utilisateur = id_utilisateur;
        this.id_chambre = id_chambre;
        this.numbre_persone = numbre_persone;
        this.residence_date = residence_date;
        this.exit_date = exit_date;
        this.prix_reservation = prix_reservation;
        this.extras_réservation_id=extras_réservation_id;
    }

    public Reservation(int id_utilisateur, int id_chambre, int numbre_persone, String residence_date, String exit_date , String nom,String prenom,String email,String cin,String type_chambre, double prix_reservation, int extras_réservation_id) {
        this.id_utilisateur = id_utilisateur;
        this.id_chambre = id_chambre;
        this.numbre_persone = numbre_persone;
        this.residence_date = residence_date;
        this.exit_date = exit_date;
        this.prix_reservation = prix_reservation;
        this.extras_réservation_id=extras_réservation_id;
    }

}
