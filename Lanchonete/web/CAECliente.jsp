<%@page  import ="modelo.*" %>

<%
ConverteData converte = new ConverteData();
    
String opcao = request.getParameter("opcao");
String codCliente = request.getParameter("codCliente");

Cliente cliente = new Cliente();
cliente.setCodCliente(Integer.parseInt(codCliente));
cliente.setNome(request.getParameter("nome"));
cliente.setCpf(request.getParameter("cpf"));
cliente.setRg(request.getParameter("rg"));
cliente.setEndereco(request.getParameter("endereco"));
cliente.setBairro(request.getParameter("bairro"));
cliente.setCidade(request.getParameter("cidade"));
cliente.setCep(request.getParameter("cep"));
cliente.setUf(request.getParameter("uf"));
cliente.setTelefone(request.getParameter("telefone"));
cliente.setCelular(request.getParameter("celular"));
cliente.setContatoVirtual(request.getParameter("contatoVirtual"));
cliente.setDataNascimento(converte.converteCalendario(request.getParameter("dataNascimento")));

DAOCliente daoCliente = new DAOCliente();

if(opcao.equals("cadastrar")){
    String mensagem = daoCliente.inserir(cliente);
    response.sendRedirect("CadastroCliente.jsp?mensagem="+mensagem);
}
if(opcao.equals("alterar")){
    String mensagem = daoCliente.alterar(cliente);
    response.sendRedirect("CadastroCliente.jsp?mensagem="+mensagem);
}
if(opcao.equals("excluir")){
    String mensagem = daoCliente.excluir(cliente);
    response.sendRedirect("CadastroCliente.jsp?mensagem="+mensagem);
}
%>