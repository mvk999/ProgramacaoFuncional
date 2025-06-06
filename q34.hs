-- Função 34

-- palindromo :: verifica se uma lista é igual a ela mesma invertida
-- Vamos comparar o primeiro e o último elemento da lista recursivamente
palindromo :: (Eq t) => [t] -> Bool
palindromo lista
    | tamanho lista <= 1              = True
    | primeiro lista /= ultimo lista  = False
    | otherwise                       = palindromo (meio lista)

-- tamanho: calcula o tamanho da lista recursivamente
tamanho :: [t] -> Int
tamanho [] = 0
tamanho (_:r) = 1 + tamanho r

-- primeiro: pega o primeiro elemento da lista
primeiro :: [t] -> t
primeiro (x:_) = x

-- ultimo: percorre até o último elemento
ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:r) = ultimo r

-- meio: remove o primeiro e o último elemento da lista
meio :: [t] -> [t]
meio [] = []
meio [_] = []          -- lista de 1 elemento
meio (_:r) = removerUltimo r

-- removerUltimo: remove o último elemento de uma lista
removerUltimo :: [t] -> [t]
removerUltimo [_] = []
removerUltimo (x:xs) = x : removerUltimo xs

