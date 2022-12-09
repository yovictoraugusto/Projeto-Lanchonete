<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<%
DAOFuncionario daoFuncionario = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoFuncionario.consultar();
ConverteData converte = new ConverteData();
%>

<table border="1" class="listaCorpo">
    <thead>
        <tr>
            <th>CÓDIGO FUNCIONÁRIO</th>
            <th>NOME</th>
            <th>CPF</th>
            <th>RG</th>
            <th>CARTEIRA DE TRABALHO</th>
            <th>ENDEREÇO</th>
            <th>BAIRRO</th>
            <th>CIDADE</th>
            <th>CEP</th>
            <th>UF</th>
            <th>TELEFONE</th>
            <th>CELULAR</th>
            <th>DATA DE ADMISSÃO</th>
            <th>DATA DE DEMISSÃO</th>
            <th>DATA DE NASCIMENTO</th>
            <th>DATA DE PAGAMENTO</th>
            <th>SALÁRIO</th>
            <th>CURRÍCULO</th>
            <th>FUNÇÃO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <%for(Funcionario funcionario:listaFuncionario){%>
        <tr>
            <td><%=funcionario.getCodFuncionario()%></td>
            <td><%=funcionario.getNome()%></td>
            <td><%=funcionario.getCpf()%></td>
            <td><%=funcionario.getRg()%></td>
            <td><%=funcionario.getCarteiraTrabalho()%></td>
            <td><%=funcionario.getEndereco()%></td>
            <td><%=funcionario.getBairro()%></td>
            <td><%=funcionario.getCidade()%></td>
            <td><%=funcionario.getCep()%></td>
            <td><%=funcionario.getUf()%></td>
            <td><%=funcionario.getTelefone()%></td>
            <td><%=funcionario.getCelular()%></td>
            <td><%=converte.converteTela(funcionario.getDataAdmissao())%></td>
            <td><%=converte.converteTela(funcionario.getDataDemissao())%></td>
            <td><%=converte.converteTela(funcionario.getDataNascimento())%></td>
            <td><%=converte.converteTela(funcionario.getDataPagamento())%></td>
            <td><%=funcionario.getSalario()%></td>
            <td><%=funcionario.getCurriculo()%></td>
            <td><%=funcionario.getFuncao().getNome()%></td>
            <td><a href="CadastroFuncionario.jsp?opcao=alterar&codFuncionario=<%=funcionario.getCodFuncionario()%>&nomeFuncionario=<%=funcionario.getNome()%>&cpf=<%=funcionario.getCpf()%>&rg=<%=funcionario.getRg()%>&carteiraTrabalho=<%=funcionario.getCarteiraTrabalho()%>&endereco=<%=funcionario.getEndereco()%>&bairro=<%=funcionario.getBairro()%>&cidade=<%=funcionario.getCidade()%>&cep=<%=funcionario.getCep()%>&uf=<%=funcionario.getUf()%>&telefone=<%=funcionario.getTelefone()%>&celular=<%=funcionario.getCelular()%>&dataAdmissao=<%=converte.converteTela(funcionario.getDataAdmissao())%>&dataDemissao=<%=converte.converteTela(funcionario.getDataDemissao())%>&dataNascimento=<%=converte.converteTela(funcionario.getDataNascimento())%>&dataPagamento=<%=converte.converteTela(funcionario.getDataPagamento())%>&codigoFuncao=<%=funcionario.getFuncao().getCodFuncao()%>&salario=<%=funcionario.getSalario()%>&curriculo=<%=funcionario.getCurriculo()%>&mensagem=Altere os dados e clique no botão alterar">Alterar</a></td>
            <td><a href="CadastroFuncionario.jsp?opcao=excluir&codFuncionario=<%=funcionario.getCodFuncionario()%>&nomeFuncionario=<%=funcionario.getNome()%>&cpf=<%=funcionario.getCpf()%>&rg=<%=funcionario.getRg()%>&carteiraTrabalho=<%=funcionario.getCarteiraTrabalho()%>&endereco=<%=funcionario.getEndereco()%>&bairro=<%=funcionario.getBairro()%>&cidade=<%=funcionario.getCidade()%>&cep=<%=funcionario.getCep()%>&uf=<%=funcionario.getUf()%>&telefone=<%=funcionario.getTelefone()%>&celular=<%=funcionario.getCelular()%>&dataAdmissao=<%=converte.converteTela(funcionario.getDataAdmissao())%>&dataDemissao=<%=converte.converteTela(funcionario.getDataDemissao())%>&dataNascimento=<%=converte.converteTela(funcionario.getDataNascimento())%>&dataPagamento=<%=converte.converteTela(funcionario.getDataPagamento())%>&codigoFuncao=<%=funcionario.getFuncao().getCodFuncao()%>&salario=<%=funcionario.getSalario()%>&curriculo=<%=funcionario.getCurriculo()%>&mensagem=Clique em excluir para apagar">Excluir</a></td>
        </tr>
        <%}%>
    </tbody>
</table>