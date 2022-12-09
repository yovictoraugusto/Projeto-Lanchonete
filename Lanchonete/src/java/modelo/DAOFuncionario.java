package modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOFuncionario{
    DAOFuncao daoFuncao = new DAOFuncao();
    ConverteData converte = new ConverteData();
    
    public List<Funcionario> consultar(){
        String sql = "Select * from funcionario";
        List<Funcionario> lista = new ArrayList<>();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                Funcionario obj = new Funcionario();
                obj.setCodFuncionario(rs.getInt("codFuncionario"));
                obj.setNome(rs.getString("nome"));
                obj.setCpf(rs.getString("cpf"));
                obj.setRg(rs.getString("rg"));
                obj.setCarteiraTrabalho(rs.getString("carteiraTrabalho"));
                obj.setEndereco(rs.getString("endereco"));
                obj.setBairro(rs.getString("bairro"));
                obj.setCidade(rs.getString("cidade"));
                obj.setCep(rs.getString("cep"));
                obj.setUf(rs.getString("uf"));
                obj.setTelefone(rs.getString("telefone"));
                obj.setCelular(rs.getString("celular"));
                obj.setDataAdmissao(converte.converteCalendario(rs.getDate("dataAdmissao")));
                obj.setDataDemissao(converte.converteCalendario(rs.getDate("dataDemissao")));
                obj.setDataNascimento(converte.converteCalendario(rs.getDate("dataNascimento")));
                obj.setDataPagamento(converte.converteCalendario(rs.getDate("dataPagamento")));
                obj.setSalario(rs.getDouble("salario"));
                obj.setCurriculo(rs.getString("curriculo"));
                obj.setFuncao(daoFuncao.localizar(rs.getInt("funcao")));
                lista.add(obj);
            }
      }catch(SQLException e){
            System.out.println("Erro de SQL: "+e.getMessage());
      }
        return lista;
    }
    
    public String inserir(Funcionario obj){
        String mensagem;
        String sql="Insert into funcionario(nome, cpf, rg, carteiraTrabalho, endereco, bairro, cidade, cep, uf, telefone, celular, dataAdmissao, dataDemissao, dataNascimento, dataPagamento, salario, curriculo, funcao) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, obj.getNome());
            pst.setString(2, obj.getCpf());
            pst.setString(3, obj.getRg());
            pst.setString(4, obj.getCarteiraTrabalho());
            pst.setString(5, obj.getEndereco());
            pst.setString(6, obj.getBairro());
            pst.setString(7, obj.getCidade());
            pst.setString(8, obj.getCep());
            pst.setString(9, obj.getUf());
            pst.setString(10, obj.getTelefone());
            pst.setString(11, obj.getCelular());
            pst.setDate(12, converte.converteBanco(obj.getDataAdmissao()));
            pst.setDate(13, converte.converteBanco(obj.getDataDemissao()));
            pst.setDate(14, converte.converteBanco(obj.getDataNascimento()));
            pst.setDate(15, converte.converteBanco(obj.getDataPagamento()));
            pst.setDouble(16, obj.getSalario());
            pst.setString(17, obj.getCurriculo());
            pst.setInt(18,obj.getFuncao().getCodFuncao());
            if(pst.executeUpdate()>0){
                mensagem="Funcionario cadastrado com sucesso";
            }else{
                mensagem="Fucionario nao cadastrado!";
            }
            pst.close();
        }catch(SQLException e){
            mensagem = e.getMessage();
        }
        return mensagem;
    }
    
    public String alterar(Funcionario obj){
        String mensagem;
        String sql="update funcionario set nome=?, cpf=?, rg=?, carteiraTrabalho=?, endereco=?, bairro=?, cidade=?, cep=?, uf=?, telefone=?, celular=?, dataAdmissao=?, dataDemissao=?, dataNascimento=?, dataPagamento=?, salario=?, curriculo=?, funcao=? where codFuncionario=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setString(1, obj.getNome());
            pst.setString(2, obj.getCpf());
            pst.setString(3, obj.getRg());
            pst.setString(4, obj.getCarteiraTrabalho());
            pst.setString(5, obj.getEndereco());
            pst.setString(6, obj.getBairro());
            pst.setString(7, obj.getCidade());
            pst.setString(8, obj.getCep());
            pst.setString(9, obj.getUf());
            pst.setString(10, obj.getTelefone());
            pst.setString(11, obj.getCelular());
            pst.setDate(12, converte.converteBanco(obj.getDataAdmissao()));
            pst.setDate(13, converte.converteBanco(obj.getDataDemissao()));
            pst.setDate(14, converte.converteBanco(obj.getDataNascimento()));
            pst.setDate(15, converte.converteBanco(obj.getDataPagamento()));
            pst.setDouble(16, obj.getSalario());
            pst.setString(17, obj.getCurriculo());
            pst.setInt(18,obj.getFuncao().getCodFuncao());
            pst.setInt(19,obj.getCodFuncionario());
            if(pst.executeUpdate()>0){
                mensagem="Fucionario alterado com sucesso";
            }else{
                mensagem="Funcionario nao alterado!";
            }pst.close();
        }catch(SQLException e){
            mensagem = e.getMessage();
        }
        return mensagem;
    }
    
    public String remover(Funcionario obj){
        String mensagem;
        String sql="delete from funcionario where codFuncionario=?";
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1, obj.getCodFuncionario());
            if(pst.executeUpdate()>0){
                mensagem="Funcionario excluido com sucesso";
            }else{
                mensagem="Funcionario nao excluido";
            }pst.close();
        }catch(SQLException e){
            mensagem=e.getMessage();
        }
        return mensagem;
    }
    
    public Funcionario localizar(Integer id){
        String sql="select * from funcionario where codFuncionario=?";
        Funcionario obj = new Funcionario();
        try{
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            pst.setInt(1,id);
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                obj.setCodFuncionario(rs.getInt("codFuncionario"));
                obj.setNome(rs.getString("nome"));
                obj.setCpf(rs.getString("cpf"));
                obj.setRg(rs.getString("rg"));
                obj.setCarteiraTrabalho(rs.getString("carteiraTrabalho"));
                obj.setEndereco(rs.getString("endereco"));
                obj.setBairro(rs.getString("bairro"));
                obj.setCidade(rs.getString("cidade"));
                obj.setCep(rs.getString("cep"));
                obj.setUf(rs.getString("uf"));
                obj.setTelefone(rs.getString("telefone"));
                obj.setCelular(rs.getString("celular"));
                obj.setDataAdmissao(converte.converteCalendario(rs.getDate("dataAdmissao")));
                obj.setDataDemissao(converte.converteCalendario(rs.getDate("dataDemissao")));
                obj.setDataNascimento(converte.converteCalendario(rs.getDate("dataNascimento")));
                obj.setDataPagamento(converte.converteCalendario(rs.getDate("dataPagamento")));
                obj.setSalario(rs.getDouble("salario"));
                obj.setCurriculo(rs.getString("curriculo"));
                obj.setFuncao(daoFuncao.localizar(rs.getInt("funcao")));
                return obj;
            }
        }catch(SQLException erro){
            System.out.println("Erro no localizar do DAOFuncionario "+erro.getMessage()+"\nComando SQL = "+sql);
        }
        return null;
    }
}