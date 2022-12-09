<%@page import="modelo.*"%>

<%
ConverteData converte = new ConverteData();
Funcionario funcionario = new Funcionario();
funcionario.setCodFuncionario(Integer.parseInt(request.getParameter("codFuncionario")));
funcionario.setNome(request.getParameter("nomeFuncionario"));
funcionario.setCpf(request.getParameter("cpf"));
funcionario.setRg(request.getParameter("rg"));
funcionario.setCarteiraTrabalho(request.getParameter("carteiraTrabalho"));
funcionario.setEndereco(request.getParameter("endereco"));
funcionario.setBairro(request.getParameter("bairro"));
funcionario.setCidade(request.getParameter("cidade"));
funcionario.setCep(request.getParameter("cep"));
funcionario.setUf(request.getParameter("uf"));
funcionario.setTelefone(request.getParameter("telefone"));
funcionario.setCelular(request.getParameter("celular"));
funcionario.setDataAdmissao(converte.converteCalendario(request.getParameter("dataAdmissao")));
funcionario.setDataDemissao(converte.converteCalendario(request.getParameter("dataDemissao")));
funcionario.setDataNascimento(converte.converteCalendario(request.getParameter("dataNascimento")));
funcionario.setDataPagamento(converte.converteCalendario(request.getParameter("dataPagamento")));
funcionario.setSalario(Double.parseDouble(request.getParameter("salario")));
funcionario.setCurriculo(request.getParameter("curriculo"));
funcionario.getFuncao().setCodFuncao(Integer.parseInt(request.getParameter("funcao")));

String opcao = request.getParameter("opcao");
DAOFuncionario daoFuncionario = new DAOFuncionario();

if(opcao.equals("cadastrar")){
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.inserir(funcionario));
}
if(opcao.equals("alterar")){
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.alterar(funcionario));
}
if(opcao.equals("excluir")){
    response.sendRedirect("CadastroFuncionario.jsp?mensagem="+daoFuncionario.remover(funcionario));
}
%>