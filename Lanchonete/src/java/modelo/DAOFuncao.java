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
public class DAOFuncao {
    public List<Funcao> consultar(){
        String sql="select * from funcao";
        List<Funcao> listaFuncao = new ArrayList<>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Funcao funcao = new Funcao();
                funcao.setCodFuncao(rs.getInt("codFuncao"));
                funcao.setNome(rs.getString("nome"));
                listaFuncao.add(funcao);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOFuncao.java "+ex);
        }
        return listaFuncao;
    }
    
    public String inserir(Funcao funcao){
        String mensagem="";
        String sql="insert into funcao(nome) values (?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, funcao.getNome());
            if(stmt.executeUpdate()>0){
                mensagem="Funcao cadastrada com sucesso";
            }else{
                mensagem="Funcao nao cadastrado";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    public String alterar(Funcao funcao) {
        String mensagem = "";
        String sql = "update funcao set nome=? where codFuncao=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, funcao.getNome());
            stmt.setInt(2, funcao.getCodFuncao());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Funcao alterada com sucesso";
            } else {
                mensagem = "Funcao nao alterada";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public String remover(Funcao funcao) {
        String mensagem = "";
        String sql = "delete from funcao where codFuncao=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
             stmt.setInt(1, funcao.getCodFuncao());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Funcao excluida com sucesso";
            } else {
                mensagem = "Funcao nao excluida";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    
    public Funcao localizar(Integer id) {
        String sql = "select * from funcao where codFuncao=?";
        Funcao obj = new Funcao();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            obj.setCodFuncao(rs.getInt("codFuncao"));
            obj.setNome(rs.getString("nome"));
            return obj;
        }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOFuncao "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
}

