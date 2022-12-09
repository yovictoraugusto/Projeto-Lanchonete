
<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Vendas</title>
    </head>
    <body>
         

<%@page import="modelo.DAOProduto"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.DAOItensVenda"%>
<%@page import="modelo.itensVenda"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ConverteData"%>
<%@page import="modelo.DAOVenda"%>

<%
    
    String codVenda = request.getParameter("codVenda");
    String idprodAdquirido = request.getParameter("idProdAdquirido");
    String dataHora = request.getParameter("dataHora");
    String opcao = request.getParameter("opcao");
    
    ConverteData converte = new ConverteData();
    Venda venda = new Venda();
   
    venda.setCodVenda(Integer.parseInt(codVenda));
    venda.setDataHora(converte.converteCalendario(request.getParameter("dataHora")));
    venda.setDesconto(Double.parseDouble(request.getParameter("desconto")));
    venda.setComissao(Double.parseDouble(request.getParameter("comissao")));
    venda.setTipoPagamento(request.getParameter("tipoPagamento"));
    venda.getCliente().setCodCliente(Integer.parseInt(request.getParameter("cliente")));
    venda.getFuncionario().setCodFuncionario(Integer.parseInt(request.getParameter("funcionario")));
     
     
     
    DAOVenda daoVenda = new DAOVenda();
    itensVenda itensVenda = new itensVenda();
    DAOItensVenda daoItens = new DAOItensVenda();

    if (opcao.equals("cadastrar") && codVenda.equals("0")) {
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoVenda.inserir(venda)+"&codVenda="+daoVenda.getLastId()+"&codCliente="+venda.getCliente().getCodCliente()+"&codFuncionario="+venda.getFuncionario().getCodFuncionario()+"&desconto="+venda.getDesconto()+"&comissao="+venda.getComissao()+"&tipoPagamento="+venda.getTipoPagamento()+"&dataHora="+dataHora);
    }
    if (opcao.equals("vender")){
        Produto produto = new Produto();
        DAOProduto daoProduto = new DAOProduto();
        produto = daoProduto.localizar(Integer.parseInt(request.getParameter("codProduto")));
        double precoVenda = produto.getPrecoVenda();
        itensVenda.setVenda(Integer.parseInt(codVenda));
        itensVenda.getProduto().setCodProduto(Integer.parseInt(request.getParameter("codProduto")));
        itensVenda.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        itensVenda.setPrecoVenda(precoVenda);
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoItens.incluir(itensVenda)+"&codVenda="+codVenda+"&codCliente="+venda.getCliente().getCodCliente()+"&desconto="+venda.getDesconto()+"&comissao="+venda.getComissao()+"&tipoPagamento="+venda.getTipoPagamento()+"&dataHora="+dataHora);
    }
      if (opcao.equals("remover")){
        itensVenda.setCodItensVenda(Integer.parseInt(idprodAdquirido));
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoItens.remover(itensVenda)+"&codVenda="+codVenda+"&codCliente="+venda.getCliente().getCodCliente()+"&desconto="+venda.getDesconto()+"&comissao="+venda.getComissao()+"&tipoPagamento="+venda.getTipoPagamento()+"&dataHora="+dataHora);
    }
    if (opcao.equals("finalizar")){
        response.sendRedirect("CadastroVenda.jsp?mensagem=Venda Finalizada&codVenda=0");
    }
     if (opcao.equals("cancelar")){
        response.sendRedirect("CadastroVenda.jsp?mensagem=" + daoVenda.remover(venda)+"&codigoVenda=0");
    }


%>
</body>
</html>