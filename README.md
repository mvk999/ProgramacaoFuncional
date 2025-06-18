
# Projeto em Haskell - Funções Auxiliares e Algoritmos

Este repositório contém um conjunto de funções auxiliares implementadas em Haskell, abordando diversos conceitos de programação funcional. As funções implementadas neste projeto lidam com a manipulação de listas, cálculos matemáticos e estatísticas, algoritmos de ordenação, verificação de palíndromos, e outras operações comuns em programação.

Este é um projeto desenvolvido como parte da disciplina **Paradigmas de Programação**, oferecida no curso de Ciência da Computação da **Universidade Federal de Lavras** (UFLA). O objetivo do projeto foi aplicar os conceitos aprendidos na disciplina, como recursão, alta ordem e operações com listas, utilizando a linguagem Haskell.

**Integrantes:**
- **Arthur Soares Marques** - Matrícula: 202410376
- **Marcos Vinícius Pereira** - Matrícula: 202411098

## Índice

1. [Funções Auxiliares Globais](#funções-auxiliares-globais)
2. [Funções de Manipulação de Listas](#funções-de-manipulação-de-listas)
3. [Funções Matemáticas e Estatísticas](#funções-matemáticas-e-estatísticas)
4. [Funções de Ordenação](#funções-de-ordenação)
5. [Funções de Análise de Palíndromos](#funções-de-análise-de-palíndromos)
6. [Função de Pesquisa de Maior Elemento](#função-de-pesquisa-de-maior-elemento)
7. [Como Rodar o Projeto](#como-rodar-o-projeto)
8. [Contribuições](#contribuições)

## Funções Auxiliares Globais

### `pertence`

Verifica se um elemento está presente em uma lista.

```haskell
pertence :: Eq t => t -> [t] -> Bool
```

### `meu_mod`

Calcula o resto da divisão inteira (mod) sem usar o operador padrão.

```haskell
meu_mod :: Int -> Int -> Int
```

### `tamanho`

Retorna o tamanho (número de elementos) de uma lista.

```haskell
tamanho :: [t] -> Int
```

## Funções de Manipulação de Listas

### `ultimo`

Retorna o último elemento de uma lista.

```haskell
ultimo :: [t] -> t
```

### `maiores_que`

Retorna os elementos de uma lista que são maiores que um valor de referência.

```haskell
maiores_que :: (Ord t) => t -> [t] -> [t]
```

### `removerUltimo`

Remove o último elemento de uma lista.

```haskell
removerUltimo :: [t] -> [t]
```

### `maiores`

Recebe um número natural `n` e uma lista, retornando uma lista com os `n` maiores elementos, mantendo a ordem original desses elementos.

```haskell
maiores :: (Ord t) => Int -> [t] -> [t]
```

## Funções Matemáticas e Estatísticas

### `mediana`

Calcula a mediana de uma lista de números racionais.

```haskell
mediana :: [Float] -> Float
```

### `divide`

Recebe uma lista e um número natural `n`, retornando um par: (os `n` primeiros elementos, o resto da lista).

```haskell
divide :: [t] -> Int -> ([t], [t])
```

## Funções de Ordenação

### `ordena`

Ordena uma lista usando o algoritmo Insertion Sort.

```haskell
ordena :: (Ord t) => [t] -> [t]
```

### `bolha`

Ordena uma lista usando o método da bolha (Bubble Sort).

```haskell
bolha :: (Ord t) => [t] -> [t]
```

## Funções de Análise de Palíndromos

### `palindromo`

Verifica se uma lista (string, número ou qualquer lista) é um palíndromo.

```haskell
palindromo :: Eq t => [t] -> Bool
```

## Função de Pesquisa de Maior Elemento

### `maior_elemento`

Retorna o maior elemento de uma lista não vazia.

```haskell
maior_elemento :: (Ord t) => [t] -> t
```

---

## Como Rodar o Projeto

Para rodar este código, basta ter o GHC (Glasgow Haskell Compiler) instalado em sua máquina. Você pode compilar e rodar o programa com os seguintes comandos no terminal:

1. Para compilar o código, use:

```bash
ghc -o main Main.hs
```

2. Para executar o programa compilado, use:

```bash
./main
```

Se você deseja apenas testar as funções individualmente no GHCi (interpretador interativo do Haskell), basta rodar o seguinte comando:

```bash
ghci Main.hs
```

Isso carregará o código no GHCi, e você poderá testar as funções interativamente.

---

