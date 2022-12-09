/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author tulio
 */
public class Relatorio {     
     public ResultSet relatorioCliente() {
        String sql = "SELECT codCliente,nome,cpf,celular FROM cliente";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioEntrega() {
        String sql = "SELECT codEntrega, venda, valor, cliente.nome FROM entrega, cliente WHERE entrega.cliente=cliente.codCliente";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioFuncao() {
        String sql = "SELECT funcao.codFuncao, funcao.nome FROM funcao";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
    
     public ResultSet relatorioFuncionario() {
        String sql = "SELECT funcionario.codFuncionario,funcionario.nome,funcionario.salario,funcao.nome AS Funcao FROM funcionario, funcao WHERE funcionario.funcao = funcao.codFuncao";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioItensVenda() {
        String sql = "SELECT itensvenda.codItensVenda,itensvenda.venda, produto.nome, itensvenda.quantidade, itensvenda.precoVenda FROM itensvenda, produto WHERE itensvenda.produto=produto.codProduto";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioProduto() {
        String sql = "SELECT produto.codProduto, produto.nome, produto.precoCusto, produto.precoVenda, produto.precoVenda, produto.quantidadeEstoque, produto.quantidadeMinima, unidade.nome as unidade, marca.nome as marca FROM produto, marca, unidade WHERE produto.unidade = unidade.codUnidade and produto.marca = marca.codMarca";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioUnidade() {
        String sql = "SELECT codUnidade, nome AS unidade FROM unidade";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    }
     
     public ResultSet relatorioMarca() {
        String sql = "SELECT codMarca, nome AS Marca FROM marca";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    } 
    
     public ResultSet relatorioVenda() {
        String sql = "SELECT venda.codVenda, venda.dataHora, venda.tipoPagamento, cliente.nome AS Clientes, funcionario.nome AS Funcionarios FROM venda, cliente, funcionario WHERE venda.cliente = cliente.codCliente and venda.funcionario = funcionario.codFuncionario";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    } 
     
     public ResultSet relatorioVendas2() {
        String sql = "SELECT cliente.nome AS \"cliente\",produto.nome AS \"produto\", itensvenda.quantidade AS \"quantidade\", itensvenda.precoVenda AS \"preco\", \n" +
                     "venda.dataHora FROM venda, itensvenda,cliente, produto WHERE \n" +
                     "itensvenda.venda = venda.codVenda AND venda.cliente = cliente.codCliente \n" +
                     "AND itensvenda.produto = produto.codProduto";
        ResultSet rs=null;
        try {
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            rs = pst.executeQuery();
        } catch (SQLException e) {
            System.out.println("Erro de SQL: " + e.getMessage());
        }
        return rs;
    } 
}
