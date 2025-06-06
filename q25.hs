rodar_esquerda :: Int -> [a] -> [a]
rodar_esquerda _ [] = []  -- Lista vazia não muda
rodar_esquerda n xs
    | n <= 0    = xs      -- Girar zero ou negativo, retorna igual
    | otherwise = rodar_aux (meu_mod n (tamanho xs)) xs  -- Ajusta o valor do giro
  where
    -- Função recursiva de fato que gira n vezes
    rodar_aux 0 ys = ys
    rodar_aux k (y:ys) = rodar_aux (k-1) (ys ++ [y])

tamanho :: [a] -> Int
tamanho [] = 0
tamanho (_:xs) = 1 + tamanho xs

meu_mod :: Int -> Int -> Int
meu_mod a b
    | a < b     = a
    | otherwise = meu_mod (a - b) b
