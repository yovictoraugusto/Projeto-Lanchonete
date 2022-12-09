<%@page  import ="modelo.*" %>

<%
Entrega entrega = new Entrega();
String opcao = request.getParameter("opcao");
String codEntrega = request.getParameter("codEntrega");
entrega.setCodEntrega(Integer.parseInt(request.getParameter("codEntrega")));
entrega.setValor(Double.parseDouble(request.getParameter("valor")));
entrega.getVenda().setCodVenda(Integer.parseInt(request.getParameter("venda")));
entrega.getCliente().setCodCliente(Integer.parseInt(request.getParameter("cliente")));

DAOEntrega daoEntrega = new DAOEntrega();

if(opcao.equals("cadastrar")){
    response.sendRedirect("CadastroEntrega.jsp?mensagem="+daoEntrega.inserir(entrega));
}
if(opcao.equals("alterar")){
    response.sendRedirect("CadastroEntrega.jsp?mensagem="+daoEntrega.alterar(entrega));
}
if(opcao.equals("excluir")){
    response.sendRedirect("CadastroEntrega.jsp?mensagem="+daoEntrega.remover(entrega));
}

%>