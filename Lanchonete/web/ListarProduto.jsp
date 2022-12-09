<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<%
DAOProduto daoProduto = new DAOProduto();
List<Produto> listaProduto = daoProduto.consultar();
%>

<table border="1" class="listaCorpo">
    <thead>
        <tr>
            <th>CÓDIGO PRODUTO</th>
            <th>NOME</th>
            <th>DESCRICAO</th>
            <th>PRECO DE CUSTO</th>
            <th>PRECO DE VENDA</th>
            <th>QUANTIDADE EM ESTOQUE</th>
            <th>QUANTIDADE MINIMA</th>
            <th>CARDAPIO</th>
            <th>UNIDADE</th>
            <th>MARCA</th>
            <th>ALTERAR</th>
            <th>EXCLUIR</th>
        </tr>
    </thead>
    <tbody>
        <%for(Produto produto:listaProduto){%>
        <tr>
            <td><%=produto.getCodProduto()%></td>
            <td><%=produto.getNome()%></td>
            <td><%=produto.getDescricao()%></td>
            <td><%=produto.getPrecoCusto()%></td>
            <td><%=produto.getPrecoVenda()%></td>
            <td><%=produto.getQuantidadeEstoque()%></td>
            <td><%=produto.getQuantidadeMinima()%></td>
            <td><%=produto.getCardapio()%></td>
            <td><%=produto.getUnidade().getNome()%></td>
            <td><%=produto.getMarca().getNome()%></td>
            <td><a href="CadastroProduto.jsp?opcao=alterar&codProduto=<%=produto.getCodProduto()%>&nome=<%=produto.getNome()%>&descricao=<%=produto.getDescricao()%>&precoCusto=<%=produto.getPrecoCusto()%>&precoVenda=<%=produto.getPrecoVenda()%>&quantidadeEstoque=<%=produto.getQuantidadeEstoque()%>&quantidadeMinima=<%=produto.getQuantidadeMinima()%>&cardapio=<%=produto.getCardapio()%>&codUnidade=<%=produto.getUnidade().getCodUnidade()%>&codMarca=<%=produto.getMarca().getCodMarca()%>&mensagem=Altere os dados e clique no botão alterar">Alterar</a></td>
            <td><a href="CadastroProduto.jsp?opcao=excluir&codProduto=<%=produto.getCodProduto()%>&nome=<%=produto.getNome()%>&descricao=<%=produto.getDescricao()%>&precoCusto=<%=produto.getPrecoCusto()%>&precoVenda=<%=produto.getPrecoVenda()%>&quantidadeEstoque=<%=produto.getQuantidadeEstoque()%>&quantidadeMinima=<%=produto.getQuantidadeMinima()%>&cardapio=<%=produto.getCardapio()%>&codUnidade=<%=produto.getUnidade().getCodUnidade()%>&codMarca=<%=produto.getMarca().getCodMarca()%>&mensagem=Exclua os dados no botão excluir">Excluir</a></td>

        </tr>
        <%}%>
    </tbody>
</table>