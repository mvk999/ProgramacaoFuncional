-- removerUltimo
-- Remove o último elemento de uma lista
-- Gera erro se a lista for vazia

removerUltimo :: [a] -> [a]
removerUltimo []     = error "Sua lista esta vazia, impossivel tirar o ultimo elemento"
removerUltimo [_]    = []                             -- lista com 1 elemento → remove e retorna []
removerUltimo (x:xs) = x : removerUltimo xs           -- recursivamente percorre até sobrar um

-- ---------- main ----------
main :: IO ()
main = print (removerUltimo ([1,2] :: [Int]))
