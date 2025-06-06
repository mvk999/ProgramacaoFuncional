-- Função 13
-- Recebe uma lista e um número natural n, retorna (n primeiros elementos, resto)
divide :: [t] -> Int -> ([t], [t])
divide [] _ = ([], [])                        -- Caso base: lista vazia
divide lista 0 = ([], lista)                  -- Caso base: n == 0
divide (x:xs) n = (x:primeiros, resto)        -- Caso geral: pega x e continua
  where                                       -- Uso o where para criar variáveis auxiliares
    (primeiros, resto) = divide xs (n-1)      -- Chama recursivamente para o resto da lista
