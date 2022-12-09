<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@include file="Menu.jsp" %>
<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<script>
function enviar(par) {
if (par == 'cadastrar') {
        if (document.cadastro.nome.value == '') {
            document.cadastro.mensagem.value = 'Preencha o campo nome';
        }else if(document.cadastro.descricao.value==""){
            document.cadastro.mensagem.value="Preencha o campo descricao";
        }else if(  isNaN( document.cadastro.precoCusto.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo precoCusto';
        }else if(  isNaN( document.cadastro.precoVenda.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo precoVenda';
        }else if(document.cadastro.quantidadeEstoque.value==""){
            document.cadastro.mensagem.value="Preencha o campo quantidadeEstoque";
        }else if(document.cadastro.quantidadeMinima.value==""){
            document.cadastro.mensagem.value="Preencha o campo quantidadeMinima";
        }else if(document.cadastro.cardapio.value==""){
            document.cadastro.mensagem.value="Preencha o campo cardapio";
        }
else {
document.cadastro.opcao.value = 'cadastrar';
document.cadastro.action = 'CAEProduto.jsp';
document.cadastro.submit();
}
} else if (par == 'cancelar') {
document.cadastro.opcao.value = 'cadastro';
document.cadastro.nome.value = '';
document.cadastro.precoCusto.value = '';
document.cadastro.precoVenda.value = '';
document.cadastro.quantidadeEstoque.value = '';
document.cadastro.quantidadeMinima.value = '';
document.cadastro.cardapio.value = '';
document.cadastro.action = 'CadastroProduto.jsp';
document.cadastro.submit();
} else if (par == 'alterar') {
if (document.cadastro.nome.value == '') {
document.cadastro.mensagem.value = 'Preencha o campo nome';
}else if(document.cadastro.descricao.value==''){
            document.cadastro.mensagem.value="Preencha o campo descricao";
        }else if(  isNaN( document.cadastro.precoCusto.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo precoCusto';
        }else if(  isNaN( document.cadastro.precoVenda.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo precoVenda';
        }else if(document.cadastro.quantidadeEstoque.value==''){
            document.cadastro.mensagem.value="Preencha o campo quantidadeEstoque";
        }else if(document.cadastro.quantidadeMinima.value==''){
            document.cadastro.mensagem.value="Preencha o campo quantidadeMinima";
        }else if(document.cadastro.cardapio.value==''){
            document.cadastro.mensagem.value="Preencha o campo cardapio";
        }
else {
document.cadastro.opcao.value = 'alterar';
document.cadastro.action = 'CAEProduto.jsp';
document.cadastro.submit();
} 
}else if (par == 'excluir') {
document.cadastro.opcao.value = 'excluir';
document.cadastro.action = 'CAEProduto.jsp';
document.cadastro.submit();
}
}

</script>

<%
DAOUnidade daoUnidade = new DAOUnidade();
DAOMarca daoMarca = new DAOMarca();
List<Unidade> listaUnidade = daoUnidade.consultar();
List<Marca> listaMarca = daoMarca.consultar();
List<String> lista = new ArrayList();
lista.add("Sim");
lista.add("Não");
String mensagem = request.getParameter("mensagem");
String codProduto = request.getParameter("codProduto");
String nome = request.getParameter("nome");
String descricao = request.getParameter("descricao");
String precoCusto = request.getParameter("precoCusto");
String precoVenda = request.getParameter("precoVenda");
String quantidadeEstoque = request.getParameter("quantidadeEstoque");
String quantidadeMinima = request.getParameter("quantidadeMinima");
String cardapio = request.getParameter("cardapio");
String codUnidade = request.getParameter("codUnidade");
String codMarca = request.getParameter("codMarca");
if(codProduto==null)codProduto="0";
if(codUnidade==null)codUnidade="0";
if(codMarca==null)codMarca="0";
String opcao = request.getParameter("opcao");
if(opcao==null)opcao="cadastro";
if(cardapio==null)cardapio="Sim";
System.out.println("Cardapio: "+cardapio);
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Produto</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <form name="cadastro">
            <h1>Cadastro de Produto</h1>
            <p> <label>Nome: </label> <input type="text" name="nome" value="<%=nome==null ? "" : nome%>" size="30" /></p>
            <p> <label>Descricao: </label> <input type="text" name="descricao" value="<%=descricao==null ? "" : descricao%>" size="30" /></p>
            <p> <label>PrecoCusto: </label> <input type="text" name="precoCusto" value="<%=precoCusto==null ? "" : precoCusto%>" size="30" /></p>
            <p> <label>PrecoVenda: </label> <input type="text" name="precoVenda" value="<%=precoVenda==null ? "" : precoVenda%>" size="30" /></p>
            <p> <label>QuantidadeEstoque: </label> <input type="text" name="quantidadeEstoque" value="<%=quantidadeEstoque==null ? "" : quantidadeEstoque%>" size="30" /></p>
            <p> <label>QuantidadeMinima: </label> <input type="text" name="quantidadeMinima" value="<%=quantidadeMinima==null ? "" : quantidadeMinima%>" size="30" /></p>
            
            <p> <label>Cardapio: </label> 
                <select name="cardapio">
                    <% for (String listaC: lista) {%>
                    <%if(cardapio.equals(listaC)){%>
                    <option selected value="<%=listaC%>"><%=listaC%></option>
                    <%}else{%>
                    <option value="<%=listaC%>"><%=listaC%></option>
                    <%}%>
                    <%}%>
            </select>
                </p>
               
            <p><label>Unidade:</label>
                <select name="unidade">
                    <% for (Unidade unidade: listaUnidade) {%>
                    <%if(codUnidade.equals(String.valueOf(unidade.getCodUnidade()))){%>
                    <option selected value="<%=unidade.getCodUnidade()%>"><%=unidade.getNome()%></option>
                    <%}else{%>
                    <option value="<%=unidade.getCodUnidade()%>"><%=unidade.getNome()%></option>
                    <%}%>
                    <%}%>
            </select>
            </p>
            <p><label>Marca:</label>
                <select name="marca">
                    <% for (Marca marca: listaMarca) {%>
                    <%if(codMarca.equals(String.valueOf(marca.getCodMarca()))){%>
                    <option selected value="<%=marca.getCodMarca()%>"><%=marca.getNome()%></option>
                    <%}else{%>
                    <option value="<%=marca.getCodMarca()%>"><%=marca.getNome()%></option>
                    <%}%>
                    <%}%>
            </select>
            </p>
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
                <input type="hidden" name="codProduto" value="<%=codProduto%>" />
        </form>
         </div>
        </div>
             <%@include file="ListarProduto.jsp"%>
             <%@include file="footer.jsp" %>
    </body>
</html>