#INCLUDE 'PROTHEUS.CH'


//============================================================================\
/*/{Protheus.doc}aFilter
  ==============================================================================
    @description
    Implementa��o da Fun��o Filter para ADVPL
    O m�todo filter() cria um novo array com todos os elementos que passaram 
    no teste implementado pela fun��o fornecida.

    Inspirado no ArrayUtils.filter do Javascript moderno
    https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/filtro

    @author Thiago Mota
    @author mota.thiago@totvs.com.br
    @author https://github.com/tgmti/

    @version 1.0
    @since 23/01/2019

    @param aOrigin, Array, Array Original a ser avaliado
    @param bCallback, Bloco de C�digo, Fun��o que ao ser executada por Eval() testa se o elemento
        dever� compor o novo Array.
    
    @return Array, Novo Array com os elementos que passaram no teste.

    @obs
        O Callback Recebe tr�s argumentos:
        1 - uValue, Qualquer, O elemento que est� sendo processado no array.
        2 - nIndex, N�mero, O �ndice do elemento atual que est� sendo processado no array.
        3 - aOrigin, Array, O array para qual filter foi chamada.


/*/
//============================================================================\
User Function aFilter( aOrigin, bCallback )
Return aFilter(aOrigin, bCallback)

Static Function aFilter( aOrigin, bCallback )
    Local aDestiny:= {}

    aEval(aOrigin, {|uValue, nIndex| If(Eval(bCallback, uValue, nIndex, aOrigin),aAdd(aDestiny, uValue),Nil) })

Return ( aDestiny )
// FIM da Funcao aFilter
//==============================================================================


