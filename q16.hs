-- Função 16
-- Recebe duas listas e retorna uma terceira com os elementos intercalados
intercala :: [t] -> [t] -> [t]
intercala [] ys = ys                         -- Se a primeira lista acabou, pega o resto da segunda
intercala xs [] = xs                         -- Se a segunda lista acabou, pega o resto da primeira
intercala (x:xs) (y:ys) = x : y : intercala xs ys  -- Pega um de cada e segue
