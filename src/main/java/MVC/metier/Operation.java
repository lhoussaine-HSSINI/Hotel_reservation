package MVC.metier;

import MVC.Config.DB;

import java.sql.*;
import java.util.ArrayList;

public class Operation {
    private Connection con = DB.getConnection();
    private PreparedStatement ps;
    private String query;
    ResultSet resultSet = null;
    private ArrayList<Chambre> Chambres = new ArrayList<Chambre>();

    public ArrayList<Chambre> getChambres() {
        return Chambres;
    }

    public void setChambres(ArrayList<Chambre> chambres) {
        this.Chambres = chambres;
    }
    public void add(Chambre c) throws SQLException {
            try {
                query = "insert into chambre (`type_chambre`, `dbFileName`,`etat_chambre`, `prix`, `promo`) values(?,?,?,?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1,c.getType_chambre());
                ps.setString(2,c.getDbFileName());
                ps.setInt(3,c.getEtat_chambre());
                ps.setInt(4,c.getPrix());
                ps.setInt(5,c.getPromo());
                ps.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
//        Chambres.add(c);
    }
    public void edit(int id_edit, String type_chambre_edit, int prix_edit, int promo_edit) throws SQLException {
        try {
            query="Update chambre set id_chambre=?,type_chambre=?,etat_chambre=?,prix=?, promo=? where id_chambre="+id_edit;
            ps = con.prepareStatement(query);
            ps.setInt(1,id_edit);
            ps.setString(2,type_chambre_edit);
            ps.setInt(3,1);
            ps.setInt(4,prix_edit);
            ps.setInt(5,promo_edit);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
//        Chambres.add(c);
    }
    public void remove(int id) {
        try {
            query = "DELETE FROM chambre WHERE id_chambre=?";
            ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

//        for (Chambre c:Chambres) {
//            if (c.getId()==id){
//                Chambres.remove(c);
//                break;
//            }
//        }
    }
    public ArrayList getAll() {
        ArrayList listchambre = new ArrayList<Chambre>();
        try {
            query = "select * from chambre";
            ps = con.prepareStatement(query);
            resultSet = ps.executeQuery();
            while(resultSet.next()){
                Chambre c = new Chambre();
                c.setId(resultSet.getInt("id_chambre"));
                c.setType_chambre(resultSet.getString("Type_chambre"));
                c.setDbFileName(resultSet.getString("dbFileName"));
                c.setEtat_chambre(resultSet.getInt("etat_chambre"));
                c.setPrix(resultSet.getInt("prix"));
                c.setPromo(resultSet.getInt("promo"));
                listchambre.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listchambre;
    }
}
