 //OnKeyUp="barra(this)"
 // chamar o java script <script type="text/javascript" src="conf/javascript.js"></script>
 function barra(objeto){
                if (objeto.value.length == 2 || objeto.value.length == 5 ){
                    objeto.value = objeto.value+"/";
                }
 }

//colocar qualquer tipo de mascara
// OnKeyPress="formatar(this, '##/##/####')"
 function formatar(src, mask){
  var i = src.value.length;
  var saida = mask.substring(0,1);
  var texto = mask.substring(i)
if (texto.substring(0,1) != saida)
  {
    src.value += texto.substring(0,1);
  }
}

 function zero(opcao){
     
                if (opcao == 'tutorado' ){
                   document.cadastro.adubacaopt1.value = "0";
                   document.cadastro.adubacaopt2.value = "0";
                }
                else if (opcao == 'rasteiro' ){
                   document.cadastro.adubacaop1.value = "0";
                   document.cadastro.adubacaop2.value = "0";
                }
 }