-- Função 19 : verifica se duas listas têm os mesmos elementos,
-- ignorando a ordem e a quantidade de repetições
mesmos_elementos :: Eq a => [a] -> [a] -> Bool
mesmos_elementos xs ys =
    let a = remover_repetidos xs   -- 'a' é a lista xs sem elementos repetidos
        b = remover_repetidos ys   -- 'b' é a lista ys sem elementos repetidos
    in todos_em a b && todos_em b a   -- Checa se todos de 'a' estão em 'b' e vice-versa

-- Função auxiliar: verifica se todos os elementos da primeira lista estão na segunda
todos_em :: Eq a => [a] -> [a] -> Bool
todos_em [] _ = True  -- Se a primeira lista acabou, todos os elementos foram encontrados
todos_em (x:xs) ys
    | contem x ys = todos_em xs ys   -- Se x está em ys, verifica o resto
    | otherwise   = False           -- Se x não está em ys, retorna False (faltou elemento)
  where
    -- Função auxiliar local: verifica se um elemento está na lista (recursivamente)
    contem _ [] = False             -- Se a lista acabou e não achou, retorna False
    contem y (z:zs)
      | y == z    = True            -- Se achou o elemento, retorna True
      | otherwise = contem y zs     -- Senão, continua procurando no resto da lista

-- Função auxiliar: remove elementos repetidos da lista
remover_repetidos :: Eq a => [a] -> [a]
remover_repetidos [] = []           -- Lista vazia, não tem nada pra remover
remover_repetidos (x:xs)
    | contem x xs = remover_repetidos xs     -- Se x aparece no resto, ignora esse x
    | otherwise   = x : remover_repetidos xs -- Senão, mantém x e continua
  where
    -- Função auxiliar local: mesma lógica da anterior, verifica se um elemento aparece na lista
    contem _ [] = False
    contem y (z:zs)
      | y == z    = True
      | otherwise = contem y zs

