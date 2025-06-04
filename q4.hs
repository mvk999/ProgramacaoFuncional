-- Função 4: maiores_que
-- Recebe um valor de comparação e uma lista ordenável,
-- Retorna os elementos que são maiores que o valor fornecido.
-- Exemplo: maiores_que 10 [4,6,30,3,15,3,10,7] => [30,15]

maiores_que :: (Ord a) => a -> [a] -> [a]
maiores_que ref lista = filter (> ref) lista


---------------------main-----------------------
main :: IO ()
main = print (maiores_que 10 [4,6,30,3,15,3,10,7])
