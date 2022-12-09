<%@page import="java.util.ArrayList"%>
<%@include file="Menu.jsp" %>
<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<script>
function enviar(par) {
if (par == 'cadastrar') {
if (document.cadastro.dataHora.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo dataHora';
}
else if(  isNaN( document.cadastro.desconto.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo desconto';
        } 
else if(  isNaN( document.cadastro.comissao.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo comissao';
        } 
else if (document.cadastro.tipoPagamento.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo tipoPagamento';
}
else {
document.cadastro.opcao.value = 'cadastrar';
document.cadastro.action = 'CAEVenda.jsp';
document.cadastro.submit();
}
} else if (par == 'vender') {
            if (document.cadastro.codProduto.value == '') {
                document.cadastro.mensagem.value = 'Selecione um produto para venda';
            } else {
            document.cadastro.opcao.value = 'vender';
            document.cadastro.action = 'CAEVenda.jsp';
            document.cadastro.submit();
        }
    }else if (par == 'remover') {
            if (document.cadastro.idProdAdquirido.value == '') {
                document.cadastro.mensagem.value = 'Selecione um produto para remover';
            } else {
            document.cadastro.opcao.value = 'remover';
            document.cadastro.action = 'CAEVenda.jsp';
            document.cadastro.submit();
        }
    }
            /// }
         else if (par == 'finalizar') {
            document.cadastro.opcao.value = 'finalizar';
            document.cadastro.action = 'CAEVenda.jsp';
            document.cadastro.submit();
        } else if (par == 'cancelar') {
            document.cadastro.opcao.value = 'cancelar';
            document.cadastro.action = 'CAEVenda.jsp';
            document.cadastro.submit();
        }
}
</script>

<%
DAOCliente daoCliente = new DAOCliente();
List<Cliente> listaCliente = daoCliente.consultar();
DAOProduto daoProduto = new DAOProduto();
List<Produto> listaProduto = daoProduto.consultar();
ConverteData data = new ConverteData();
String dataAtual = data.dataAtual();

List<String> listaPagamento = new ArrayList();
listaPagamento.add("Dinheiro");
listaPagamento.add("Cartao de credito");
listaPagamento.add("Cartao de debito");
listaPagamento.add("Boleto");
listaPagamento.add("Chegue");
listaPagamento.add("Ticket");

String codCliente = request.getParameter("codCliente");
String nomeCliente = request.getParameter("nomeCliente");
DAOFuncionario daoFuncionario = new DAOFuncionario();
List<Funcionario> listaFuncionario = daoFuncionario.consultar();
String codFuncionario = request.getParameter("codFuncionario");
String nomeFuncionario = request.getParameter("nomeFuncionario");
String mensagem = request.getParameter("mensagem");
String codVenda = request.getParameter("codVenda");
if(codVenda==null)codVenda="0";
String dataHora = request.getParameter("dataHora");
String desconto = request.getParameter("desconto");
String comissao = request.getParameter("comissao");
String tipoPagamento = request.getParameter("tipoPagamento");
System.out.println("tipo de pagamento="+tipoPagamento);

String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";

if(codCliente==null)codCliente="0";
if(codFuncionario==null)codFuncionario="0";
if(codVenda==null)codVenda="0";
if (dataHora == null) {
       dataHora = dataAtual;
    }
if(tipoPagamento==null)tipoPagamento="Selecione";

DAOItensVenda daoItensVenda = new DAOItensVenda();
List<itensVenda> listaItens = daoItensVenda.getLista(Integer.parseInt(codVenda));
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Vendas</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <form name="cadastro">
            <h1>Cadastro de Vendas</h1>
            <p> <label>Data Hora: </label> <input type="text" name="dataHora" value="<%=dataHora==null ? "" : dataHora%>" size="30" /></p>
            
            <p> <label>Desconto: </label> <input type="text" name="desconto" value="<%=desconto==null ? "" : desconto%>" size="30" /></p>
            
            <p> <label>Comissao:  </label> <input type="text" name="comissao" value="<%=comissao==null ? "" : comissao%>" size="30" /></p>
            
            <p><label>Cliente: </label></p>
                <select name="cliente">
                    <% for (Cliente cliente: listaCliente) {%>
                    <%if(codCliente.equals(String.valueOf(cliente.getCodCliente()))){%>
                    <option selected value="<%=cliente.getCodCliente()%>"><%=cliente.getNome()%></option>
                    <%}else{%>
                    <option value="<%=cliente.getCodCliente()%>"><%=cliente.getNome()%></option>
                    <%}%>
                    <%}%>
                </select>
                
                <p><label>Funcionario: </label></p>
                <select name="funcionario">
                    <% for (Funcionario funcionario: listaFuncionario) {%>
                    <%if(codFuncionario.equals(String.valueOf(funcionario.getCodFuncionario()))){%>
                    <option selected value="<%=funcionario.getCodFuncionario()%>"><%=funcionario.getNome()%></option>
                    <%}else{%>
                    <option value="<%=funcionario.getCodFuncionario()%>"><%=funcionario.getNome()%></option>
                    <%}%>
                    <%}%>
                </select>
            
            <p> <label>Tipo de Pagamento: </label>  
                <select name="tipoPagamento">
                <% for (String listaC: listaPagamento) {%>
                    <%if(tipoPagamento.equals(listaC)){%>
                    <option selected value="<%=listaC%>"><%=listaC%></option>
                    <%}else{%>
                    <option value="<%=listaC%>"><%=listaC%></option>
                    <%}%>
                    <%}%>
                </select>
                </p>
                  
<p></p>

            <% if (!codVenda.equals("0")) { %>
            <table border="0" cellspacing="3" cellpadding="3">
                <tr>
                    <td>
                        <p>  <label> Lista de Produtos:</label> <br>
                            <select name="codProduto" size="10">
                                <% for (Produto lista : listaProduto) {%>
                                <option  value="<%= lista.getCodProduto()%>"><%= lista.getDescricao()%> R$: <%= lista.getPrecoVenda()%></option>
                                <% } %>
                            </select></p>
                    </td>
                    <td>
                        Quant.<br>
                        <input type="text" name="quantidade" value="1"  size="2" /><br><br>
                        
                        <input type="button" value="Vender" name="vender" onclick="enviar('vender')" />
                    </td>
                    <td>
                        <p>  <label> Produtos Vendidos:</label> <br>
                            <select name="idProdAdquirido" size="10">
                                <% for (itensVenda lista : listaItens) {%>
                                <option  value="<%= lista.getCodItensVenda() %>"><%= lista.getProduto().getDescricao()%> Qde: <%= lista.getQuantidade()%> R$: <%= lista.getPrecoVenda()%></option>
                                <% } %>
                            </select>
                        <input type="button" value="Remover" name="remover" onclick="enviar('remover')" />
                        </p>
                    </td>
                </tr>

            </table>





            <% } %>
            
            <%if(opcao.equals("cadastro")){%>
            <p>    <input type="button" onclick="enviar('cadastrar')" value="Cadastrar" name="Cadastro" /> </p>
            <%}%>
            
            <%if(opcao.equals("alterar")){%>
            <p>    <input type="button" onclick="enviar('alterar')"  value="Alterar" name="Cadastrar" /> </p>
              <p>    <input type="button" onclick="enviar('cancelar'')" value="Cancelar" name="Cadastrar" /> </p>
            <%}%>
              
            <%if(opcao.equals("excluir")){%>
            <p>    <input type="button" onclick="enviar('excluir')" value="Excluir" name="Cadastrar" /> </p>  
            <p>    <input type="button" onclick="enviar('cancelar')" value="Cancelar" name="Cadastrar" /> </p>
            <%}%>
           

            <% if (!codVenda.equals("0")) { %>
            <input type="button" value="Finalizar" name="finalizar" onclick="enviar('finalizar')"/>
            <input type="button" value="Cancelar" name="cancelar" onclick="enviar('cancelar')"/>
            <% }%>
            <div class="caixa">
            <p> <textarea name="mensagem" rows="3" cols="50" readonly="readonly">
                    <%=mensagem==null?"":mensagem%>
                </textarea></p>
            </div>
                <input type="hidden" name="opcao" value="" />
                <input type="hidden" name="codVenda" value="<%=codVenda%>" />
        </form>
         </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
