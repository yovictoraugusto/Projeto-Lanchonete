<%@include file="Menu.jsp" %>

<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<script>
function enviar(par) {
if (par == 'cadastrar') {
       if (  isNaN( document.cadastro.valor.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo valor';
        }
else {
document.cadastro.opcao.value = 'cadastrar';
document.cadastro.action = 'CAEEntrega.jsp';
document.cadastro.submit();
}
} else if (par == 'cancelar') {
document.cadastro.opcao.value = 'cadastro';
document.cadastro.valor.value = '';
document.cadastro.action = 'CadastroEntrega.jsp';
document.cadastro.submit();
} else if (par == 'alterar') {
if (  isNaN( document.cadastro.valor.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo valor';
        }
else {
document.cadastro.opcao.value = 'alterar';
document.cadastro.action = 'CAEEntrega.jsp';
document.cadastro.submit();
} 
}else if (par == 'excluir') {
document.cadastro.opcao.value = 'excluir';
document.cadastro.action = 'CAEEntrega.jsp';
document.cadastro.submit();
}
}

</script>

<%
DAOVenda daoVenda = new DAOVenda();
DAOCliente daoCliente = new DAOCliente();
List<Venda> listaVenda = daoVenda.consultar();
List<Cliente> listaCliente = daoCliente.consultar();
String mensagem = request.getParameter("mensagem");
String codEntrega = request.getParameter("codEntrega");
String valor = request.getParameter("valor");
String codVenda = request.getParameter("codVenda");
String codCliente = request.getParameter("codCliente");
if(codEntrega==null)codEntrega="0";
if(codVenda==null)codVenda="0";
if(codCliente==null)codCliente="0";
String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Entrega</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <form name="cadastro">
            <h1>Cadastro de Entrega</h1>
            <p> <label>Valor: </label> <input type="text" name="valor" value="<%=valor==null ? "" : valor%>" size="30" /></p>
            
             <p><label>Venda:</label>
                <select name="venda">
                    <% for (Venda venda: listaVenda) {%>
                    <%if(codVenda.equals(String.valueOf(venda.getCodVenda()))){%>
                    <option selected value="<%=venda.getCodVenda()%>"><%=venda.getCodVenda() %>-<%=venda.getCliente().getNome() %></option>
                    <%}else{%>
                    <option value="<%=venda.getCodVenda()%>"><%=venda.getCodVenda()%>-<%=venda.getCliente().getNome() %></option>
                    <%}%>
                    <%}%>
            </select>
            </p>           
            <p></p>

            <%if(opcao.equals("cadastro")){%>
                <input type="button" onclick="enviar('cadastrar')" value="Cadastrar" name="Cadastrar" />
            <%}%>
            <%if(opcao.equals("alterar")){%>
               <input type="button" onclick="enviar('alterar')"  value="Alterar" name="Cadastrar" />
               <input type="button" onclick="enviar('cancelar'')" value="Cancelar" name="Cadastrar" />
            <%}%>
              
            <%if(opcao.equals("excluir")){%>
                 <input type="button" onclick="enviar('excluir')" value="Excluir" name="Cadastrar" /> 
                <input type="button" onclick="enviar('cancelar')" value="Cancelar" name="Cadastrar" />
            <%}%>
            <div class="caixa">
            <p> <textarea name="mensagem" rows="3" cols="50" readonly="readonly">
                    <%=mensagem==null?"":mensagem%>
                </textarea></p>
            </div>
                <input type="hidden" name="opcao" value="" />
                <input type="hidden" name="codEntrega" value="<%=codEntrega%>" />
        </form>
        </div>
        </div>
             <%@include file="ListarEntrega.jsp"%>
             <%@include file="footer.jsp" %>
    </body>
</html>