
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Joyce Ketlyn 
 */
public class DAOUsuario {
    
    public ResultSet getLogin(Usuario obj) {
        String sql = "select * from usuario where email = ?";
       ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, obj.getEmail());
            rs = pst.executeQuery();
         
        } catch (SQLException e) {
            System.out.println("Erro de SQL no login: " + e.getMessage());
        }
        return rs;
              }
    
}
