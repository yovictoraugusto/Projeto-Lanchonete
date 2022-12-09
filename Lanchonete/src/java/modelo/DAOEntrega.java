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
 * @author joyce
 */
public class DAOEntrega {
    
    DAOVenda venda = new DAOVenda();
    DAOCliente  cliente = new DAOCliente();
    
    public List<Entrega> consultar(){
        String sql="select * from entrega";
        List<Entrega> listaEntrega = new ArrayList<>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Entrega entrega = new Entrega();
                entrega.setCodEntrega(rs.getInt("codEntrega"));
                entrega.setValor(rs.getDouble("valor"));
                entrega.setVenda(venda.localizar(rs.getInt("venda")));
                entrega.setCliente(cliente.localizar(rs.getInt("cliente")));
                listaEntrega.add(entrega);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOEntrega.java "+ex);
        }
        return listaEntrega;
    }
    
    public String inserir(Entrega entrega){
        String mensagem="";
        String sql="insert into entrega(valor, venda, cliente) values (?,?,?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setDouble(1, entrega.getValor());
            stmt.setInt(2, entrega.getVenda().getCodVenda());
            stmt.setInt(3, entrega.getCliente().getCodCliente());
            if(stmt.executeUpdate()>0){
                mensagem="Entrega cadastrada com sucesso";
            }else{
                mensagem="Entrega nao cadastrada";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    public String alterar(Entrega entrega) {
        String mensagem = "";
        String sql = "update entrega set valor=?,venda=?,cliente=? where codEntrega=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setDouble(1, entrega.getValor());
            stmt.setInt(2, entrega.getVenda().getCodVenda());
            stmt.setInt(3, entrega.getCliente().getCodCliente());
            stmt.setInt(4,entrega.getCodEntrega());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Entrega alterada com sucesso";
            } else {
                mensagem = "Entrega nao alterada";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public String remover(Entrega entrega) {
        String mensagem = "";
        String sql = "delete from entrega where codEntrega=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
             stmt.setInt(1, entrega.getCodEntrega());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Entrega excluida com sucesso";
            } else {
                mensagem = "Entrega nao excluida";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
     public Entrega localizar(Integer id) {
        String sql = "select * from entrega where codEntrega = ?";
        Entrega obj = new Entrega();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                obj.setCodEntrega(rs.getInt("codEntrega"));
                obj.setValor(rs.getDouble("valor"));
                obj.setVenda(venda.localizar(rs.getInt("venda")));
                obj.setCliente(cliente.localizar(rs.getInt("cliente")));
                return obj;
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL Localizar DAO Entrega: " + e.getMessage());
        }
        return null;
}
    
}
