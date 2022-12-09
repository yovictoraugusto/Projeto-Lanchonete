<%@include file="Menu.jsp" %>
<%@page import="modelo.*"%>
<%@page import="java.util.List"%>

<script>
    function enviar(par){
        if(par=='cadastrar'){
        if(document.cadastro.nomeFuncionario.value==''){
            document.cadastro.mensagem.value="Preencha o campo Nome";
        }else if(TestaCPF(document.cadastro.cpf.value)==false){
            document.cadastro.mensage.value="Preencha o campo CPF";
        }else if(ValidaRg(document.cadastro.rg.value)=='v'){
            document.cadastro.mensage.value="Preencha o campo RG";
        }else if(ValidaData(document.cadastro.dataNascimento.value)=='v'){
            document.cadastro.mensage.value="Preencha o campo Data de Nascimento";
        }else if(ValidaData(document.cadastro.dataAdmissao.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Admissão";
        }else if(ValidaData(document.cadastro.dataPagamento.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Pagamento";
        }else if (  isNaN( document.cadastro.salario.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo salario';
        }else{
            document.cadastro.opcao.value='cadastrar';
            document.cadastro.action='CAEFuncionario.jsp';
            document.cadastro.submit();
        }
        }else if(par=="cancelar"){
        document.cadastro.opcao.value='cadastro';
        document.cadastro.nomeFuncionario.value='';
        document.cadastro.cpf.value='';
        document.cadastro.rg.value='';
        document.cadastro.carteiraTrabalho.value='';
        document.cadastro.endereco.value='';
        document.cadastro.bairro.value='';
        document.cadastro.cidade.value='';
        document.cadastro.cep.value='';
        document.cadastro.uf.value='';
        document.cadastro.telefone.value='';
        document.cadastro.celular.value='';
        document.cadastro.dataAdmissao.value='';
        document.cadastro.dataDemissao.value='';
        document.cadastro.dataNascimento.value='';
        document.cadastro.dataPagamento.value='';
        document.cadastro.salario.value='';
        document.cadastro.curriculo.value='';
        document.cadastro.action='CadastroFuncionario.jsp';
        document.cadastro.submit();
    }
    else if(par=='alterar'){
        if(document.cadastro.nomeFuncionario.value==""){
            document.cadastro.mensagem.value="Preencha o campo Nome";
        }else if(TestaCPF(document.cadastro.cpf.value)==false){
            document.cadastro.mensage.value="Preencha o campo CPF";
        }else if(ValidaRg(document.cadastro.rg.value)==false){
            document.cadastro.mensage.value="Preencha o campo RG";
        }else if(ValidaData(document.cadastro.dataNascimento.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Nascimento";
        }else if(ValidaData(document.cadastro.dataAdmissao.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Admissão";
        }else if(ValidaData(document.cadastro.dataPagamento.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Pagamento";
        }else if(ValidaData(document.cadastro.dataNascimento.value)==false){
            document.cadastro.mensage.value="Preencha o campo Data de Nascimento";
        }else if (  isNaN( document.cadastro.salario.value)) {
            alert("Digite apenas números!"); 
            document.cadastro.mensagem.value = 'Preencha o campo salario';
        }else{
            document.cadastro.opcao.value='alterar';
            document.cadastro.action='CAEFuncionario.jsp';
            document.cadastro.submit();
        }
    }
    else if(par=='excluir'){
        document.cadastro.opcao.value='excluir';
        document.cadastro.action='CAEFuncionario.jsp';
        document.cadastro.submit();
    }
}
</script>

<%
    DAOFuncao daoFuncao = new DAOFuncao();
    List<Funcao> listaFuncao = daoFuncao.consultar();
    String mensagem = request.getParameter("mensagem");
    String codFuncionario = request.getParameter("codFuncionario");
    String nomeFuncionario = request.getParameter("nomeFuncionario");
    String cpf = request.getParameter("cpf");
    String rg = request.getParameter("rg");
    String carteiraTrabalho = request.getParameter("carteiraTrabalho");
    String endereco = request.getParameter("endereco");
    String bairro = request.getParameter("bairro");
    String cidade = request.getParameter("cidade");
    String cep = request.getParameter("cep");
    String uf = request.getParameter("uf");
    String telefone = request.getParameter("telefone");
    String celular = request.getParameter("celular");
    String dataAdmissao = request.getParameter("dataAdmissao");
    String dataDemissao = request.getParameter("dataDemissao");
    String dataNascimento = request.getParameter("dataNascimento");
    String dataPagamento = request.getParameter("dataPagamento");
    String salario = request.getParameter("salario");
    String curriculo = request.getParameter("curriculo");
    String codFuncao = request.getParameter("codFuncao");
    String opcao = request.getParameter("opcao");
    if(opcao == null){
        opcao="cadastro";
    }if(codFuncionario == null){
        codFuncionario="0";
    }if(codFuncao == null){
        codFuncao="0";
    }
%>

<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=Latin1">
        <title>Cadastro de Funcionários</title>
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
    </head>
    <body>
        <div class="corpo">
        <div class="cadastro">
        <h1>Cadastro de Funcionários</h1>
        <form name="cadastro">
            <p><label>Nome:</label> <input type="text" name="nomeFuncionario" value="<%= (nomeFuncionario==null?"":nomeFuncionario) %>" size="50" /></p>
            <p><label>CPF:</label> <input type="number" name="cpf" value="<%= (cpf==null?"":cpf) %>" size="50" placeholder="Digite somente numeros" /></p>
            <p><label>RG:</label> <input type="number" name="rg" value="<%= (rg==null?"":rg) %>" size="50" placeholder="Digite somente numeros" /></p>
            <p><label>Carteira de trabalho:</label> <input type="number" name="carteiraTrabalho" value="<%= (carteiraTrabalho==null?"":carteiraTrabalho) %>" size="50" placeholder="Digite somente numeros" /></p>
            <p><label>Endereco:</label> <input type="text" name="endereco" value="<%= (endereco==null?"":endereco) %>" size="50" /></p>
            <p><label>Bairro:</label> <input type="text" name="bairro" value="<%= (bairro==null?"":bairro) %>" size="50" /></p>
            <p><label>Cidade:</label> <input type="text" name="cidade" value="<%= (cidade==null?"":cidade) %>" size="50" /></p>
            <p><label>CEP:</label> <input type="text" name="cep" value="<%= (cep==null?"":cep) %>" size="50" /></p>
            <p><label>UF:</label> <input type="text" name="uf" value="<%= (uf==null?"":uf) %>" size="50" /></p>
            <p><label>Telefone:</label> <input type="number" name="telefone" value="<%= (telefone==null?"":telefone) %>" size="50" /></p>
            <p><label>Celular:</label> <input type="number" name="celular" value="<%= (celular==null?"":celular) %>" size="50" /></p>
            <p><label>Data de Admissão:</label> <input type="text" name="dataAdmissao" value="<%= (dataAdmissao==null?"":dataAdmissao) %>" size="50" /></p>
            <%System.out.println("dataAdmissao: "+dataAdmissao);%>
            <p><label>Data de Demissão:</label> <input type="text" name="dataDemissao" value="<%= (dataDemissao==null?"":dataDemissao) %>" size="50" /></p>
            <%System.out.println("dataDemissao: "+dataDemissao);%>
            <p><label>Data de Nascimento:</label> <input type="text" name="dataNascimento" value="<%= (dataNascimento==null?"":dataNascimento) %>" size="50" /></p>
            <%System.out.println("dataNascimento: "+dataNascimento);%>
            <p><label>Data de Pagamento:</label> <input type="text" name="dataPagamento" value="<%= (dataPagamento==null?"":dataPagamento) %>" size="50" /></p>
            <%System.out.println("dataPagamento: "+dataPagamento);%>
            <p><label>Salário:</label> <input type="text" name="salario" value="<%= (salario==null?"":salario) %>" size="50" /></p>
            <p><label>Currículo:</label> <input type="text" name="curriculo" value="<%= (curriculo==null?"":curriculo) %>" size="50" /></p>
            <p><label>Função:</label>
                <select name="funcao">
                    <% for (Funcao funcao: listaFuncao) {%>
                    <%if(codFuncao.equals(String.valueOf(funcao.getCodFuncao()))){%>
                    <option selected value="<%=funcao.getCodFuncao()%>"><%=funcao.getNome()%></option>
                    <%}else{%>
                    <option value="<%=funcao.getCodFuncao()%>"><%=funcao.getNome()%></option>
                    <%}%>
                    <%}%>
            </select>
            </p>
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
                <p><textarea name="mensagem" rows="2" cols="100" readonly="readonly" disabled="disabled">
                    <%= (mensagem==null?"":mensagem) %>
                </textarea></p>
                </div>
            <input type="hidden" name="opcao"/>
            <input type="hidden" name="codFuncionario" value="<%=codFuncionario%>"/>
        </form>
         </div>
        </div>
        <%@include file="ListarFuncionario.jsp"%>
        <%@include file="footer.jsp" %>
    </body>
</html>
