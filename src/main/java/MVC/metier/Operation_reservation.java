package MVC.metier;

import MVC.Config.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Operation_reservation {
    private Connection con = DB.getConnection();
    private PreparedStatement ps, psr;
    private String query;
    ResultSet resultSet = null;
    private int id_extra_res ;
    private ArrayList<Reservation> Reservations = new ArrayList<Reservation>();
    public ArrayList<Reservation> getReservations() {
        return Reservations;
    }

    public void setReservations(ArrayList<Reservation> reservations) {
        Reservations = reservations;
    }

    public void addextra(Extras_réservation er) throws SQLException {

        try {
            query = "insert into `extras_réservation`(`le_petit_déjeuner`, `déjeuner`, `dîner`, `fruits`, `musique`, `spa`, `massage`, `soin`, `excursion`) " +
                    "values(?,?,?,?,?,?,?,?,?)";
            psr = con.prepareStatement(query);
            psr.setInt(1, er.getLe_petit_déjeuner());
            psr.setInt(2, er.getDéjeuner());
            psr.setInt(3, er.getDîner());
            psr.setInt(4, er.getFruits());
            psr.setInt(5, er.getMusique());
            psr.setInt(6, er.getSpa());
            psr.setInt(7, er.getMassage());
            psr.setInt(8, er.getSoin());
            psr.setInt(9, er.getExcursion());
            psr.executeUpdate();
            id_extra_res = get_last_id();
            System.out.println(id_extra_res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void add(Reservation r) throws SQLException {
        try {
            query = "insert into réservation (`id_utilisateur`, `id_chambre`, `residence_date`, `exit_date`, `numbre_persone`, `prix_reservation`, `extras_réservation_id`) " +
                    "values(?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setInt(1,r.getId_utilisateur());
            ps.setInt(2,r.getId_chambre());
            ps.setString(3,r.getResidence_date());
            ps.setString(4,r.getExit_date());
            ps.setInt(5,r.getNumbre_persone());
            ps.setDouble(6, r.getPrix_reservation());
//            ps.setInt(7, r.getExtras_réservation_id());
            ps.setInt(7, id_extra_res);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        Chambres.add(c);
    }

    public void remove_reservatio(int id) {
        try {
            query = "DELETE FROM réservation WHERE id=?";
            ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public ArrayList getAll_reservation() {
        ArrayList listreservation = new ArrayList<Reservation>();
        try {
            query = "select * from réservation INNER JOIN utilisateur ON utilisateur.id_utilisateur = réservation.id_utilisateur INNER JOIN chambre ON chambre.id_chambre = réservation.id_chambre";
            ps = con.prepareStatement(query);
            resultSet = ps.executeQuery();
            while(resultSet.next()){
                Reservation r = new Reservation();
                r.setId(resultSet.getInt("id"));
                r.setId_utilisateur(resultSet.getInt("id_utilisateur"));
                r.setId_chambre(resultSet.getInt("id_chambre"));
                r.setResidence_date(resultSet.getString("residence_date"));
                r.setExit_date(resultSet.getString("exit_date"));
                r.setNumbre_persone(resultSet.getInt("numbre_persone"));
                r.setNom(resultSet.getString("nom"));
                r.setPrenom(resultSet.getString("prénom"));
                r.setEmail(resultSet.getString("email"));
                r.setCin(resultSet.getString("cin"));
                r.setType_chambre(resultSet.getString("type_chambre"));
                r.setPrix_reservation(resultSet.getDouble("prix_reservation"));
                r.setExtras_réservation_id(resultSet.getInt("extras_réservation_id"));
                listreservation.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listreservation;
    }
    public int get_last_id() throws SQLException {
        int id_ex = 0 , i=0;
        query = "select *from extras_réservation ORDER BY `extras_réservation`.`id` DESC";
        ps = con.prepareStatement(query);
        resultSet = ps.executeQuery();
        while(resultSet.next()){
            if (i==0){
                return resultSet.getInt("id");
            }
            i++;
        }
        return id_ex;
    }

}