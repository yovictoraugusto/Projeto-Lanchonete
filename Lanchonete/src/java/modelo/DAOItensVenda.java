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
public class DAOItensVenda {
    
       DAOProduto daoProduto = new DAOProduto();
    
    
   
    
    public List<itensVenda> getLista(Integer id){
        String sql = "select * from itensvenda where venda=?";
        List<itensVenda> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                itensVenda obj = new itensVenda();
                obj.setCodItensVenda(rs.getInt("codItensVenda"));
                obj.setVenda(rs.getInt("venda"));
                obj.setProduto(daoProduto.localizar(rs.getInt("produto")));
                obj.setQuantidade(rs.getInt("quantidade"));
                obj.setPrecoVenda(rs.getDouble("precoVenda"));
                lista.add(obj);
            }
            rs.close();
            pst.close();
        }catch(SQLException e){
            System.out.println("Erro de SQL DAO Itens getLista(): "+e.getMessage());
        }
        return lista;
    }
    
     public String incluir(itensVenda obj) {
        String mensagem;
        String sql = "insert into itensvenda (venda,produto,quantidade,precoVenda) values (?,?,?,?)";
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            System.out.println("Venda: "+obj.getVenda());
            pst.setInt(1, obj.getVenda());
            pst.setInt(2, obj.getProduto().getCodProduto());
            pst.setInt(3, obj.getQuantidade());
            pst.setDouble(4, obj.getPrecoVenda());
            
            if (pst.executeUpdate() > 0) {
                 
                mensagem = "Item de venda cadastrado com sucesso";
            } else {
                mensagem = "Item de venda não cadastrado!";
            }
            pst.close();
        } catch (SQLException e) {
            mensagem = e.getMessage();
        }
        return mensagem;
    }
     
     public String remover(itensVenda obj){
        String sql = "delete from itensVenda where codItensVenda=?";
        String mensagem;
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getCodItensVenda()); 
            if (pst.executeUpdate() > 0) {
                mensagem = "Item removido com sucesso!";
            } else {
                mensagem = "Item não excluído";
            }
            pst.close();
        } catch (SQLException e) {
            mensagem = e.getMessage();
        }
        return mensagem;
    }

}
