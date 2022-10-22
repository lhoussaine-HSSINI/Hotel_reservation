package metier;

public class Chambre {
    private int id;
    private String type_chambre;
    private int Prix;
    private int  Promo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType_chambre() {
        return type_chambre;
    }

    public void setType_chambre(String type_chambre) {
        this.type_chambre = type_chambre;
    }

    public int getPrix() {
        return Prix;
    }

    public void setPrix(int prix) {
        Prix = prix;
    }

    public int getPromo() {
        return Promo;
    }

    public void setPromo(int promo) {
        Promo = promo;
    }
    public Chambre() {
    }

    public Chambre(String type_chambre, int prix, int promo) {
        this.type_chambre = type_chambre;
        this.Prix = prix;
        this.Promo = promo;
    }
    public Chambre(int id, String type_chambre, int prix, int promo) {
        this.id = id;
        this.type_chambre = type_chambre;
        this.Prix = prix;
        this.Promo = promo;
    }
}

