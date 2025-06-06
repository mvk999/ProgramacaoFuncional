
-- Função 28
-- Função principal
primeiras_maiusculas :: String -> String
primeiras_maiusculas [] = []
primeiras_maiusculas (x:xs) = 
    para_maiuscula x : processa xs x
  where
    -- processa: para cada caractere, vê se o anterior era espaço para pôr maiúscula
    processa [] _ = []
    processa (y:ys) ant
      | ant == ' ' = para_maiuscula y : processa ys y
      | otherwise  = para_minuscula y : processa ys y

    -- para_maiuscula: transforma um char minúsculo em maiúsculo, se for letra
    para_maiuscula c
      | c >= 'a' && c <= 'z' = toEnum (fromEnum c - 32)  -- ASCII: diferença entre 'a' e 'A' é 32
      | otherwise            = c

    -- para_minuscula: transforma um char maiúsculo em minúsculo, se for letra
    para_minuscula c
      | c >= 'A' && c <= 'Z' = toEnum (fromEnum c + 32)
      | otherwise            = c
