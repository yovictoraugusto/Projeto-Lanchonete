<%@page import="java.util.List"%>
<%@page import="modelo.*"%>

<%
DAOCliente daoCliente = new DAOCliente();
List<Cliente> listaCliente = daoCliente.consultar();
ConverteData converte = new ConverteData();
%>
    <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
<table border=1 class="listaCorpo">
    <thead>
        <tr>
            <th>CODCLIENTE</th>
            <th>NOME</th>
            <th>CPF</th>
            <th>RG</th>
            <th>ENDEREÇO</th>
            <th>BAIRRO</th>
            <th>CIDADE</th>
            <th>CEP</th>
            <th>UF</th>
            <th>TELEFONE</th>
            <th>CELULAR</th>
            <th>CONTATO VIRTUAL</th>
            <th>DATA DE NASCIMENTO</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody
        <%for (Cliente cliente : listaCliente){%>
            <tr>
                <td><%= cliente.getCodCliente()%></td>
                <td><%= cliente.getNome()%></td>
                <td><%=cliente.getCpf()%></td>
                <td><%=cliente.getRg()%></td>
                <td><%=cliente.getEndereco()%></td>
                <td><%=cliente.getBairro()%></td>
                <td><%=cliente.getCidade()%></td>
                <td><%=cliente.getCep()%></td>
                <td><%=cliente.getUf()%></td>
                <td><%=cliente.getTelefone()%></td>
                <td><%=cliente.getCelular()%></td>
                <td><%=cliente.getContatoVirtual()%></td>
                <td><%=converte.converteTela(cliente.getDataNascimento())%></td>
                <td><a href="CadastroCliente.jsp?opcao=alterar&codCliente=<%=cliente.getCodCliente()%>&nome=<%=cliente.getNome()%>&cpf=<%=cliente.getCpf()%>&rg=<%=cliente.getRg()%>&endereco=<%=cliente.getEndereco()%>&bairro=<%=cliente.getBairro()%>&cidade=<%=cliente.getCidade()%>&cep=<%=cliente.getCep()%>&uf=<%=cliente.getUf()%>&telefone=<%=cliente.getTelefone()%>&celular=<%=cliente.getCelular()%>&contatoVirtual=<%=cliente.getContatoVirtual()%>&dataNascimento=<%=converte.converteTela(cliente.getDataNascimento())%>">Alterar</a></td>
                <td><a href="CadastroCliente.jsp?opcao=excluir&codCliente=<%=cliente.getCodCliente()%>&nome=<%=cliente.getNome()%>&cpf=<%=cliente.getCpf()%>&rg=<%=cliente.getRg()%>&endereco=<%=cliente.getEndereco()%>&bairro=<%=cliente.getBairro()%>&cidade=<%=cliente.getCidade()%>&cep=<%=cliente.getCep()%>&uf=<%=cliente.getUf()%>&telefone=<%=cliente.getTelefone()%>&celular=<%=cliente.getCelular()%>&contatoVirtual=<%=cliente.getContatoVirtual()%>&dataNascimento=<%=converte.converteTela(cliente.getDataNascimento())%>">Excluir</a></td>
            </tr>
        <%}%>
    </tbody>
</table>