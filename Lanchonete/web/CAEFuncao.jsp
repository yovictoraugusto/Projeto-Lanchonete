<%@page  import ="modelo.*" %>
<%
String opcao = request.getParameter("opcao");
String codFuncao = request.getParameter("codFuncao");

Funcao funcao = new Funcao();
funcao.setCodFuncao(Integer.parseInt(codFuncao));
funcao.setNome(request.getParameter("nome"));


DAOFuncao daoFuncao = new DAOFuncao();

if(opcao.equals("cadastrar")){
    String mensagem = daoFuncao.inserir(funcao);
    response.sendRedirect("CadastroFuncao.jsp?mensagem="+mensagem);
}
if(opcao.equals("alterar")){
    String mensagem = daoFuncao.alterar(funcao);
    response.sendRedirect("CadastroFuncao.jsp?mensagem="+mensagem);
}
if(opcao.equals("excluir")){
    String mensagem = daoFuncao.remover(funcao);
    response.sendRedirect("CadastroFuncao.jsp?mensagem="+mensagem);
}
%>
