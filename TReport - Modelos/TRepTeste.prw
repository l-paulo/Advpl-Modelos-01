#Include 'Protheus.ch'

//====================================================================================================================\\
/*/{Protheus.doc}TRepTeste
  ====================================================================================================================
	@description
	Relat�rio TRepTeste - Teste de TReport
	Teste de TReport

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		25/10/2013
	@return		Nil			, Nil				, N�o se aplica

	@obs
	Lista de par�metros:
	Grupo de perguntas:	TREPT
	�reas utilizadas:
	Backup e Restore das �reas: .F.
	M�todo de Sele��o:	1  (0 - TReport, 1 = TCQuery(cQuery), 2 = Embedded SQL )

	Modelo de testes do TReport

	@sample	U_TRepTeste()
	@example	examples

/*/
//===================================================================================================================\\
User Function TRepTeste()
	Local lBkpArea		:= .F.
	Local aAreaBkp		:= {}
	Local oReport

	If lBkpArea // Backup das �reas atuais
		aEval({Areas}, { |area| aAdd(aAreaBkp, (area)->(GetArea()) ) } )
		aAdd(aAreaBkp, GetArea())
	EndIf

	oReport := ReportDef()
	oReport:PrintDialog()

	If lBkpArea // Restaura as �reas anteriores
		aEval(aAreaBkp, {|area| RestArea(area)})
	EndIf
Return ( Nil )
// FIM do Relat�rio TRepTeste
//======================================================================================================================



//====================================================================================================================\\
/*/{Protheus.doc}ReportDef
  ====================================================================================================================
	@description
	Relat�rio TRepTeste - Teste de TReport
	A funcao estatica ReportDef devera ser criada para todos os relatorios que poderao ser agendados pelo usuario.

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		25/10/2013
	@return		oReport		, Objeto		, Objeto da Classe TReport com as defini��es de impress�o


	@obs		Par�metros passados para a ReportPrint: oReport
				Modelo de testes do TReport

/*/
//===================================================================================================================\\
Static Function ReportDef()
	Local oReport
	Local cNomRel	:= 'TRepTeste'	//Nome do relatorio.
	Local cTitRel	:= 'Teste de TReport' //Titulo do relatorio.
	Local cDesRel	:= 'Teste de TReport' //Descricao do relatorio.
	Local cGruPer	:= 'TREPT' // Grupo de perguntas

	Local oSec1
	Local oSec2

	oReport := TReport():New(cNomRel,cTitRel,/*cGruPer*/, {|oReport| ReportPrint(oReport)},cDesRel,;
								/*lLandscape*/,/*uTotalText*/,/*lTotalInLine*/,/*cPageTText*/,/*lPageTInLine*/,/*lTPageBreak*/,/*nColSpace*/)

	oSec1:= TRSection():New(oReport,"SECAO1",/*uTable*/,/*aOrder*/,/*lLoadCells*/,/*lLoadOrder*/,/*uTotalText*/, ;
							/*lTotalInLine*/,/*lHeaderPage*/,/*lHeaderBreak*/,/*lPageBreak*/,/*lLineBreak*/, ;
							/*nLeftMargin*/,/*lLineStyle*/,/*nColSpace*/,/*lAutoSize*/,/*cCharSeparator*/, ;
							/*nLinesBefore*/,/*nCols*/,/*nClrBack*/,/*nClrFore*/,/*nPercentage*/)

	oSec2:= TRSection():New(oSec1,"SECAO2",/*uTable*/,/*aOrder*/,/*lLoadCells*/,/*lLoadOrder*/,/*uTotalText*/, ;
							/*lTotalInLine*/,/*lHeaderPage*/,/*lHeaderBreak*/,/*lPageBreak*/,/*lLineBreak*/, ;
							/*nLeftMargin*/,/*lLineStyle*/,/*nColSpace*/,/*lAutoSize*/,/*cCharSeparator*/, ;
							/*nLinesBefore*/,/*nCols*/,/*nClrBack*/,/*nClrFore*/,/*nPercentage*/)
	oSec2:SetParentQuery ( .T. )

	TRCell():New(oSec1,"A1_COD",,/*cTitle*/,/*cPicture*/,/*nSize*/ 20,/*lPixel*/,/*bBlock*/,/*cAlign "LEFT,RIGHT,CENTER"*/,/*lLineBreak*/,;
						/*cHeaderAlign*/,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	TRCell():New(oSec1,"A1_NOME",,/*cTitle*/,/*cPicture*/,/*nSize*/40,/*lPixel*/,/*bBlock*/,/*cAlign "LEFT,RIGHT,CENTER"*/,/*lLineBreak*/,;
						/*cHeaderAlign*/,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	TRCell():New(oSec2,"F2_DOC",,/*cTitle*/,/*cPicture*/,/*nSize*/20,/*lPixel*/,/*bBlock*/,/*cAlign "LEFT,RIGHT,CENTER"*/,/*lLineBreak*/,;
						/*cHeaderAlign*/,/*lCellBreak*/,/*nColSpace*/,/*lAutoSize*/,/*nClrBack*/,/*nClrFore*/,/*lBold*/)

	TRBreak():New(oSec1,"A1_COD",/*uTitle*/,/*lTotalInLine*/,/*cName*/,/*lPageBreak*/)

	If !Empty(oReport:uParam)
        AjusParam(cGruPer)
        Pergunte(oReport:uParam,.F.)
	EndIf

Return (oReport)
// FIM da Fun��o ReportDef
//======================================================================================================================



//====================================================================================================================\\
/*/{Protheus.doc}ReportPrint
  ====================================================================================================================
	@description
	Relat�rio TRepTeste - Teste de TReport
	Fun��o respons�vel pela execu��o do relat�rio

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		25/10/2013
	@return		Nil			, Nil				, N�o se aplica

	@obs		Lista de par�metros: oReport

/*/
//===================================================================================================================\\
Static Function ReportPrint(oReport)

	Local cAliasQry := GetNextAlias()
	Local nTipQuery := 1

	Private oSecCli:= oReport:Section(1)
	Private oSecNfe:= oSecCli:Section(1)
//	MakeSqlExpr(oReport:uParam)

	cQuery:= " SELECT A1_COD, A1_LOJA, A1_NOME, F2_DOC FROM "+ RetSQLTab("SA1")+" INNER JOIN "+ RetSQLTab("SF2")+" ON F2_CLIENTE=A1_COD AND F2_LOJA=A1_LOJA WHERE "+RetSQLCond("SA1,SF2")
	cQuery+= " ORDER BY 1,2,3 "
	oSecCli:SetQuery(cAliasQry,cQuery,/*lChangeQuery*/.F.,/*aParam*/,/*aTCFields*/)
//	oReport:Section(1):Print()
	DbSelectArea(cAliasQry)

	Private cCliAnt:= ""
	While !Eof()
		If (cAliasQry)->(A1_COD+A1_LOJA) != cCliAnt
			oSecCli:Init()
			oSecCli:PrintLine()
			oSecNfe:Init()
		EndIf
		oSecNfe:PrintLine()
		cCliAnt:= (cAliasQry)->(A1_COD+A1_LOJA)
		(cAliasQry)->(dbSkip())
		If Eof() .Or. (cAliasQry)->(A1_COD+A1_LOJA) != cCliAnt
			oSecNfe:Finish()
			oSecCli:Finish()
		EndIf
	End


Return ( Nil )
// FIM da Fun��o ReportPrint
//======================================================================================================================



//====================================================================================================================\\
/*/{Protheus.doc}ExecRelQry
  ====================================================================================================================
	@description
	Relat�rio TRepTeste - Teste de TReport
	Fun��o que ajusta o grupo de perguntas utilizado nos filtros do relat�rio

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		25/10/2013
	@return		nCount		, Num�rico		, Quantidade de registros na Query

	@param		nTipQuery	, Num�rico		, Indica o tipo de Query a utilizar (1 = Query TXT, 2 = Embedded SQL)
	@param		oReport		, Objeto		, Objeto da Classe TReport com as defini��es de impress�o
	@param		cAliasQry	, Caractere	, Alias da para a Query

/*/
//===================================================================================================================\\
Static Function ExecRelQry(nTipQuery, oReport, cAliasQry)
	Local nCount	:= 0
	Local cQuery	:= ""

	If nTipQuery == 1

		cQuery+= " SELECT A1_COD, A1_NOME FROM "+ RetSQLTab("SA1")+" WHERE "+RetSQLFill("SA1")

	EndIf

	Count to nCount //TODO: Ver se funciona com Embedded


Return ( nCount )
// FIM da Fun��o ExecRelQry
//======================================================================================================================



//====================================================================================================================\\
/*/{Protheus.doc}AjusParam
  ====================================================================================================================
	@description
	Relat�rio TRepTeste - Teste de TReport
	Fun��o que ajusta o grupo de perguntas utilizado nos filtros do relat�rio

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		25/10/2013
	@return		Nil			, Nil				, N�o se aplica

	@param		cGruPer		, Caractere	, Grupo de perguntas do SX1

/*/
//===================================================================================================================\\
Static Function AjusParam(cGruPer)

Return ( Nil )
// FIM da Fun��o AjusParam
//======================================================================================================================
