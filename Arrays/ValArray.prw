#Include 'Protheus.ch'

User Function TSTValAr()

	aArrTeste:= { "Posi��o 1", {"Posi��o 2,1", {"Posi��o 2,2,1", {"Posi��o 2,2,2,1" } } } }

	U_ValArray(aArrTeste, {2,2,2,1}, "Retorna a �ltima posi��o", .F.)

	U_ValArray(aArrTeste, {1,1}, "Posi��o n�o  existe")

	U_ValArray(aArrTeste, {2,2}, "Retorna um Array", .T.)

Return

/**********************************************************************************************************
 {Protheus.doc} ValArray

	Descri��o: Recuperar informa��o dentro de um Array, validando se existem as posi��es passadas

@author		TSC681 - Thiago Gon�alves Mota
@version	1.0
@since		14/02/2013
@return		xRet	:=	cPadrao

@param		aArray		Obrigat�rio		Array onde buscar o valor
@param		aNPos		Obrigat�rio		Array com as posi��es onde o valor se encontra
										Ou um n�mero para identifica��o da posi��o em um vetor unidimensional
@param		cPadrao		Padr�o = Nil	Valor padr�o caso n�o for poss�vel encontrar o dado no array
@param		lMudaTipo	Padr�o = .F.	Define se muda o tipo de dados, caso seja diferente do tipo em cPadrao

@sample		U_ValArray(aArray, {4,5}, "TESTE")
			Este exemplo ir� buscar o valor contido em aArray[4,5],
			caso o array n�o possua esta dimens�o, ou o tipo de dados seja diferente do padr�o
			ser� retornado o valor "TESTE"

@obs		15/03/2013 TSC681 - Thiago Mota:
			Facilitar a utiiza��o da fun��o em vetores com apenas uma dimens�o,
			informando valores num�ricos no par�metro aNPos
			Valida��o do par�metro aNPos modificada para aceitar tamb�m valores num�ricos.

*********************************************************************************************************/

User Function ValArray(aArray, aNPos, cPadrao, lMudaTipo)

	Local xRet	:= cPadrao
	Local nI	:= 1
	Local nTam	:= 0
	Local xAux
	Default lMudaTipo:= .F.

	if ValType(aNPos)=="A"
		nTam:= Len(aNPos)
	Elseif ValType(aNPos)=="N"
		nTam:= 1
		aNPos:= { aNPos }
	Elseif ValType(aNPos)=="C"
		//Converte o caracter enviado "1,1,1" para array {"1","1","1"}
		aNPos := StrTokArr2( aNPos, ",", .F. )
		//Converte as posi��es caracteres em numericas-> {1,1,1}
		For nCvt := 1 To Len( aNPos )
			aNPos[ nCvt ] := Val( aNPos[ nCvt ] )
		Next nCvt
		nTam  := Len( aNPos )
	Else
		Return xRet
	EndIf

	While nI <= nTam

		If ValType(aArray)=="A";
		 .And. ValType( aNPos[nI] )=="N" ;
		 .And. Len(aArray) >= aNPos[nI]
			xAux:= aArray[ aNPos[nI] ]
		Else
			Exit
		EndIf

		If nI == nTam
			If lMudaTipo .Or. ValType(xAux) == ValType(cPadrao)
				xRet:= xAux
			EndIf
			Exit
		Else
			aArray:= xAux
			nI++
		EndIf

	EndDo

Return xRet
/* FIM da Fun��o ValArray
//*******************************************************************************************************/

