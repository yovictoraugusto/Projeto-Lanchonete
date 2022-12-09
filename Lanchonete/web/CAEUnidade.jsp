<%@page  import ="modelo.*" %>
<%
String opcao = request.getParameter("opcao");
String codUnidade = request.getParameter("codUnidade");

Unidade unidade = new Unidade();
unidade.setCodUnidade(Integer.parseInt(codUnidade));
unidade.setNome(request.getParameter("nome"));


DAOUnidade daoUnidade = new DAOUnidade();

if(opcao.equals("cadastrar")){
    String mensagem = daoUnidade.inserir(unidade);
    response.sendRedirect("CadastroUnidade.jsp?mensagem="+mensagem);
}
if(opcao.equals("alterar")){
    String mensagem = daoUnidade.alterar(unidade);
    response.sendRedirect("CadastroUnidade.jsp?mensagem="+mensagem);
}
if(opcao.equals("excluir")){
    String mensagem = daoUnidade.remover(unidade);
    response.sendRedirect("CadastroUnidade.jsp?mensagem="+mensagem);
}
%>