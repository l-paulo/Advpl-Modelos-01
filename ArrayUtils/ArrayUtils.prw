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
    @author tgmspawn@gmail.com
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



//============================================================================\
/*/{Protheus.doc}aFind
  ==============================================================================
    @description
    Retorna um elemento do array encontrado com aScan

    @author Thiago Mota
    @author tgmspawn@gmail.com
    @author mota.thiago@totvs.com.br
    @author https://github.com/tgmti/

    @version 1.0
    @since 29/01/2019

    @param aOrigin, Array, Array Original a ser avaliado
    @param bCallback, Bloco de C�digo, Fun��o que ao ser executada por aScan retorna a posi��o do elemento no array
	@para  [uDefault], Num�rico, Opcional. Define um valor padr�o, caso n�o encontrar o elemento
	@para  [nIni], Num�rico, Opcional. Define em que posi��o do Array inicia a busca (padr�o: 1)
	@para  [nEnd], Num�rico, Opcional. Define quantos elementos ir� avaliar a partir de nIni (padr�o: todos)

    @return Indefinido, Elemento ou valor default se infordo.

    @obs
        O Callback Recebe apenas o pr�prio elemento como par�metro, semelhante ao aScan

	@example
		// Pode ser utilizado para facilitar a leitura de trechos assim:
		aItens:= {"XPTO"}

		xItem:= aItens[aScan(aItens, {|x| x[1] == "XPTO" })][1] // XPTO

		xItem:= aFind(aItens, {|x| x[1] == "XPTO" })[1] // XPTO

		E usando o Default, evitar erros
		xItem:= aFind(aItens, {|x| x[1] == "XPTY" }, {"ARRAY PADRAO"})[1] // ARRAY PADRAO


/*/
//============================================================================\
User Function aFind( aOrigin, bCallback, uDefault, nIni, nEnd )
Return aFind(aOrigin, bCallback, uDefault, nIni, nEnd)

Static Function aFind(aOrigin, bCallback, uDefault, nIni, nEnd)
    Local nPos:= aScan( aOrigin, bCallback, nIni, nEnd )
	Local uRet:= uDefault
	If nPos > 0
		uRet:= aOrigin[nPos]
	EndIf

Return ( uRet )
// FIM da Funcao aFind
//==============================================================================



//============================================================================\
/*/{Protheus.doc}aJoin
  ==============================================================================
    @description
    Implementa��o da Fun��o Join para array de ADVPL
    O m�todo join() junta todos os elementos de uma array em uma string.

    Array.prototype.join() do Javascript
    https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/Array/join

    @author Thiago Mota
    @author tgmspawn@gmail.com
    @author mota.thiago@totvs.com.br
    @author https://github.com/tgmti/

    @version 1.0
    @since 29/01/2019

    @param aOrigin, Array, Array Original a ser avaliado
    @param [cSep], Caractere, Opcional. Caractere separador (padr�o: "")
	@para [lRecursive], L�gico, Opcional. Indica se deve agir recursivamente em arrays filhos (padr�o .T.)

    @return String, String com todos os elementos do Array

/*/
//============================================================================\
User Function aJoin( aOrigin, cSep, lRecursive )
Return aJoin(aOrigin, cSep, lRecursive)

Static Function aJoin( aOrigin, cSep, lRecursive )
    Local cRet:= ''
	Local nLenght:= Len(aOrigin)

	Default cSep:= ''
	Default lRecursive:= .T.

    aEval(aOrigin, {|uValue, nIndex| cRet += ;
		If( lRecursive .And. ValType(uValue) == "A", ;
			aJoin(uValue, cSep, lRecursive), ;
			AsString(uValue) ) + ;
		IIf(nIndex >= nLenght, '', cSep) ;
	})

Return ( cRet )
// FIM da Funcao aJoin
//==============================================================================



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
    @author tgmspawn@gmail.com
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
        4 - aDestiny, Array   , O novo array que ser� retornado.

/*/
//============================================================================\
User Function aMap( aOrigin, bCallback )
Return aMap(aOrigin, bCallback)

Static Function aMap( aOrigin, bCallback )
    Local aDestiny:= {}

    aEval(aOrigin, {|uValue,nIndex| aAdd(aDestiny, Eval(bCallback, uValue, nIndex, aOrigin, aDestiny)) })

Return ( aDestiny )
// FIM da Funcao aMap
//==============================================================================



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
    @author tgmspawn@gmail.com
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



//============================================================================\
/*/{Protheus.doc}aProduct
  ==============================================================================
    @description
    Implementa��o da funcionalidade Product para Vetores em ADVPL

    A fun��o Product() retorna o produto cartesiano dos dados inputados
    O Produto cartesiano ser� um vetor do tamanho indicado, com todas as
    possibilidades de itera��es entre os elementos do array de entrada.

    Inspirado no itertools.product(*iterables, repeat=1) do Python
    https://docs.python.org/pt-br/3/library/itertools.html#itertools.product

    Baseado nesta implementa��o para Javascript:
    https://gist.github.com/cybercase/db7dde901d7070c98c48

    @author Thiago Mota
    @author tgmspawn@gmail.com
    @author https://github.com/tgmti/

    @version 1.0
    @since 12/03/2020

    @param aIterables, Array, Array com os valores que devem constar no plano cartesiano
    @param nRepeat, Num�rico, Quantidade de repeti��es, ou seja, tamanho dos arrays retornados

    @return Vetor, Cada linha ser� uma possibilidade de itera��o entre os elementos do aIterables

    @obs
        Depende da Fun��o aReduce

        O tamanho do Array para o plano cartesiano ser� igual a Len(aIterables) Elevado a nRepeat
        Ou seja, Product({0,1},3) Retornar� 2^3 = 8 linhas com 3 posi��es cada:
            {00,00,00}
            {00,00,01}
            {00,01,00}
            {00,01,01}
            {01,00,00}
            {01,00,01}
            {01,01,00}
            {01,01,01}

        J�, Product({'A','B'},10) retorna 1024 linhas, com todas as possibilidades de 'A' e 'B'
        em 10 posi��es.
        Por conta disso, deve-se ter cuidado com as quantidades de itera��es e repeti��es

        //TODO: Realizar testes de limites do ADVPL para documentar quais os m�ximos suportados nesta abordagem

/*/
//============================================================================\
User Function aProduct( aIterables, nRepeat )
Return aProduct( aIterables, nRepeat )

Static Function aProduct( aIterables, nRepeat )

    Local aRet
    Local aCopies:= {}
    Local nX

    Default nRepeat:= 1

    For nX:= 1 To nRepeat
        aAdd(aCopies, AClone(aIterables))
    Next nX

    aRet:= aReduce(aCopies, {|nAcc, uVal| FlatVet(nAcc, uVal) }, {{}})

Return aRet

// Fun��o auxiliar para aProduct
Static Function FlatVet(nAcc, uVal)
    Local aTmp:= {}
    Local aConcat
    Local nY
    Local nZ

    For nY:= 1 To Len(nAcc)
        For nZ:= 1 To Len(uVal)
            aAdd(aTmp, aClone(nAcc[nY]))
            aAdd(aTail(aTmp), uVal[nZ])
        Next nZ
    Next nY

Return aTmp
// FIM da Funcao aProduct
//==============================================================================


