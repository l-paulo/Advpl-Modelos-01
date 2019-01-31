#Include 'Protheus.ch'


//====================================================================================================================\\
/*/{Protheus.doc}TINI
  ====================================================================================================================
	@description
	Fun��o auxiliar para inicializadores padr�o.

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		23 de set de 2016

	@param		cCpoDes, Caracatere,	Campo que ser� inicializado
	@param		cChave	, Caracatere,	Chave de pesquisa
	@param		cCpoRet, Caracatere,	Campo a retornar
	@param		xPadrao, Caracatere,	Valor padr�o no caso de inclus�o - Padr�o: campo em branco conforme tipo.
	@param		lPadrao, L�gico, 		Retorna o valor padr�o. Utilizado em inicializador de Browse e opera��es de inclus�o- Padr�o: vari�vel INCLUI, dispon�vel como private nas telas padr�o.
	@param		xIndice, Indefinido,	�ndice (se num�rico) ou Nickname (se caractere ) - Padr�o: �ndice 1
	@param		lAddFil, L�gico,		Indica se deve adicionar xFilial � cChave - Padr�o: .T.
	@param		cTabela, Caracatere,	Alias da tabela (se n�o for informado, ser� buscado o Alias do cCpoRet no SX3)

	@obs
	Fun��o criada para poder executar inicializadores padr�o passando menos dados.
	O obetivo � ter um inicializador padr�o facilmente nos campos virtuais.
retor
	Utiliza a fun��o auxilizar U_TPOS para buscar os dados via posicione.

	@example	U_TINI("C5_ZNOMCLI", SC5->(A1_CLIENTE+M->A1_LOJA), "A1_NOME") // Inicializador padr�o
				// Retorna o mesmo que:
				IF( INCLUI, SPACE(30), POSICIONE("SA1", 1, SC5->(A1_CLIENTE+M->A1_LOJA), "A1_NOME") )

	@example	U_TINI("C5_ZNOMCLI", SC5->(A1_CLIENTE+M->A1_LOJA), "A1_NOME", .F.) // Inicializador de Browse

/*/
//===================================================================================================================\\
User Function TINI(cCpoDes, cChave, cCpoRet, xPadrao, lInclui, xIndice, lAddFil, cTabela)

	Local xRet:= Nil
	Local nPos

	Static aPadrao:= {}

	Default lInclui:= INCLUI

	// Se n�o foi determinado um padr�o, busca pelo
	If lInclui .And. xPadrao == Nil

		If ( nPos:= aScan(aPadrao, {|x| x[1] == cCpoDes }) ) > 0
			xPadrao:= aPadrao[nPos][3]
		Else
			aBkpSx3:= SX3->( GetArea() )

			SX3->( DbSetOrder( 2 ) )
			If SX3->( MsSeek( cCpoDes ) )
				Do Case
				Case (SX3->X3_TIPO == "C")
					xPadrao:= Space(SX3->X3_TAMANHO)
				Case (SX3->X3_TIPO == "M")
					xPadrao:= Space(500)
				Case (SX3->X3_TIPO == "N")
					xPadrao:= 0
				Case (SX3->X3_TIPO == "D")
					xPadrao:= cTod("  /  /    ")
				Case (SX3->X3_TIPO == "L")
					xPadrao:= .F.
				EndCase

				aAdd(aPadrao, {cCpoDes, SX3->X3_TIPO, xPadrao})
			EndIf

			SX3->(RestArea(aBkpSx3))
		EndIf
	EndIf

	xRet:= Iif( lInclui, xPadrao, U_TPOS(cChave, cCpoRet, xIndice, lAddFil, cTabela) )

	If xRet == Nil .And. xPadrao != Nil
		xRet:= xPadrao
	EndIf

Return ( xRet )
// FIM da Funcao TINI
//======================================================================================================================



