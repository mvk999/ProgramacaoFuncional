-- Insere um elemento na posição correta em uma lista ordenada
insere_ordenado :: (Ord t) => t -> [t] -> [t]
insere_ordenado x [] = [x]                          -- Se a lista está vazia, só retorna o elemento
insere_ordenado x (y:ys)
    | x <= y    = x : y : ys                        -- Se x é menor ou igual a y, coloca x antes de y
    | otherwise = y : insere_ordenado x ys          -- Senão, vai procurando a posição certa

-- Ordena uma lista usando insertion sort
ordena :: (Ord t) => [t] -> [t]
ordena [] = []                                      -- Lista vazia já está ordenada
ordena (x:xs) = insere_ordenado x (ordena xs)       -- Ordena o resto e insere x no lugar certo
