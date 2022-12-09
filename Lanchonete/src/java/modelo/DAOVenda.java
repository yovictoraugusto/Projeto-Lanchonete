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
 * @author Emprestimo IFM-22
 */
public class DAOVenda {
    
    ConverteData converte = new ConverteData();
    DAOCliente daoCliente = new DAOCliente();
    DAOFuncionario daoFuncionario = new DAOFuncionario();
    private int lastId;

    public int getLastId() {
        return lastId;
    }
    public List<Venda> consultar(){
        String sql="select * from venda";
        List<Venda> listaVenda = new ArrayList<>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Venda venda = new Venda();
                venda.setCodVenda(rs.getInt("codVenda"));
                venda.setDataHora(converte.converteCalendario(rs.getDate("dataHora")));
                venda.setDesconto(rs.getDouble("desconto"));
                venda.setComissao(rs.getDouble("comissao"));
                venda.setTipoPagamento(rs.getString("tipoPagamento"));
                venda.setCliente(daoCliente.localizar(rs.getInt("cliente")));
                venda.setFuncionario(daoFuncionario.localizar(rs.getInt("funcionario")));
                listaVenda.add(venda);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOVenda.java "+ex);
        }
        return listaVenda;
    }
    
    
    public String inserir(Venda venda){
        String mensagem="";
        String sql="insert into venda(dataHora, desconto, comissao, tipoPagamento, cliente, funcionario) values (?,?,?,?,?,?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setDate(1, converte.converteBanco(venda.getDataHora()));
            stmt.setDouble(2, venda.getDesconto());
            stmt.setDouble(3, venda.getComissao());
            stmt.setString(4, venda.getTipoPagamento());
            stmt.setInt(5, venda.getCliente().getCodCliente());
            stmt.setInt(6, venda.getFuncionario().getCodFuncionario());
           if (stmt.executeUpdate() > 0) {
                 ResultSet rs = stmt.getGeneratedKeys();// retorna o último idCaixa cadastrado
                if (rs.next()) {
                    lastId = rs.getInt(1); //armazena o último idCaixa cadastrado
                }
                mensagem = "Venda cadastrada com sucesso";
            } else {
                mensagem = "Venda não cadastrado!";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    public String alterar(Venda venda) {
        String mensagem = "";
        String sql = "update venda set dataHora=?, desconto=?, comissao=?, tipoPagamento=? where codVenda=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setDate(1, converte.converteBanco(venda.getDataHora()));
            stmt.setDouble(2, venda.getDesconto());
            stmt.setDouble(3, venda.getComissao());
            stmt.setString(4, venda.getTipoPagamento());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Venda alterada com sucesso";
            } else {
                mensagem = "Venda nao alterada";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    public String remover(Venda venda) {
        String mensagem = "";
        String sql = "delete from venda where codVenda=?";
        try {
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
             stmt.setInt(1, venda.getCodVenda());
            if (stmt.executeUpdate() > 0) {
                mensagem = "Venda excluida com sucesso";
            } else {
                mensagem = "Venda nao excluida";
            }
            stmt.close();// fecha a conexão
        } catch (SQLException erro) {
            mensagem = erro.getMessage() + "\nComando SQL = " + sql;
        }
        return mensagem;
    }
    
    public Venda localizar(Integer id) {
        String sql = "select * from venda where codVenda=?";
        Venda obj = new Venda();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            obj.setCodVenda(rs.getInt("codVenda"));
            obj.setDataHora(converte.converteCalendario(rs.getDate("dataHora")));
            obj.setDesconto(rs.getDouble("desconto"));
            obj.setComissao(rs.getDouble("comissao"));
            obj.setTipoPagamento(rs.getString("tipoPagamento"));
            return obj;
        }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOVenda "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
}
