<%@include file="Menu.jsp" %>
<%@page import="java.util.List"%>

<script>
function enviar(par) {
if (par == 'cadastrar') {
if (document.cadastro.nome.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo nome';
}
else if (TestaCPF(document.cadastro.cpf.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo cpf';
} 
else if (ValidaRg(document.cadastro.rg.value) == 'v') {
document.cadastro.mensagem.value = 'Preencha o campo rg';
}
else if (document.cadastro.endereco.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo endereco';
}
else if (document.cadastro.bairro.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo bairro';
}
else if (ValidaCep(document.cadastro.cep.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo cep';
}
else if (document.cadastro.uf.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo uf';
}
else if (document.cadastro.telefone.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo telefone';
}
else if (document.cadastro.celular.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo celular';
}
else if (document.cadastro.contatoVirtual.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo contato virtual';
}
else if(ValidaData(document.cadastro.dataNascimento.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo data de nascimento';
}
else {
document.cadastro.opcao.value = 'cadastrar';
document.cadastro.action = 'CAECliente.jsp';
document.cadastro.submit();
}
} else if (par == 'cancelar') {
document.cadastro.opcao.value = 'cadastro';
document.cadastro.nome.value = '';
document.cadastro.cpf.value = '';
document.cadastro.rg.value = '';
document.cadastro.endereco.value = '';
document.cadastro.bairro.value = '';
document.cadastro.cidade.value = '';
document.cadastro.cep.value = '';
document.cadastro.uf.value = '';
document.cadastro.telefone.value = '';
document.cadastro.celular.value = '';
document.cadastro.contatoVirtual.value = '';
document.cadastro.dataNascimento.value = '';
document.cadastro.action = 'CadastroCliente.jsp';
document.cadastro.submit();
} else if (par == 'alterar') {
if (document.cadastro.nome.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo nome';
}
else if (TestaCPF(document.cadastro.cpf.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo cpf';
} 
else if (ValidaRg(document.cadastro.rg.value) == 'v') {
document.cadastro.mensagem.value = 'Preencha o campo rg';
}
else if (document.cadastro.endereco.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo endereco';
}
else if (document.cadastro.bairro.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo bairro';
}
else if (ValidaCep(document.cadastro.cep.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo cep';
}
else if (document.cadastro.uf.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo uf';
}
else if (document.cadastro.telefone.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo telefone';
}
else if (document.cadastro.celular.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo celular';
}
else if (document.cadastro.contatoVirtual.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo contato virtual';
}
else if (ValidaData(document.cadastro.dataNascimento.value) == false) {
document.cadastro.mensagem.value = 'Preencha o campo data de nascimento';
}else {
document.cadastro.opcao.value = 'alterar';
document.cadastro.action = 'CAECliente.jsp';
document.cadastro.submit();
}
} else if (par == 'excluir') {
document.cadastro.opcao.value = 'excluir';
document.cadastro.action = 'CAECliente.jsp';
document.cadastro.submit();
}
}

</script>
<%-- 
    Document   : CadastroCliente
    Created on : 14/04/2020, 08:52:37
    Author     : victor
--%>
<%
String mensagem = request.getParameter("mensagem");
String codCliente = request.getParameter("codCliente");
if(codCliente==null)codCliente="0";
String nome = request.getParameter("nome");
String cpf = request.getParameter("cpf");
String rg = request.getParameter("rg");
String endereco = request.getParameter("endereco");
String bairro = request.getParameter("bairro");
String cidade = request.getParameter("cidade");
String cep = request.getParameter("cep");
String uf = request.getParameter("uf");
String telefone = request.getParameter("telefone");
String celular = request.getParameter("celular");
String contatoVirtual = request.getParameter("contatoVirtual");
String dataNascimento = request.getParameter("dataNascimento");

String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Clientes</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <form name="cadastro">
            <h1>Cadastro de Clientes</h1>
            <p> <label>Nome: </label> <input type="text" name="nome" value="<%=nome==null ? "" : nome%>" size="30" /></p>
            
            <p> <label>CPF: </label> <input type="number" name="cpf" value="<%=cpf==null ? "" : cpf%>" size="30" placeholder="Digite somente números" /></p>
            
            <p> <label>RG:  </label> <input type="number" name="rg" value="<%=rg==null ? "" : rg%>" size="30" /></p>
            
            <p> <label>Endereco:  </label> <input type="text" name="endereco" value="<%=endereco==null ? "" : endereco%>" size="30" /></p>
            
            <p> <label>Bairro: </label> <input type="text" name="bairro" value="<%=bairro==null ? "" : bairro%>" size="30" /></p>
            
            <p> <label>Cidade: </label> <input type="text" name="cidade" value="<%=cidade==null ? "" : cidade%>" size="30" /></p>
            
            <p> <label>CEP: </label> <input type="number" name="cep" value="<%=cep==null ? "" : cep%>" size="30" placeholder="Digite somente números" /></p>
            
            <p> <label>UF: </label> <input type="text" name="uf" value="<%=uf==null ? "" : uf%>" size="30" /></p>
            
            <p> <label>Telefone: </label> <input type="number" name="telefone" value="<%=telefone==null ? "" : telefone%>" size="30" /></p>
            
            <p> <label>Celular: </label> <input type="number" name="celular" value="<%=celular==null ? "" : celular%>" size="30" /></p>
            
            <p> <label>Contato Virtual: </label> <input type="text" name="contatoVirtual" value="<%=contatoVirtual==null ? "" : contatoVirtual%>" size="30" /></p>
            
            <p> <label>Data de Nascimento: </label> <input type="text" name="dataNascimento" value="<%=dataNascimento==null ? "" : dataNascimento%>" size="30" /></p>
            
            <p></p>
            
            <%if(opcao.equals("cadastro")){%>
            <p>    <input type="button" onclick="enviar('cadastrar')" value="Cadastrar" name="Cadastrar" /> </p>
            <%}%>
            
            <%if(opcao.equals("alterar")){%>
            <p>    <input type="button" onclick="enviar('alterar')"  value="Alterar" name="Cadastrar" /> </p>
              <p>    <input type="button" onclick="enviar('cancelar')" value="Cancelar" name="Cadastrar" /> </p>
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
                <input type="hidden" name="codCliente" value="<%=codCliente%>" />
        </form>
        </div>
        </div>
             <%@include file="ListarCliente.jsp"%>
             <%@include file="footer.jsp" %>
    </body>
</html>
