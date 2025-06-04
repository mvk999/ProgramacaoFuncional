-- Função 10: maiores
-- Retorna os n maiores elementos da lista, na ordem original de aparição

maiores :: (Ord a, Eq a) => Int -> [a] -> [a]
maiores n lista = filtrar lista maioresSelecionados
  where
    -- 1. Ordena a lista em ordem decrescente e pega os n maiores
    maioresSelecionados = take n (ordenarDecrescente lista)

    -- 2. Percorre a lista original e inclui somente os elementos que estão na lista dos maiores
    --    removendo da lista de controle cada elemento selecionado (para respeitar a quantidade exata)
    filtrar :: (Eq a) => [a] -> [a] -> [a]
    filtrar [] _ = []
    filtrar _ [] = []
    filtrar (x:xs) maioresRestantes
      | x `elem` maioresRestantes = x : filtrar xs (removerPrimeira x maioresRestantes)
      | otherwise                 = filtrar xs maioresRestantes

    -- 3. Remove apenas a primeira ocorrência de um elemento
    removerPrimeira :: (Eq a) => a -> [a] -> [a]
    removerPrimeira _ [] = []
    removerPrimeira y (z:zs)
      | y == z    = zs
      | otherwise = z : removerPrimeira y zs

    -- 4. Ordena a lista em ordem decrescente
    ordenarDecrescente :: (Ord a) => [a] -> [a]
    ordenarDecrescente = ordenarDec

    ordenarDec :: (Ord a) => [a] -> [a]
    ordenarDec [] = []
    ordenarDec (x:xs) = maiores ++ [x] ++ menores
      where
        maiores = ordenarDec [a | a <- xs, a > x]
        menores = ordenarDec [a | a <- xs, a <= x]

---------------main------------------
main :: IO ()
main = print (maiores 4 [9,6,5,7,8,4,4,7])
