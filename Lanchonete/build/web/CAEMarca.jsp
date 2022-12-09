<%@page  import ="modelo.*" %>
<%
String opcao = request.getParameter("opcao");
String codMarca = request.getParameter("codMarca");

Marca marca = new Marca();
marca.setCodMarca(Integer.parseInt(codMarca));
marca.setNome(request.getParameter("nome"));


DAOMarca daoMarca = new DAOMarca();

if(opcao.equals("cadastrar")){
    String mensagem = daoMarca.inserir(marca);
    response.sendRedirect("CadastroMarca.jsp?mensagem="+mensagem);
}
if(opcao.equals("alterar")){
    String mensagem = daoMarca.alterar(marca);
    response.sendRedirect("CadastroMarca.jsp?mensagem="+mensagem);
}
if(opcao.equals("excluir")){
    String mensagem = daoMarca.remover(marca);
    response.sendRedirect("CadastroMarca.jsp?mensagem="+mensagem);
}
%>