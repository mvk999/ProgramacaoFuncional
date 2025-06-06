
-- Função 37
-- bolha :: recebe uma lista de inteiros
-- retorna a lista ordenada usando o método da bolha burra
-- Não usa a classe Ord — usa Int diretamente (comparações com números)
-- Repetimos várias passagens pela lista, sempre empurrando o maior para o final

bolha :: [Int] -> [Int]
bolha lista = aplicarVezes (length lista) lista
-- bolha aplica o processo de ordenação várias vezes sobre a lista original

-- aplicarVezes n lista: aplica n-1 vezes a função de uma "varredura" simples (passoBolha)
aplicarVezes :: Int -> [Int] -> [Int]
aplicarVezes 0 lista = lista -- base: nenhuma repetição
aplicarVezes vezes lista = aplicarVezes (vezes - 1) (passoBolha lista)

-- passoBolha: percorre a lista comparando pares consecutivos
-- se o da esquerda for maior, troca com o da direita
passoBolha :: [Int] -> [Int]
passoBolha (atual:seguinte:resto)
    | atual > seguinte = seguinte : passoBolha (atual : resto)
    | otherwise        = atual    : passoBolha (seguinte : resto)
passoBolha listaFinal = listaFinal
