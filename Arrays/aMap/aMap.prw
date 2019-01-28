#INCLUDE 'PROTHEUS.CH'


//============================================================================\
/*/{Protheus.doc}aMap
  ==============================================================================
    @description
    Implementa��o da Fun��o Map para ADVPL
    O m�todo map() invoca a fun��o callback passada por argumento para cada 
    elemento do Array e devolve um novo Array como resultado.

    Inspirado no ArrayUtils.map do Javascript moderno
    https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/map

    @author Thiago Mota
    @author mota.thiago@totvs.com.br
    @author https://github.com/tgmti/

    @version 1.0
    @since 24/01/2019

    @param aOrigin, Array, Array Original a ser avaliado
    @param bCallback, Bloco de C�digo, Fun��o que ao ser executada por Eval() produz o elemento do novo Array.
    
    @return Array, Novo Array com as modifica��es

    @obs
        O Callback Recebe tr�s argumentos:
        1 - uValue, Qualquer, O elemento que est� sendo processado no array.
        2 - nIndex, N�mero, O �ndice do elemento atual que est� sendo processado no array.
        3 - aOrigin, Array, O array para qual map foi chamada.

/*/
//============================================================================\
User Function aMap( aOrigin, bCallback )
Return aMap(aOrigin, bCallback)

Static Function aMap( aOrigin, bCallback )
    Local aDestino:= {}

    aEval(aOrigin, {|uValue,nIndex| aAdd(aDestino, Eval(bCallback, uValue, nIndex, aOrigin)) })

Return ( aDestino )
// FIM da Funcao aMap
//==============================================================================


