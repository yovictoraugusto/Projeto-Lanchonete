/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Joyce ketlyn
 */
public class DAOMarca {
    public List <Marca> consultar() {
        String sql = "select * from marca";
        List<Marca> listaMarca = new ArrayList<>();

        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Marca marca = new Marca();
                marca.setCodMarca(rs.getInt("codMarca"));
                marca.setNome(rs.getString("nome"));
                listaMarca.add(marca);
            }
            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro no consultar do DAOMarca.java " + ex);
        }
        return listaMarca;
    }

    public String inserir(Marca marca) {
        String mensagem = "";
        String sql = "insert into marca(nome) values (?)";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, marca.getNome());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Marca cadastrada com sucesso";
            } else {
                mensagem = "Marca nao cadastrado";
            }
            stmt.close();
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL =" + sql;
        }
        return mensagem;
    }

    public String alterar(Marca marca) {
        String mensagem = "";
        String sql = "update marca set nome=? where codMarca=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, marca.getNome());
            stmt.setInt(2, marca.getCodMarca());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Marca alterada com sucesso";
            } else {
                mensagem = "Marca não alterada";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }

    public String remover(Marca marca) {
        String mensagem = "";
        String sql = "delete from marca where codMarca=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setInt(1, marca.getCodMarca());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Marca excluida com sucesso";
            } else {
                mensagem = "Marca nao excluida";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public Marca localizar(Integer id) {
        String sql = "select * from marca where codMarca=?";
        Marca obj = new Marca();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            obj.setCodMarca(rs.getInt("codMarca"));
            obj.setNome(rs.getString("nome"));
            
            return obj;
        }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOMarca "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
    
}
