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
 * @author victo
 */
public class DAOCliente {
    ConverteData converte = new ConverteData();
    
    public List<Cliente> consultar(){
        String sql="select * from cliente";
        List<Cliente> listaCliente = new ArrayList<Cliente>();
        
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Cliente cliente = new Cliente();
                cliente.setCodCliente(rs.getInt("codCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setRg(rs.getString("rg"));
                cliente.setEndereco(rs.getString("endereco"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setCep(rs.getString("cep"));
                cliente.setUf(rs.getString("uf"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setCelular(rs.getString("celular"));
                cliente.setDataNascimento(converte.converteCalendario(rs.getDate("dataNascimento")));
                cliente.setContatoVirtual(rs.getString("contatoVirtual"));
                listaCliente.add(cliente);
            }
            rs.close();
            stmt.close();
        }catch(SQLException ex){
            System.out.println("Erro no consultar do DAOCliente.java "+ex);
        }
        return listaCliente;
    }
    
    public String inserir(Cliente cliente){
        String mensagem="";
        String sql="insert into cliente(nome, cpf, rg, endereco, bairro, cidade, cep, uf, telefone, celular, dataNascimento, contatoVirtual) values (?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getCpf());
            stmt.setString(3, cliente.getRg());
            stmt.setString(4, cliente.getEndereco());
            stmt.setString(5, cliente.getBairro());
            stmt.setString(6, cliente.getCidade());
            stmt.setString(7, cliente.getCep());
            stmt.setString(8, cliente.getUf());
            stmt.setString(9, cliente.getTelefone());
            stmt.setString(10, cliente.getCelular());
            stmt.setDate(11, converte.converteBanco(cliente.getDataNascimento()));
            stmt.setString(12, cliente.getContatoVirtual());
            if(stmt.executeUpdate()>0){
                mensagem="Cliente cadastrado com sucesso";
            }else{
                mensagem="Cliente nao cadastrado";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL ="+sql;
        }
        return mensagem;
    }
    
    public String alterar(Cliente cliente){
        String mensagem="";
        String sql="update cliente set nome=?, cpf=?, rg=?, endereco=?, bairro=?, cidade=?, cep=?, uf=?, telefone=?, celular=?, contatoVirtual=?, dataNascimento=?  where codCliente=?";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getCpf());
            stmt.setString(3, cliente.getRg());
            stmt.setString(4, cliente.getEndereco());
            stmt.setString(5, cliente.getBairro());
            stmt.setString(6, cliente.getCidade());
            stmt.setString(7, cliente.getCep());
            stmt.setString(8, cliente.getUf());
            stmt.setString(9, cliente.getTelefone());
            stmt.setString(10, cliente.getCelular());
            stmt.setString(11, cliente.getContatoVirtual());
            stmt.setDate(12, converte.converteBanco(cliente.getDataNascimento()));
            stmt.setInt(13, cliente.getCodCliente());
            if(stmt.executeUpdate()>0){
                mensagem="Cliente alterado com sucesso";
            }else{
                mensagem="Cliente nao alterado";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem = erro.getMessage()+"\nComando SQL= "+sql;
        }
        return mensagem;
    }
    
    public String excluir(Cliente cliente){
        String mensagem="";
        String sql="delete from cliente where codCliente=?";
        try{
            PreparedStatement stmt = Conexao.getPreparedStatement(sql);
            stmt.setInt(1, cliente.getCodCliente());
            if(stmt.executeUpdate()>0){
                mensagem="Cliente excluido com sucesso";
            }else{
                mensagem="Cliente nao excluido";
            }
            stmt.close();
        }catch(SQLException erro){
            mensagem=erro.getMessage()+"\nComando SQL= "+sql;
        }
        return mensagem;
    }
    public Cliente localizar(Integer id) {
        String sql = "select * from cliente where codCliente=?";
        Cliente obj = new Cliente();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
            obj.setCodCliente(rs.getInt("codCliente"));
            obj.setNome(rs.getString("nome"));
            obj.setRg(rs.getString("rg"));
            obj.setCpf(rs.getString("cpf"));
            obj.setEndereco(rs.getString("endereco"));
            obj.setBairro(rs.getString("bairro"));
            obj.setCidade(rs.getString("cidade"));
            obj.setCep(rs.getString("cep"));
            obj.setUf(rs.getString("uf"));
            obj.setTelefone(rs.getString("telefone"));
            obj.setCelular(rs.getString("celular"));
            obj.setDataNascimento(converte.converteCalendario(rs.getDate("dataNascimento")));
            obj.setContatoVirtual(rs.getString("contatoVirtual"));
            return obj;
        }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOCliente "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
}
