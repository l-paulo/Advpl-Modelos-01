#Include 'Protheus.ch'

//====================================================================================================================\\
/*/{Protheus.doc}TADVPLSHELL
  ====================================================================================================================
	@description
	Interpretador ADVPL

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		17 de fev de 2017

	@obs
	Interpretador para executar comandos e ver o resultado diretamente na tela

	@sample	U_TADVPLSHELL (executar pelo f�rmulas ou diretamente na entrada do sistema)

/*/
//===================================================================================================================\\
User Function TADVPLSHELL()

	Local lPrepEnv:= ( IsBlind() .or. ( Select( "SM0" ) == 0 ) )
	Local cEmp , cFil , cModName , cFunName

	//Se est� logado n�o precisa dar Prepare env
	If lPrepEnv
		PREPARE ENVIRONMENT EMPRESA( cEmp ) FILIAL ( cFil ) MODULO cModulo
	EndIf

	// Monta Tela

	IF ( lPrepEnv )
		RESET ENVIRONMENT
	EndIF

Return ( Nil )
// FIM da Funcao TADVPLSHELL
//======================================================================================================================




//====================================================================================================================\\
/*/{Protheus.doc}SfTela
  ====================================================================================================================
	@description
	Tela principal

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		17 de fev de 2017

/*/
//===================================================================================================================\\
Static Function SfTela()

	// input para a execu��o, um bot�o executar e outro limpar
	// Memo para exibir o resultado
	// Checkbox para Permitir salvar log no arquivo e na console

	// Fun��o que avalia a express�o Eval() ou &(), joga o resultado para texto (usar varinfo), e adiciona no texto do memo.
	// Begin Sequence na fun��o e joga o error log no memo tamb�m


Return ( Nil )
// FIM da Funcao SfTela
//======================================================================================================================


