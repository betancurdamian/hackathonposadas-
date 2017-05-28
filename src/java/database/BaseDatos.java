 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Usuario;

/**
 *
 * @author Ariel
 */
public class BaseDatos {
    private Connection cnn;
    
    public BaseDatos(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "jdbc:mysql://localhost/mercadito";
            cnn = DriverManager.getConnection(db, "root", "");
        } catch (Exception ex) {
            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void cerrarConexion(){
        try {
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String validarUsuario(String usuario, String clave){
        try {
            String sql = "select idPerfil from usuarios where "
                    + "idUsuario ='"+usuario+"' and "
                    + "clave ='"+clave+"'";
            
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return rs.getString("idPerfil");
            }else{
                return "NOK";
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
            return "NOK";
        }
    }
    
    public Usuario getUsuario (String idUsuario){
        try {
            Usuario miUsuario = null;
            String sql = "select * from usuarios where "
                    + "idUsuario ='"+idUsuario+ "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                miUsuario = new Usuario(rs.getString("idUsuario"), 
                                        rs.getString("nombres"),
                                        rs.getString("apellidos"),
                                        rs.getString("clave"),                                        
                                        rs.getInt("idPerfil"),
                                        rs.getString("foto"));
            }
            
            return miUsuario;
        } catch (SQLException ex) {
            Logger.getLogger(BaseDatos.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
