package MVC.metier;

import MVC.Config.DB;

import java.sql.*;
import java.util.ArrayList;

public class Operation_co_chambre {
    private static Connection con = DB.getConnection();
    private PreparedStatement ps, psr;
    private String query;
    ResultSet resultSet = null;
    private int id_extra ;
    private ArrayList<Co_chambre> Co_chambres = new ArrayList<Co_chambre>();

    public ArrayList<Co_chambre> getCo_chambres() {
        return Co_chambres;
    }

    public void setCo_chambres(ArrayList<Co_chambre> co_chambres) {
        Co_chambres = co_chambres;
    }

    public void add(Co_chambre co, Extras_réservation er) throws SQLException {

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
            id_extra =get_last_id();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            query = "insert into co_chambre (`nom_co_chambre`, `prénom_co_chambre`, `cin_co_chambre`, `date_de_naissance_co_chambre`, `id`, `extras_réservation_id`) " +
                    "values(?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1,co.getNom_co_chambre());
            ps.setString(2,co.getPrénom_co_chambre());
            ps.setString(3,co.getCin_co_chambre());
            ps.setString(4,co.getDate_de_naissance_co_chambre());
            ps.setInt(5,co.getId());
//            ps.setInt(6, co.getExtras_réservation_id());
            ps.setInt(6, id_extra);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        Chambres.add(c);
    }

    public ArrayList getAll_co_chambre() {
        ArrayList list_co_chambre = new ArrayList<Co_chambre>();
        try {
            query = "select * from co_chambre";
            ps = con.prepareStatement(query);
            resultSet = ps.executeQuery();
            while(resultSet.next()){
                Co_chambre co = new Co_chambre();
                co.setId_co_chambre(resultSet.getInt("id_co_chambre"));
                co.setNom_co_chambre(resultSet.getString("nom_co_chambre"));
                co.setPrénom_co_chambre(resultSet.getString("prénom_co_chambre"));
                co.setCin_co_chambre(resultSet.getString("cin_co_chambre"));
                co.setDate_de_naissance_co_chambre(resultSet.getString("date_de_naissance_co_chambre"));
                co.setId(resultSet.getInt("id"));
                co.setExtras_réservation_id(resultSet.getInt("extras_réservation_id"));
                list_co_chambre.add(co);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list_co_chambre;
    }

    public ArrayList getAll_co_chambre_use_id(int id) {
        ArrayList list_co_chambre_use_id = new ArrayList<Co_chambre>();
        try {
            query = "select * from co_chambre where id = '" + id + "' ";
            ps = con.prepareStatement(query);
            resultSet = ps.executeQuery();
            while(resultSet.next()){
                Co_chambre co = new Co_chambre();
                co.setId_co_chambre(resultSet.getInt("id_co_chambre"));
                co.setNom_co_chambre(resultSet.getString("nom_co_chambre"));
                co.setPrénom_co_chambre(resultSet.getString("prénom_co_chambre"));
                co.setCin_co_chambre(resultSet.getString("cin_co_chambre"));
                co.setDate_de_naissance_co_chambre(resultSet.getString("date_de_naissance_co_chambre"));
                co.setId(resultSet.getInt("id"));
                co.setExtras_réservation_id(resultSet.getInt("extras_réservation_id"));
                list_co_chambre_use_id.add(co);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list_co_chambre_use_id;
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
