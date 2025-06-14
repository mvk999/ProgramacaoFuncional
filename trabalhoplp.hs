-- Função 1: ultimo
-- Retorna o último elemento de uma lista
ultimo :: [a] -> a
ultimo []     = error "Lista vazia: não existe último elemento."
ultimo [x]    = x
ultimo (_:xs) = ultimo xs


-- Função 4: maiores_que
-- Recebe um valor de comparação e uma lista ordenável,
-- Retorna os elementos que são maiores que o valor fornecido.

maiores_que :: (Ord a) => a -> [a] -> [a]
maiores_que _ [] = []                        -- Se a lista está vazia, retorna lista vazia
maiores_que ref (x:xs)
    | x > ref   = x : maiores_que ref xs     -- Se x é maior que o valor de referência, inclui x no resultado
    | otherwise = maiores_que ref xs         -- Senão, ignora x e continua com o resto da lista


-- Função: 7
-- removerUltimo
-- Remove o último elemento de uma lista
-- Gera erro se a lista for vazia

removerUltimo :: [a] -> [a]
removerUltimo []     = error "Sua lista esta vazia, impossivel tirar o ultimo elemento"
removerUltimo [_]    = []                             -- lista com 1 elemento → remove e retorna []
removerUltimo (x:xs) = x : removerUltimo xs           -- recursivamente percorre até sobrar um


--Função: 10
--recebe um número natural n e uma lista, retorna uma lista com os n maiores elementos sem alterar a ordem entre os elementos
maiores :: (Ord a) => Int -> [a] -> [a]
maiores n xs = filtra xs (n_maiores n xs)
  where
    -- Mantém na ordem original só os elementos que estão na lista dos maiores
    filtra [] _ = []
    filtra (y:ys) zs
      | pertence y zs = y : filtra ys (removerPrimeira y zs)
      | otherwise     = filtra ys zs

    -- Remove a primeira ocorrência (usada de novo aqui)
    removerPrimeira _ [] = []
    removerPrimeira el (y:ys)
      | el == y   = ys
      | otherwise = y : removerPrimeira el ys

    n_maiores 0 _  = []
    n_maiores _ [] = []
    n_maiores n xs = maior : n_maiores (n-1) (removerPrimeira maior xs)
      where
        maior = maior_elemento xs

        -- Função auxiliar para achar o maior elemento
        maior_elemento [x] = x
        maior_elemento (x:xs)
          | x > y     = x
          | otherwise = y
          where y = maior_elemento xs



-- Função 13: divide
-- Recebe uma lista e um número natural n,
-- Retorna um par: (os n primeiros elementos, o resto da lista)
divide :: [a] -> Int -> ([a], [a])
divide [] _ = ([], [])                       -- Se a lista está vazia, retorna duas listas vazias
divide lista 0 = ([], lista)                 -- Se n é 0, o primeiro pedaço é vazio e o resto é a lista toda
divide (x:xs) n = (x:primeiros, resto)       -- Pega o primeiro elemento para a esquerda, chama recursão no resto
  where
    (primeiros, resto) = divide xs (n-1)     -- Recursão para pegar o próximo elemento



-- Função 16: intercala
-- Recebe duas listas e retorna uma nova lista intercalando os elementos das duas
intercala :: [a] -> [a] -> [a]
intercala [] ys = ys                             -- Se a primeira lista acabou, retorna o resto da segunda
intercala xs [] = xs                             -- Se a segunda lista acabou, retorna o resto da primeira
intercala (x:xs) (y:ys) = x : y : intercala xs ys -- Pega um elemento de cada e segue intercalando recursivamente



-- Função 19: mesmos_elementos
-- Verifica se duas listas têm os mesmos elementos, ignorando repetições e ordem
mesmos_elementos :: Eq a => [a] -> [a] -> Bool
mesmos_elementos xs ys =
    todos_em listaA listaB && todos_em listaB listaA
  where
    listaA = remover_repetidos xs
    listaB = remover_repetidos ys

    -- Remove elementos repetidos da lista
    remover_repetidos [] = []
    remover_repetidos (x:xs)
      | pertence x xs = remover_repetidos xs
      | otherwise     = x : remover_repetidos xs

    -- Usa a função 'pertence' já definida no seu código!
    todos_em [] _ = True
    todos_em (x:xs) ys
      | pertence x ys = todos_em xs ys
      | otherwise     = False


pertence :: Eq a => a -> [a] -> Bool
pertence _ [] = False
pertence a (b:bs)
  | a == b    = True
  | otherwise = pertence a bs


--Função 22:Ordena uma lista usando insertion sort
ordena :: (Ord a) => [a] -> [a]
ordena [] = []                                         -- Lista vazia já está ordenada
ordena (x:xs) = insere_ordenado x (ordena xs)          -- Ordena o resto e insere x no lugar certo
  where
    -- Insere um elemento na posição correta numa lista ordenada
    insere_ordenado x [] = [x]                             -- Lista vazia: só retorna x
    insere_ordenado x (y:ys)
      | x <= y    = x : y : ys                            -- Coloca x antes de y
      | otherwise = y : insere_ordenado x ys              -- Continua procurando o lugar



-- Função 25: rodar_esquerda
-- Roda a lista para a esquerda n vezes
rodar_esquerda :: Int -> [a] -> [a]
rodar_esquerda _ [] = []  -- Lista vazia não muda
rodar_esquerda n xs
    | n <= 0    = xs
    | otherwise = rodar_n k xs
  where
    tam = tamanho xs
    k = meu_mod n tam

    -- Função que de fato faz o giro n vezes
    rodar_n 0 ys = ys
    rodar_n m (y:ys) = rodar_n (m-1) (ys ++ [y])


meu_mod :: Int -> Int -> Int
meu_mod a b
    | b == 0    = 0   -- evita divisão por zero
    | a < b     = a
    | otherwise = meu_mod (a - b) b

tamanho :: [a] -> Int
tamanho [] = 0
tamanho (_:xs) = 1 + tamanho xs

-- Função 28: primeiras_maiusculas
-- Retorna a string onde só as iniciais são maiúsculas, o resto minúsculo
primeiras_maiusculas :: String -> String
primeiras_maiusculas [] = []
primeiras_maiusculas (x:xs) = paraMaiuscula x : processa xs x
  where
    processa [] _ = []
    processa (y:ys) ant
      | ant == ' ' = paraMaiuscula y : processa ys y
      | otherwise  = paraMinuscula y : processa ys y

    -- Função auxiliar: minúscula pra maiúscula
    paraMaiuscula c
      | 'a' <= c && c <= 'z' = toEnum (fromEnum c - fromEnum 'a' + fromEnum 'A')
      | otherwise = c

    -- Função auxiliar: maiúscula pra minúscula
    paraMinuscula c
      | 'A' <= c && c <= 'Z' = toEnum (fromEnum c - fromEnum 'A' + fromEnum 'a')
      | otherwise = c


-- Função 31: mediana
-- Calcula a mediana de uma lista de números racionais
mediana :: [Float] -> Float
mediana [] = error "Lista vazia não tem mediana."
mediana xs
  | impar tamanhoLista = elementoMeio
  | otherwise          = (elementoMeio + proximoMeio) / 2
  where
    listaOrdenada = ordena xs
    tamanhoLista = tamanho listaOrdenada

    -- Retorna True se o número é ímpar
    impar n = meu_mod n 2 == 1

    -- Divisão inteira feita à mão (local, só existe dentro de mediana)
    meu_div _ 0 = error "Divisão por zero"
    meu_div a b
      | a < b     = 0
      | otherwise = 1 + meu_div (a - b) b

    meio = meu_div tamanhoLista 2

    -- Função para pegar o n-ésimo elemento da lista
    nEsimo :: [a] -> Int -> a
    nEsimo (y:_)  0 = y
    nEsimo (_:ys) n = nEsimo ys (n-1)
    nEsimo []    _  = error "Índice fora da lista."

    -- Elementos centrais
    elementoMeio  = nEsimo listaOrdenada meioMenosUm
    proximoMeio   = nEsimo listaOrdenada meio

    meioMenosUm = if impar tamanhoLista then meio else meio - 1



-- Função 34: palindromo
-- Verifica se uma lista (string, número, qualquer lista) é palíndromo
palindromo :: Eq a => [a] -> Bool
palindromo []  = True                        -- Lista vazia é palíndromo
palindromo [_] = True                        -- Lista com 1 elemento é palíndromo
palindromo xs
    | primeiro == ultimo = palindromo (meio xs)    -- Compara extremos e chama recursivamente no "miolo"
    | otherwise          = False
  where
    primeiro = cabeca xs                    -- Pega o primeiro elemento
    ultimo   = ult xs                       -- Pega o último elemento

    -- Retorna o "miolo" da lista (sem o primeiro e o último)
    meio [] = []
    meio [_] = []
    meio (_:ys) = removerUltimo ys          -- Usa sua função removerUltimo!

    -- Sua função já criada para pegar o último elemento
    ult :: [a] -> a
    ult []     = error "Lista vazia"
    ult [x]    = x
    ult (_:ys) = ult ys

    -- Pega o primeiro elemento (cabeça)
    cabeca :: [a] -> a
    cabeca (z:_) = z
    cabeca []    = error "Lista vazia"



-- Função 37: bolha
-- Ordena uma lista usando o método da bolha (bubble sort burro)
bolha :: (Ord a) => [a] -> [a]
bolha xs = bolhaAux (tamanho xs) xs
  where
    -- Repete o processo de bolha n vezes (n = tamanho da lista)
    bolhaAux 0 ys = ys
    bolhaAux n ys = bolhaAux (n-1) (bolhaPasso ys)

    -- Um "passo" do bubble sort: empurra o maior para o final
    bolhaPasso [] = []
    bolhaPasso [x] = [x]
    bolhaPasso (x:y:zs)
      | x > y     = y : bolhaPasso (x:zs)
      | otherwise = x : bolhaPasso (y:zs)
