<%@include file="Menu.jsp" %>

<script>
function enviar(par) {
if (par == 'cadastrar') {
if (document.cadastro.nome.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo nome';
}
else {
document.cadastro.opcao.value = 'cadastrar';
document.cadastro.action = 'CAEUnidade.jsp';
document.cadastro.submit();
}
} else if (par == 'cancelar') {
document.cadastro.opcao.value = 'cadastro';
document.cadastro.nome.value = '';
document.cadastro.action = 'CadastroUnidade.jsp';
document.cadastro.submit();
} else if (par == 'alterar') {
if (document.cadastro.nome.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo nome';
}
else {
document.cadastro.opcao.value = 'alterar';
document.cadastro.action = 'CAEUnidade.jsp';
document.cadastro.submit();
}
} else if (par == 'excluir') {
document.cadastro.opcao.value = 'excluir';
document.cadastro.action = 'CAEUnidade.jsp';
document.cadastro.submit();
}
}
</script>
<%-- 
    Document   : CadastroUnidade
    Created on : 16/04/2020, 12:15:01
    Author     : victo
--%>

<%
String mensagem = request.getParameter("mensagem");
String codUnidade = request.getParameter("codUnidade");
if(codUnidade==null)codUnidade="0";
String nome = request.getParameter("nome");

String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Unidades</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <form name="cadastro">
            <h1>Cadastro de Unidades</h1>
            <p> <label>Nome: </label> <input type="text" name="nome" value="<%=nome==null ? "" : nome%>" size="30" /></p>
            
            <p></p>
            
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
            <div class="caixa">
            <p> <textarea name="mensagem" rows="3" cols="50" readonly="readonly">
                    <%=mensagem==null?"":mensagem%>
                </textarea></p>
            </div>
                <input type="hidden" name="opcao" value="" />
                <input type="hidden" name="codUnidade" value="<%=codUnidade%>" />
        </form>
         </div>
        </div>
             <%@include file="ListarUnidade.jsp"%>
             <%@include file="footer.jsp" %>
    </body>
</html>

