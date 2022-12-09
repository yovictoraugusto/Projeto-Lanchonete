package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.*;
import java.util.List;
import modelo.*;
import java.util.List;

public final class CadastroEntrega_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/Menu.jsp");
    _jspx_dependants.add("/ListarEntrega.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=Latin1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"Latin1\">\n");
      out.write("        <title>Lanchonete InfoF</title>\n");
      out.write("\t\t\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"conf/estilo.css\" />\n");
      out.write("        \n");
      out.write("        <script src=\"conf/validaDados.js\"></script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>    \n");
      out.write("        <nav>\n");
      out.write("            <div class=\"header\">\n");
      out.write("            <img src=\"imagens/logo.png\" width=\"200\" height=\"100\" alt=\"logo\" class=\"img\"/>\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                <li>\n");
      out.write("                    ");
 if (session.getAttribute("nome") != null) {
      out.write("\n");
      out.write("                    <a href=\"logoff.jsp\">Logoff</a>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"Sobre.jsp\">Sobre</a></li>  \n");
      out.write("                <li><a href=\"Contato.jsp\">Contato</a></li>      \n");
      out.write("                <li><a href=\"#\">Relatórios</a> \n");
      out.write("                    <ul>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioCliente.jsp\">Cliente</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioEntrega.jsp\">Entrega</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioFuncao.jsp\">Função</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioFuncionario.jsp\">Funcionário</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioMarca.jsp\">Marca</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioProduto.jsp\">Produto</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioUnidade.jsp\">Unidade</a></li>\n");
      out.write("                        <li><a target=\"blank\"  href=\"RelatorioVendas2.jsp\">Venda</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"#\">Cadastro</a>\n");
      out.write("                    <ul>\n");
      out.write("                        <li><a href=\"CadastroCliente.jsp\">Cliente</a></li>\n");
      out.write("                        <li><a href=\"CadastroEntrega.jsp\">Entrega</a></li>\n");
      out.write("                        <li><a href=\"CadastroFuncao.jsp\">Função</a></li>\n");
      out.write("                        <li><a href=\"CadastroFuncionario.jsp\">Funcionario</a></li>\n");
      out.write("                        <li><a href=\"CadastroMarca.jsp\">Marca</a></li>\n");
      out.write("                        <li><a href=\"CadastroProduto.jsp\">Produto</a></li>\n");
      out.write("                        <li><a href=\"CadastroUnidade.jsp\">Unidade</a></li>\n");
      out.write("                        <li><a href=\"CadastroVenda.jsp\">Venda</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("function enviar(par) {\n");
      out.write("if (par == 'cadastrar') {\n");
      out.write("       if (  isNaN( document.cadastro.valor.value)) {\n");
      out.write("            alert(\"Digite apenas números!\"); \n");
      out.write("            document.cadastro.mensagem.value = 'Preencha o campo valor';\n");
      out.write("        }\n");
      out.write("else {\n");
      out.write("document.cadastro.opcao.value = 'cadastrar';\n");
      out.write("document.cadastro.action = 'CAEEntrega.jsp';\n");
      out.write("document.cadastro.submit();\n");
      out.write("}\n");
      out.write("} else if (par == 'cancelar') {\n");
      out.write("document.cadastro.opcao.value = 'cadastro';\n");
      out.write("document.cadastro.valor.value = '';\n");
      out.write("document.cadastro.action = 'CadastroEntrega.jsp';\n");
      out.write("document.cadastro.submit();\n");
      out.write("} else if (par == 'alterar') {\n");
      out.write("if (  isNaN( document.cadastro.valor.value)) {\n");
      out.write("            alert(\"Digite apenas números!\"); \n");
      out.write("            document.cadastro.mensagem.value = 'Preencha o campo valor';\n");
      out.write("        }\n");
      out.write("else {\n");
      out.write("document.cadastro.opcao.value = 'alterar';\n");
      out.write("document.cadastro.action = 'CAEEntrega.jsp';\n");
      out.write("document.cadastro.submit();\n");
      out.write("} \n");
      out.write("}else if (par == 'excluir') {\n");
      out.write("document.cadastro.opcao.value = 'excluir';\n");
      out.write("document.cadastro.action = 'CAEEntrega.jsp';\n");
      out.write("document.cadastro.submit();\n");
      out.write("}\n");
      out.write("}\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");

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
if(valor==null)valor="0";

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=Latin1\">\n");
      out.write("        <title>Cadastro de Entrega</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"conf/estilo.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"corpo\">\n");
      out.write("        <div class=\"cadastro\">\n");
      out.write("        <form name=\"cadastro\">\n");
      out.write("            <h1>Cadastro de Entrega</h1>\n");
      out.write("            <p> <label>Valor: </label> <input type=\"text\" name=\"valor\" value=\"");
      out.print(valor==null ? "" : valor);
      out.write("\" size=\"30\" /></p>\n");
      out.write("            \n");
      out.write("             <p><label>Venda:</label>\n");
      out.write("                <select name=\"venda\">\n");
      out.write("                    ");
 for (Venda venda: listaVenda) {
      out.write("\n");
      out.write("                    ");
if(codVenda.equals(String.valueOf(venda.getCodVenda()))){
      out.write("\n");
      out.write("                    <option selected value=\"");
      out.print(venda.getCodVenda());
      out.write('"');
      out.write('>');
      out.print(venda.getCodVenda() );
      out.write('-');
      out.print(venda.getCliente().getNome() );
      out.write("</option>\n");
      out.write("                    ");
}else{
      out.write("\n");
      out.write("                    <option value=\"");
      out.print(venda.getCodVenda());
      out.write('"');
      out.write('>');
      out.print(venda.getCodVenda());
      out.write('-');
      out.print(venda.getCliente().getNome() );
      out.write("</option>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("            </select>\n");
      out.write("            </p>           \n");
      out.write("            <p></p>\n");
      out.write("\n");
      out.write("            ");
if(opcao.equals("cadastro")){
      out.write("\n");
      out.write("                <input type=\"button\" onclick=\"enviar('cadastrar')\" value=\"Cadastrar\" name=\"Cadastrar\" />\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            ");
if(opcao.equals("alterar")){
      out.write("\n");
      out.write("               <input type=\"button\" onclick=\"enviar('alterar')\"  value=\"Alterar\" name=\"Cadastrar\" />\n");
      out.write("               <input type=\"button\" onclick=\"enviar('cancelar'')\" value=\"Cancelar\" name=\"Cadastrar\" />\n");
      out.write("            ");
}
      out.write("\n");
      out.write("              \n");
      out.write("            ");
if(opcao.equals("excluir")){
      out.write("\n");
      out.write("                 <input type=\"button\" onclick=\"enviar('excluir')\" value=\"Excluir\" name=\"Cadastrar\" /> \n");
      out.write("                <input type=\"button\" onclick=\"enviar('cancelar')\" value=\"Cancelar\" name=\"Cadastrar\" />\n");
      out.write("            ");
}
      out.write("\n");
      out.write("            <div class=\"caixa\">\n");
      out.write("            <p> <textarea name=\"mensagem\" rows=\"3\" cols=\"50\" readonly=\"readonly\">\n");
      out.write("                    ");
      out.print(mensagem==null?"":mensagem);
      out.write("\n");
      out.write("                </textarea></p>\n");
      out.write("            </div>\n");
      out.write("                <input type=\"hidden\" name=\"opcao\" value=\"\" />\n");
      out.write("                <input type=\"hidden\" name=\"codEntrega\" value=\"");
      out.print(codEntrega);
      out.write("\" />\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("        </div>\n");
      out.write("             ");
      out.write("\n");
      out.write("\n");
      out.write("\n");

DAOEntrega daoEntrega = new DAOEntrega();
List<Entrega> listaEntrega = daoEntrega.consultar();

      out.write("\n");
      out.write("\n");
      out.write("<table border=\"1\" class=\"listaCorpo\">\n");
      out.write("    <thead>\n");
      out.write("        <tr>\n");
      out.write("            <th>CÓDIGO ENTREGA</th>\n");
      out.write("            <th>VALOR</th>\n");
      out.write("            <th>VENDA</th>\n");
      out.write("            <th>CLIENTE</th>\n");
      out.write("            <th>ALTERAR</th>\n");
      out.write("            <th>EXCLUIR</th>\n");
      out.write("        </tr>\n");
      out.write("    </thead>\n");
      out.write("    <tbody>\n");
      out.write("        ");
for(Entrega entrega:listaEntrega){
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(entrega.getCodEntrega());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(entrega.getValor());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(entrega.getVenda().getCodVenda());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(entrega.getCliente().getNome());
      out.write("</td>\n");
      out.write("            <td><a href=\"CadastroEntrega.jsp?opcao=alterar&codEntrega=");
      out.print(entrega.getCodEntrega());
      out.write("&valor=");
      out.print(entrega.getValor());
      out.write("&codigoVenda=");
      out.print(entrega.getVenda().getCodVenda());
      out.write("&codigoCliente=");
      out.print(entrega.getCliente().getCodCliente());
      out.write("&mensagem=Altere os dados e clique no botão alterar\">Alterar</a></td>\n");
      out.write("            <td><a href=\"CadastroEntrega.jsp?opcao=excluir&codEntrega=");
      out.print(entrega.getCodEntrega());
      out.write("&valor=");
      out.print(entrega.getValor());
      out.write("&codigoVenda=");
      out.print(entrega.getVenda().getCodVenda());
      out.write("&codigoCliente=");
      out.print(entrega.getCliente().getCodCliente());
      out.write("&mensagem=Exclua os dados no botão excluir\">Excluir</a></td>\n");
      out.write("\n");
      out.write("        </tr>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("    </tbody>\n");
      out.write("</table>");
      out.write("\n");
      out.write("             ");
      out.write("\n");
      out.write("<!DOCTYPE HTML>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"Latin1\">\n");
      out.write("        <title>Lanchonete InfoF</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\"  href=\"conf/estilo.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>    \n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <nav>\n");
      out.write("            <div class=\"footer\">\n");
      out.write("                <img src=\"imagens/logo.png\" width=\"150\" height=\"75\" alt=\"logo\" class=\"img2\"/>\n");
      out.write("                <b>&copy; 2020 - Lanchonete</b>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("    </body>\n");
      out.write("    <br>\n");
      out.write("</html>");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
