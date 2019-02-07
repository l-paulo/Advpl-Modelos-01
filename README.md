# Ferramentas �teis para utiliza��o com ADVPL

## Manipula��o de Array

[aMap](./ArrayUtils/aMap/) -  O m�todo map() invoca a fun��o callback passada por argumento para cada elemento do Array e devolve um novo Array como resultado.

[aFilter](./ArrayUtils/aFilter/) - O m�todo filter() cria um novo array com todos os elementos que passaram no teste implementado pela fun��o fornecida.

[ValArray](./ArrayUtils/ValArray.prw/) - Recuperar informa��o dentro de um Array, validando se existem as posi��es passadas.

## [Classe de Valor Autom�tica](./Classe%20de%20valor%20Automatica/)

Fun��es e pontos de entrada para sincronizar cadastro de clientes e fornecedores com cadastro de classes de valor.

## [Compatibilizador Customizado](./Compatibilizador%20Customizado/)

Classe para cria��o de Compabilizador que facilita o deploy de customiza��es

## [Consulta Borderos](./Consulta%20Borderos/)

Consulta em MVC para a tabela de T�tulos enviados ao banco (SEA)

## [Consulta Sinesp Python](./Consulta%20Sinesp%20Python/)

Consulta de placas utilizando Python.

## [Editar SX5 - Tabelas Gen�ricas](./Editar%20SX5%20-%20Tabelas%20Gen�ricas/EDITASX5_MVC.prw)

Rotina em MVC para poder liberar a consulta e edi��o de tabelas gen�ricas (SX5)

## Fun��es Auxiliares

[fnWhereFil.prw](./Fun��es%20Auxiliares/fnWhereFil.prw) - Retorna as clausulas Where corretas para filtro de v�rias filiais

[FuncRPO.prw](./Fun��es%20Auxiliares/FuncRPO.prw) - Lista de funcoes do RPO.

[PUTSX1.prw](./Fun��es%20Auxiliares/PUTSX1.prw) - PutSX1 para a V12.

[SHELLADVPL.prw](./Fun��es%20Auxiliares/SHELLADVPL.prw) - Tela auxiliar para avalia��o de express�es no Protheus.

[TINI.prw](./Fun��es%20Auxiliares/TINI.prw) - Inicializador padr�o com poucos par�metros, �til para quando o inicializador n�o cabe no X3.

[TPOS.prw](./Fun��es%20Auxiliares/TPOS.prw) - Posicione com poucos par�metros, �til para usar em inicializadores com poucos caracteres de espa�o.

## Leitura de XML

[TGETMSG](./Leitura%20de%20XML/TGETMSG.prw) - Recebe uma Mensagem e uma lista de par�metros e retorna os dados encontrados. �til para buscar dados em Tags de observa��o/informa��es complementares.

[TGETOXML](./Leitura%20de%20XML/TGETOXML.prw) - Abre um arquivo indicado e converte para XML.

[XmlChild](./Leitura%20de%20XML/XmlChild.prw) - Facilitador para Leitura de Tag XML.

## Logs

[GravaLog](./Logs/GravaLog.prw) - Fun��o para centralizar logs.

## Mile

[MileImp](./Mile/MileImp.prw) - Rotina para facilitar a cria��o de modelos customizados na importa��o do Mile

## NF-e

[GerXMLNFe](./NF-e/GerXMLNFe.prw) - Exporta o XML da NF-e (sa�da e entrada), CT-e ou MDF-e, usando as fun��es padr�o de transmiss�o. �til para validar e depurar a gera��o do XML sem precisar transmitir para a SEFAZ.

## Usuarios no Banco de Dados

[TUSUXBCO](./Usuarios%20Banco%20de%20Dados/TUSUXBCO.prw) - Copia o cadastro de usu�rio para uma tabela no banco de dados

## ValidaCNH

[ValidaCNH](./ValidaCNH/CNHValid.PRW) - Valida��o do n�mero da CNH

## WFWEBRelatorio

[WFWEBRelatorio](./WFWebRelatorio/WFWEBRelatorio.prw) - Classe que extende TWFProcess com Fun��es �teis para gera��o de relat�rio gr�fico utilizando HTML.
