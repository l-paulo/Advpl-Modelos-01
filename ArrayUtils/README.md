# ArrayUtils - Manipulação de Arrays em ADVPL

## aFilter

Inpirado no Array.filter do Javascript, permite retornar uma cópia do array original, filtrando apenas os elementos que passarem em um teste.

Exemplo:
    Local aFil1:= U_aFilter( { 12, 5, 8, 130, 44 }, {|x| x > 10 } )
    // Resultado: {12,130,44}


## aFind

Retorna um elemento do array encontrado com aScan.

    // Pode ser utilizado para facilitar a leitura de trechos assim:
    aItens:= {"XPTO"}

    xItem:= aItens[aScan(aItens, {|x| x[1] == "XPTO" })][1] // XPTO

    xItem:= aFind(aItens, {|x| x[1] == "XPTO" })[1] // XPTO

    E usando o Default, evitar erros
    xItem:= aFind(aItens, {|x| x[1] == "XPTY" }, {"ARRAY PADRAO"})[1] // ARRAY PADRAO


## aJoin

Inpirado no Array.join() do Javascript, o método join() junta todos os elementos de uma array em uma string.

Exemplo:
    aVetor:= {2,"Teste",.T.,dDatabase}
    U_aJoin( aVetor, ";" ) // "2;Teste;.T.,29/01/2019"

## aMap

Inpirado no Array.map do Javascript, permite retornar uma cópia do array original, porém com as posições modificadas conforme necessidade do desenvolvedor.

Exemplo:
    aOriginal:= {2,4,6,8}
    aModificado:= aMap(aOriginal, {|x| x*2 })
    // Resultado: {4,8,12,16}

## aReduce

Inpirado no Array.reduce do Javascript, permite totalizar o conteúdo do array original, de acordo com a função fornecida.

Exemplo:
    aOriginal:= {2,4,6,8}
    nTotal:= aReduce(aOriginal, {|x,y| x+y })
    // Resultado: 20

## aProduct

Inspirado no itertools.product(*iterables, repeat=1) do Python, A função Product() retorna o produto cartesiano dos dados inputados


> Obs: Testes implementados com [advpl-testsuite](https://github.com/nginformatica/advpl-testsuite)
