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
 * @author Sílvia Nascimento
 */
public class DAOProduto {
    
    DAOUnidade unidade = new DAOUnidade();
    DAOMarca marca = new DAOMarca();
    
    public List<Produto> consultar(){
        String sql="select * from produto";
        List<Produto> listaProduto = new ArrayList<>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Produto produto = new Produto();
                produto.setCodProduto(rs.getInt("codProduto"));
                produto.setNome(rs.getString("nome"));
                produto.setDescricao(rs.getString("descricao"));
                produto.setPrecoCusto(rs.getDouble("precoCusto"));
                produto.setPrecoVenda(rs.getDouble("precoVenda"));
                produto.setQuantidadeEstoque(rs.getDouble("quantidadeEstoque"));
                produto.setQuantidadeMinima(rs.getDouble("quantidadeMinima"));
                produto.setCardapio(rs.getString("cardapio"));
                produto.setUnidade(unidade.localizar(rs.getInt("unidade")));
                produto.setMarca(marca.localizar(rs.getInt("marca")));
                listaProduto.add(produto);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOProduto.java "+ex);
        }
        return listaProduto;
    }
    
    public String inserir(Produto produto){
        String mensagem="";
        String sql="insert into produto(nome, descricao, precoCusto, precoVenda, quantidadeEstoque, quantidadeMinima, cardapio, unidade, marca) values (?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getDescricao());
            stmt.setDouble(3, produto.getPrecoCusto());
            stmt.setDouble(4, produto.getPrecoVenda());
            stmt.setDouble(5, produto.getQuantidadeEstoque());
            stmt.setDouble(6, produto.getQuantidadeMinima());
            stmt.setString(7, produto.getCardapio());
            stmt.setInt(8, produto.getUnidade().getCodUnidade());
            stmt.setInt(9, produto.getMarca().getCodMarca());
            if(stmt.executeUpdate()>0){
                mensagem="Produto cadastrado com sucesso";
            }else{
                mensagem="Produto nao cadastrado";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    public String alterar(Produto produto) {
        String mensagem = "";
        String sql = "update produto set nome=?, descricao=?, precoCusto=?, precoVenda=?, quantidadeEstoque=?, quantidadeMinima=?, cardapio=?, unidade=?, marca=? where codProduto=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, produto.getNome());
            stmt.setString(2, produto.getDescricao());
            stmt.setDouble(3, produto.getPrecoCusto());
            stmt.setDouble(4, produto.getPrecoVenda());
            stmt.setDouble(5, produto.getQuantidadeEstoque());
            stmt.setDouble(6, produto.getQuantidadeMinima());
            stmt.setString(7, produto.getCardapio());
            stmt.setInt(8, produto.getUnidade().getCodUnidade());
            stmt.setInt(9, produto.getMarca().getCodMarca());
            stmt.setInt(10, produto.getCodProduto());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Produto alterado com sucesso";
            } else {
                mensagem = "Produto nao alterado";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public String remover(Produto produto) {
        String mensagem = "";
        String sql = "delete from produto where codProduto=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
             stmt.setInt(1, produto.getCodProduto());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Produto excluido com sucesso";
            } else {
                mensagem = "Produto nao excluido";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
     public Produto localizar(Integer id) {
        String sql = "select * from produto where codProduto = ?";
        Produto obj = new Produto();
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                obj.setCodProduto(rs.getInt("codProduto"));
                obj.setDescricao(rs.getString("descricao"));
                obj.setPrecoCusto(rs.getDouble("precoCusto"));
                obj.setPrecoVenda(rs.getDouble("precoVenda"));
                obj.setQuantidadeEstoque(rs.getDouble("quantidadeEstoque"));
                obj.setQuantidadeMinima(rs.getDouble("quantidadeMinima"));
                obj.setCardapio(rs.getString("cardapio"));
                obj.setUnidade(unidade.localizar(rs.getInt("unidade")));
                obj.setMarca(marca.localizar(rs.getInt("marca")));
                return obj;
            }
        } catch (SQLException e) {
            System.out.println("Erro de SQL Localizar DAO Produto: " + e.getMessage());
        }
        return null;
}
}
