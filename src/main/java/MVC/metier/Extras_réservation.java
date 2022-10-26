package MVC.metier;

public class Extras_réservation {
    private int id, le_petit_déjeuner, déjeuner, dîner, fruits, musique, spa, massage, soin, excursion;

    public Extras_réservation() {
    }

    public Extras_réservation(int le_petit_déjeuner, int déjeuner, int dîner, int fruits, int musique, int spa, int massage, int soin, int excursion) {
        this.le_petit_déjeuner = le_petit_déjeuner;
        this.déjeuner = déjeuner;
        this.dîner = dîner;
        this.fruits = fruits;
        this.musique = musique;
        this.spa = spa;
        this.massage = massage;
        this.soin = soin;
        this.excursion = excursion;
    }

    public Extras_réservation(int id, int le_petit_déjeuner, int déjeuner, int dîner, int fruits, int musique, int spa, int massage, int soin, int excursion) {
        this.id = id;
        this.le_petit_déjeuner = le_petit_déjeuner;
        this.déjeuner = déjeuner;
        this.dîner = dîner;
        this.fruits = fruits;
        this.musique = musique;
        this.spa = spa;
        this.massage = massage;
        this.soin = soin;
        this.excursion = excursion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLe_petit_déjeuner() {
        return le_petit_déjeuner;
    }

    public void setLe_petit_déjeuner(int le_petit_déjeuner) {
        this.le_petit_déjeuner = le_petit_déjeuner;
    }

    public int getDéjeuner() {
        return déjeuner;
    }

    public void setDéjeuner(int déjeuner) {
        this.déjeuner = déjeuner;
    }

    public int getDîner() {
        return dîner;
    }

    public void setDîner(int dîner) {
        this.dîner = dîner;
    }

    public int getFruits() {
        return fruits;
    }

    public void setFruits(int fruits) {
        this.fruits = fruits;
    }

    public int getMusique() {
        return musique;
    }

    public void setMusique(int musique) {
        this.musique = musique;
    }

    public int getSpa() {
        return spa;
    }

    public void setSpa(int spa) {
        this.spa = spa;
    }

    public int getMassage() {
        return massage;
    }

    public void setMassage(int massage) {
        this.massage = massage;
    }

    public int getSoin() {
        return soin;
    }

    public void setSoin(int soin) {
        this.soin = soin;
    }

    public int getExcursion() {
        return excursion;
    }

    public void setExcursion(int excursion) {
        this.excursion = excursion;
    }
}
