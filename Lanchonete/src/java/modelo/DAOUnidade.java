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
 * @author Magayver
 */
public class DAOUnidade {
    public List<Unidade> consultar(){
        String sql="select * from unidade";
        List<Unidade> listaUnidade = new ArrayList<>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Unidade unidade = new Unidade();
                unidade.setCodUnidade(rs.getInt("codUnidade"));
                unidade.setNome(rs.getString("nome"));
                listaUnidade.add(unidade);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOUnidade.java "+ex);
        }
        return listaUnidade;
    }
    
    public String inserir(Unidade unidade){
        String mensagem="";
        String sql="insert into unidade(nome) values (?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, unidade.getNome());
            if(stmt.executeUpdate()>0){
                mensagem="Unidade cadastrada com sucesso";
            }else{
                mensagem="Unidade nao cadastrado";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    public String alterar(Unidade unidade) {
        String mensagem = "";
        String sql = "update unidade set nome=? where codUnidade=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, unidade.getNome());
            stmt.setInt(2, unidade.getCodUnidade());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Unidade alterada com sucesso";
            } else {
                mensagem = "Unidade nao alterada";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public String remover(Unidade unidade) {
        String mensagem = "";
        String sql = "delete from unidade where codUnidade=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
             stmt.setInt(1, unidade.getCodUnidade());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Unidade excluida com sucesso";
            } else {
                mensagem = "Unidade nao excluida";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public Unidade localizar(Integer id) {
        String sql = "select * from unidade where codUnidade=?";
        Unidade obj = new Unidade();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            obj.setCodUnidade(rs.getInt("codUnidade"));
            obj.setNome(rs.getString("nome"));
            
            return obj;
        }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOUnidade "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
}



