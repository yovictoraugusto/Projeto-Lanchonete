<%--
    Document   : RelatorioProdutorOld
    Created on : 16/01/2012, 12:46:27
    Author     : Tulio
--%>



<%@page import="java.net.URL"%>
<%@page import="modelo.Relatorio"%>

<%@page import="java.io.InputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.o
   
   <%@page import="java.sql.*,java.util.HashMap,java.util.Map,net.sf.jasperreports.engine.*, net.sf.jasperreports.engine.util.*,net.sf.jasperreports.view.JasperViewer" %>




<%
    Relatorio rel = new Relatorio();
    

  ResultSet rs = rel.relatorioCliente();
                if (rs.next()) {
                    rs.beforeFirst();


String caminho = "C:/Users/victo/OneDrive/Documentos/ESTUDOS/III/JAVA/TRABALHO/Completo/Lanchonete/Lanchonete/web/relatorio/relatorioCliente.jasper";


Map parameters = new HashMap();
//parameters.put( "teste", "Texto enviado 4" );
JRResultSetDataSource jrRS = new JRResultSetDataSource(rs);

JasperPrint impressao = JasperFillManager.fillReport(caminho, parameters,jrRS);

//gravar relatorio com problema não atualiza
//JasperExportManager.exportReportToPdfFile(impressao,caminho + "RelTeste.pdf");
//response.sendRedirect("relatorios/RelTeste.pdf"); //mostra o resultado na tela

//sem gravar o relatório
byte[] bytes = JasperExportManager.exportReportToPdf(impressao);
response.setContentType("application/pdf");
response.setContentLength(bytes.length);
ServletOutputStream ouputStream = response.getOutputStream();
ouputStream.write(bytes, 0, bytes.length);
ouputStream.flush();
ouputStream.close();

}
  else{
    %>

<jsp:forward page="Mensagem.jsp">
    <jsp:param name="mensagem" value="Não há cliente cadastrado, para cadastrar um cliente clique no menu CADASTRO > Cliente." />
</jsp:forward>


<%
    }
  
%>


