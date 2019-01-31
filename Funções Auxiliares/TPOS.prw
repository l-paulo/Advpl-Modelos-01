#Include 'Protheus.ch'


//====================================================================================================================\\
/*/{Protheus.doc}TPOS
  ====================================================================================================================
	@description
	Fun��o auxiliar para posicione

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		23 de set de 2016

	@param		cChave	, Caracatere, Chave de pesquisa
	@param		cCpoRet, Caracatere, Campo a retornar
	@param		xIndice, Indefinido, �ndice (se num�rico) ou Nickname (se caractere ) - Padr�o: �ndice 1
	@param		lAddFil, L�gico     , Indica se deve adicionar xFilial � cChave - Padr�o: .T.
	@param		cTabela, Caracatere, Alias da tabela (se n�o for informado, ser� buscado o Alias do cCpoRet no SX3)

	@obs
	Fun��o criada para poder chamar a fun��o posicione passando menos dados.
	O obetivo � ter a funcionalidade do posicione com consumo de menos caracteres em campos de valida��o, inicializadores
	e outros campos do configurador.

	Pode ser informada a tabela, ou deixar em branco se desejar.
	Pode-se utilizar n�mero do �ndice ou NickName, usando o mesmo par�metro.
	Pode-se informar a express�o de busca sem o xFilial.

	@example	U_TPOS(SC5->(A1_CLIENTE+C5_LOJACLI), "A1_NOME")
				Retorna o mesmo que:
				POSICIONE("SA1", 1, xFilial("SA1")+SC5->A1_CLIENTE+SC5->C5_LOJACLI, "A1_NOME")

	@example	U_TPOS(SC5->C5_ZCGCDES, "A1_NOME", 3)
				// Retorna o mesmo que:
				POSICIONE("SA1", 3, xFilial("SA1")+SC5->C5_ZCGCDES, "A1_NOME")

	@example	// Utilizando o Nickname do  �ndice
				U_TPOS(SC5->(A1_CLIENTE+C5_LOJACLI), "A1_NOME", ,"NICK_A1NOME")
				// Retorna o mesmo que:
				POSICIONE("SA1", Nil, xFilial("SA1")+SC5->A1_CLIENTE+SC5->C5_LOJACLI, "A1_NOME","NICK_A1NOME")

	@example	// Se a filial n�o puder ser utilizada com xFilial, informar .F. no lAddFil (quarto par�metro)
				U_TPOS(SC5->(C5_ZFILTRN+C5_ZCGCTRN), "A1_NOME", 1, .F.)

/*/
//===================================================================================================================\\
User Function TPOS(cChave, cCpoRet, xIndice, lAddFil, cTabela)

	Local xRet:= Nil
	Local nIndice, cNickName

	Default xIndice	:= 1
	Default lAddFil	:= .T.

	If ValType(xIndice) == "N"
		nIndice:= xIndice
	ElseIf ValType(xIndice) == "C"
		cNickName:= xIndice
	EndIf

	If ! Empty( cChave ) .And. ! Empty( cCpoRet )

		If Empty(cTabela)
			aBkpSx3:= SX3->( GetArea() )

			SX3->( DbSetOrder( 2 ) )
			If SX3->( MsSeek( cCpoRet ) )
				cTabela:= SX3->X3_ARQUIVO
			EndIf

			SX3->(RestArea(aBkpSx3))
		EndIf

		If ! Empty(cTabela)
			If lAddFil
				cChave:= xFilial(cTabela) + cChave
			EndIf
			xRet:= Posicione(cTabela,nIndice,cChave,cCpoRet,cNickName)

		EndIf

	EndIf

Return ( xRet )
// FIM da Funcao TPOS
//======================================================================================================================

