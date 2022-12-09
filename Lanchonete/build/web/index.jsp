<%@include file="Menu.jsp" %>

<%-- 
    Document   : index
    Created on : 21/06/2020, 09:32:38
    Author     : joyce
--%>
<script>
            function enviar(par){
                if (par == 'login'){
                    if (document.cadastro.email.value == ''){
                      alert("Preencha o campo email");
                    }else if (document.cadastro.senha.value == ''){
                        alert("Preencha o campo senha");
                    }else {
                        document.cadastro.action='LoginUsuario.jsp';
                        document.cadastro.submit();
                    }
                } 
            }
        </script>
        <% String mensagem = request.getParameter("mensagem"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css"  href="conf/estilo.css" />
        <title>Lanchonete InfoF</title>
    </head>
    
    
    
    <body>
        <div class="welcome">
            
            
        <h1>Bem vindo ao nosso site oficial!</h1>
        <h1 class="h1">Obrigada pela confiança</h1>
        <p><b>Faça o login para continuar!</b></p>
       
        
        
        <div class="form">
         <form action=""  name="cadastro" method="get">
            <p>Email: <input type="text" name="email" value="" size="20" /> </p>
            <p>Senha: <input type="password" name="senha" value="" size="20" /> </p>    
            <p><input  type="submit" name="login"  onClick="enviar('login')" 
                       value="OK"></p>
            </form>
        </div>
       
        
        <div class="logoff">
        <p><b><% if (mensagem != null){ %><%= mensagem %><% } %></b></p>
        </div>
        
        
        </div>
            <%@include file="footer.jsp" %>
    </body>
</html>
