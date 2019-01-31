#INCLUDE 'PROTHEUS.CH'

//====================================================================================================================\
/*/{Protheus.doc}UTDSCli
  ====================================================================================================================
	@description
	Classe para executar compila��o e aplica��o de patches via TDSCli

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version 1.0
	@since 31/08/2018

/*/
//===================================================================================================================\
// Dummy
User Function UTDSCli()
Return (.T.)

Class UTDSCli From LongClassName

	Data cIncludes
	Data cPathConf
	Data cPathTmp
	Data cFileConf
	Data cPathTDS
	Data cAuthorization
	Data cBuild
	Data cCommand
	Data cEnvironment
	Data cFilterProgram
	Data cServerType
	Data cPort
	Data cProgram
	Data cProgramList
	Data cPsw
	Data cRecompile
	Data cServer
	Data cServerName
	Data cUser
	Data cWorkspace
	Data cTdsCliBat


	Method New() Constructor
	Method Exec(cCommand)

EndClass
// FIM da defini��o da Classe UTDSCli
//======================================================================================================================


//====================================================================================================================\
/*/{Protheus.doc}UTDSCli:New
  ====================================================================================================================
	@description
	M�todo Construtor da Classe

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version 1.0
	@since 31/08/2018

/*/
//===================================================================================================================\
Method New() Class UTDSCli

	::cTdsCliBat:= "TDSCLI.bat"
	::cServerType:= "Advpl"

Return ( Self )
// FIM da Funcao UTDSCli:New
//======================================================================================================================


//====================================================================================================================\
/*/{Protheus.doc}UTDSCli:Exec
  ====================================================================================================================
	@description
	M�todo que executa o TDSCli

	@author Thiago Mota
	@author <mota.thiago@totvs.com.br>
	@author <tgmspawn@gmail.com>

	@version 1.0
	@since 31/08/2018

/*/
//===================================================================================================================\
Method Exec(cCommand) Class UTDSCli

	Local lRet:= .F.
	Local cCmdExec:= ""
	Local lWaitRun:= .T.

	cCmdExec:= ::cPathTDS + ::cTdsCliBat + " " + cCommand

	If ! Empty(::cFileConf)
		cCmdExec += " @" + ::cFileConf
	EndIf

	If WaitRunSrv( @cCmdExec, @lWaitRun , ::cPathTDS )
		ConOut("Sucess")
		lRet:= .T.
	Else
		ConOut("Error")
	EndIf

Return ( lRet )
// FIM do M�todo UTDSCli:Exec
//======================================================================================================================




