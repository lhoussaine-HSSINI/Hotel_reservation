package MVC.metier;

public class Chambre {
    private int id;
    private String type_chambre, dbFileName;
    private int Prix;
    private int  Promo;

    public int getEtat_chambre() {
        return etat_chambre;
    }

    public void setEtat_chambre(int etat_chambre) {
        this.etat_chambre = etat_chambre;
    }

    private int etat_chambre;

    public String getDbFileName() {
        return dbFileName;
    }

    public void setDbFileName(String dbFileName) {
        this.dbFileName = dbFileName;
    }

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

    public Chambre(String type_chambre,String dbFileName, int etat_chambre ,int prix, int promo) {
        this.type_chambre = type_chambre;
        this.Prix = prix;
        this.Promo = promo;
        this.dbFileName=dbFileName;
        this.etat_chambre = etat_chambre;
    }
    public Chambre(int id, String type_chambre,String dbFileName,int etat_chambre ,int prix, int promo) {
        this.id = id;
        this.type_chambre = type_chambre;
        this.Prix = prix;
        this.Promo = promo;
        this.dbFileName=dbFileName;
        this.etat_chambre = etat_chambre;
    }

    @Override
    public String toString() {
        return " type_chambre : "+type_chambre +"  dbFileName : "+dbFileName +" etat_chambre : "+etat_chambre +"  Prix : "+Prix +"  Promo : "+Promo;
    }
    public void show(){
        System.out.println(toString());
    }
}