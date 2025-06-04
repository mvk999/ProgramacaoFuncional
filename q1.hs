-- Função 1: ultimo
-- Retorna o último elemento de uma lista
-- Exemplo: ultimo [1,2,3] = 3

ultimo :: [a] -> a
ultimo []     = error "Lista vazia: não existe último elemento."
ultimo [x]    = x
ultimo (_:xs) = ultimo xs

-- Testando no main
main :: IO ()
main = print (ultimo [1])
