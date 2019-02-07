#INCLUDE 'PROTHEUS.CH'


//============================================================================\
/*/{Protheus.doc}aReduce
  ==============================================================================
    @description
    Implementa��o da Fun��o Reduce para ADVPL
    O m�todo reduce()executa uma fun��o reducer (provida por voc�) para cada 
	membro do array, resultando num �nico valor de retorno.

    Inspirado no ArrayUtils.reduce do Javascript moderno
    https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce

    @author Thiago Mota
    @author mota.thiago@totvs.com.br
    @author https://github.com/tgmti/

    @version 1.0
    @since 29/01/2019

    @param aOrigin, Array, Array Original a ser avaliado
    @param bCallback, Bloco de C�digo, Fun��o que ao ser executada por Eval() executa o acumulador. Valor Padr�o {|x,y| x+y }
	@para [uInitValue], Indefinido, Opcional. Valor inicial na primeira execu��o. Valor padr�o: 0
    
    @return Indefinido, Valor final do acumulador, o tipo retornado depende da fun��o callback

    @obs
        O Callback Recebe quatro argumentos:
        1 - uAcumulator, Qualquer, O elemento que ser� retornado.
        1 - uValue, Qualquer, O elemento que est� sendo processado no array.
        2 - nIndex, N�mero, O �ndice do elemento atual que est� sendo processado no array.
        3 - aOrigin, Array, O array para qual map foi chamada.

/*/
//============================================================================\
User Function aReduce( aOrigin, bCallback, uInitValue )
Return aReduce(aOrigin, bCallback, uInitValue)

Static Function aReduce( aOrigin, bCallback, uInitValue )
    Local uAcumulator
	Default bCallback:= {|nAcc, uVal| nAcc + uVal }
	Default uInitValue:= 0

	uAcumulator:= uInitValue

    aEval(aOrigin, {|uValue,nIndex| uAcumulator:= Eval(bCallback, uAcumulator, uValue, nIndex, aOrigin) })

Return ( uAcumulator )
// FIM da Funcao aReduce
//==============================================================================


