<%@page contentType="text/html" pageEncoding="Latin1"%>
<!DOCTYPE HTML>
<html lang="pt-br">
    <head>
        <meta charset="Latin1">
        <title>Lanchonete InfoF</title>
		
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
        
        <script src="conf/validaDados.js"></script>
        
    </head>
    <body>    
        <nav>
            <div class="header">
            <img src="imagens/logo.png" width="200" height="100" alt="logo" class="img"/>
            <ul class="menu">
                <li>
                    <% if (session.getAttribute("nome") != null) {%>
                    <a href="logoff.jsp">Logoff</a>
                    <% }%>
                </li>
                <li><a href="Sobre.jsp">Sobre</a></li>  
                <li><a href="Contato.jsp">Contato</a></li>      
                <li><a href="#">Relatórios</a> 
                    <ul>
                        <li><a target="blank"  href="RelatorioCliente.jsp">Cliente</a></li>
                        <li><a target="blank"  href="RelatorioEntrega.jsp">Entrega</a></li>
                        <li><a target="blank"  href="RelatorioFuncao.jsp">Função</a></li>
                        <li><a target="blank"  href="RelatorioFuncionario.jsp">Funcionário</a></li>
                        <li><a target="blank"  href="RelatorioMarca.jsp">Marca</a></li>
                        <li><a target="blank"  href="RelatorioProduto.jsp">Produto</a></li>
                        <li><a target="blank"  href="RelatorioUnidade.jsp">Unidade</a></li>
                        <li><a target="blank"  href="RelatorioVendas2.jsp">Venda</a></li>
                    </ul>
                </li>
                <li><a href="#">Cadastro</a>
                    <ul>
                        <li><a href="CadastroCliente.jsp">Cliente</a></li>
                        <li><a href="CadastroEntrega.jsp">Entrega</a></li>
                        <li><a href="CadastroFuncao.jsp">Função</a></li>
                        <li><a href="CadastroFuncionario.jsp">Funcionario</a></li>
                        <li><a href="CadastroMarca.jsp">Marca</a></li>
                        <li><a href="CadastroProduto.jsp">Produto</a></li>
                        <li><a href="CadastroUnidade.jsp">Unidade</a></li>
                        <li><a href="CadastroVenda.jsp">Venda</a></li>
                    </ul>
                </li>
                <li><a href="index.jsp">Home</a></li>
                </ul>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                <br>
                
            </div>
        </nav>
                
                
    </body>
</html>