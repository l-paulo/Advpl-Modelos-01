#INCLUDE 'PROTHEUS.CH'


//============================================================================\
/*/{Protheus.doc}aFind
  ==============================================================================
    @description
    Retorna um elemento do array encontrado com aScan

    @author Thiago Mota
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
