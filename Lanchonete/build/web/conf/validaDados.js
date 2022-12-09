function TestaCPF(strCPF) {
    var Soma;
    var Resto;
    Soma = 0;
  if (strCPF == "00000000000") return false;

  for (i=1; i<=9; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (11 - i);
  Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10)) ) return false;

  Soma = 0;
    for (i = 1; i <= 10; i++) Soma = Soma + parseInt(strCPF.substring(i-1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))  Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11) ) ) return false;
    return true;
}

function Moeda(a, e, r, t) {
    let n = ""
      , h = j = 0
      , u = tamanho2 = 0
      , l = ajd2 = ""
      , o = window.Event ? t.which : t.keyCode;
    if (13 == o || 8 == o)
        return !0;
    if (n = String.fromCharCode(o),
    -1 == "0123456789".indexOf(n))
        return !1;
    for (u = a.value.length,
    h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++)
        ;
    for (l = ""; h < u; h++)
        -1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
    if (l += n,
    0 == (u = l.length) && (a.value = ""),
    1 == u && (a.value = "0" + r + "0" + l),
    2 == u && (a.value = "0" + r + l),
    u > 2) {
        for (ajd2 = "",
        j = 0,
        h = u - 3; h >= 0; h--)
            3 == j && (ajd2 += e,
            j = 0),
            ajd2 += l.charAt(h),
            j++;
        for (a.value = "",
        tamanho2 = ajd2.length,
        h = tamanho2 - 1; h >= 0; h--)
            a.value += ajd2.charAt(h);
        a.value += r + l.substr(u - 2, u)
    }
    return !1
}

function ValidaData(data){
      reg = /[^\d\/\.]/gi;                  
      var valida = data.replace(reg,'');    
      if (valida && valida.length == 10) { 
        var ano = data.substr(6),
          mes = data.substr(3,2),
          dia = data.substr(0,2),
          M30 = ['04','06','09','11'],
          v_mes = /(0[1-9])|(1[0-2])/.test(mes),
          v_ano = /(19[1-9]\d)|(20\d\d)|2100/.test(ano),
          rexpr = new RegExp(mes),
          fev29 = ano % 4? 28: 29;

        if (v_mes && v_ano) {
          if (mes == '02') return (dia >= 1 && dia <= fev29);
          else if (rexpr.test(M30)) return /((0[1-9])|([1-2]\d)|30)/.test(dia);
          else return /((0[1-9])|([1-2]\d)|3[0-1])/.test(dia);
        }
      }
      return false
    }
    
    function  ValidaCep ( cep ) {
    function Trim(strTexto)
        {
            return strTexto.replace(/^s+|s+$/g, '');
        }
    function IsCEP(strCEP, blnVazio)
        {
            var objER = /^[0-9]{2}.[0-9]{3}-[0-9]{3}$/;
            strCEP = Trim(strCEP)
            if(strCEP.length > 0)
                {
                    if(objER.test(strCEP))
                        return true;
                    else
                        return false;
                }
            else
                return blnVazio;
        }         
}

    function ValidaRg(v){
    v=v.replace(/\D/g,"");
    if(v.length == 9) v=v.replace(/(\d{2})(\d{3})(\d{3})(\d{1})$/,"$1.$2.$3-$4");
    return v
}

    
