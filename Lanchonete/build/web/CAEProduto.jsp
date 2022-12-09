<%@page  import ="modelo.*" %>
<%
Produto produto = new Produto();
String opcao = request.getParameter("opcao");
produto.setCodProduto(Integer.parseInt(request.getParameter("codProduto")));
produto.setNome(request.getParameter("nome"));
produto.setDescricao(request.getParameter("descricao"));
produto.setPrecoCusto(Double.parseDouble(request.getParameter("precoCusto")));
produto.setPrecoVenda(Double.parseDouble(request.getParameter("precoVenda")));
produto.setQuantidadeEstoque(Double.parseDouble(request.getParameter("quantidadeEstoque")));
produto.setQuantidadeMinima(Double.parseDouble(request.getParameter("quantidadeMinima")));
produto.setCardapio(request.getParameter("cardapio"));
produto.getUnidade().setCodUnidade(Integer.parseInt(request.getParameter("unidade")));
produto.getMarca().setCodMarca(Integer.parseInt(request.getParameter("marca")));


DAOProduto daoProduto = new DAOProduto();

if(opcao.equals("cadastrar")){
    response.sendRedirect("CadastroProduto.jsp?mensagem="+daoProduto.inserir(produto));
}
if(opcao.equals("alterar")){
    response.sendRedirect("CadastroProduto.jsp?mensagem="+daoProduto.alterar(produto));
}
if(opcao.equals("excluir")){
    response.sendRedirect("CadastroProduto.jsp?mensagem="+daoProduto.remover(produto));
}
%>
