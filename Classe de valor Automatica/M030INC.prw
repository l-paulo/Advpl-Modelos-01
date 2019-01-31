#Include 'Protheus.ch'

//====================================================================================================================\\
/*/{Protheus.doc}M030INC
  ====================================================================================================================
	@description
	Ponto-de-Entrada: M030INC - Executado na inclus�o do cadastro de clientes

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version	1.0
	@since		23/08/2013

	@obs
	23/06/2014 - Thiago Mota - Automatizar o cadastro de classe de valor, baseado na inclusao do cliente

/*/
//====================================================================================================================\\
User Function M030INC

	If PARAMIXB == 1

		U_AUTOCLVL( "C", SA1->A1_COD, SA1->A1_LOJA ) // 23/06/2014 : Thiago Mota

	Endif

Return .t.

// FIM do Ponto de Entrada M030INC
//====================================================================================================================\\

