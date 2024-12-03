# 🚀 Analisador Léxico para a Linguagem "lang" 🚀

Este projeto implementa um analisador léxico para a linguagem "lang". Ele utiliza **JFlex** para gerar o analisador a partir de especificações léxicas descritas em um arquivo `.flex`. O analisador reconhece tokens que representam operadores, identificadores, números, palavras-chave e outros elementos da linguagem.

---


## 👩🏽‍💻 **Autores**

- **Deborah Caroline Rodrigues Oliveira - 17.1.8231**    

- **Thuane de Souza Espírito Santo - 17.1.8255**  

---


## 📋 **Visão Geral**

O analisador léxico é a primeira etapa de um compilador ou interpretador. Ele lê a entrada como um fluxo de caracteres e a converte em um fluxo de tokens, cada um com um tipo específico, linha e coluna. 

### Características principais:
- **Reconhecimento de tokens:** palavras-chave, identificadores, números, operadores e símbolos.
- **Tratamento de espaços em branco e comentários.**
- **Gerenciamento de erros:** identifica caracteres ilegais.
- **Suporte a literais e arrays.**

---

## 🛠️ **Arquivos no Projeto**

### **1. `calc.flex`**
- Arquivo de especificação léxica usado pelo **JFlex**.
- Define:
  - **Regras para tokens:** palavras-chave, identificadores, números, operadores e literais.
  - **Estados:** Por exemplo, o estado `ARR` para leitura de arrays.
  - **Função `nextToken`:** Retorna objetos `Token` representando os elementos lexicais reconhecidos.

### **2. `Main.java`**
- Ponto de entrada do programa.
- Lê o arquivo fonte da linguagem "lang" fornecido como argumento e processa os tokens.
- Mostra uma mensagem de ajuda caso o nome do arquivo não seja especificado corretamente.
- Realiza tratamento de exceções para erros na leitura do arquivo.

### **3. `Token.java`**
- Representa os tokens identificados pelo analisador.
- Contém:
  - Tipo do token (enum `TK`).
  - Linha e coluna no arquivo fonte.
  - Valor associado (opcional), como o valor numérico de um literal.

### **4. `TK.java`**
- Enumeração que define todos os tipos de tokens reconhecidos (como `MAIN`, `IF`, `PLUS`, `INT`).

### **5. `makefile`**
- Automatiza:
  - Geração do analisador com **JFlex**.
  - Compilação dos arquivos Java.
  - Limpeza dos arquivos temporários.

---

## 🎯 **Funcionalidades**

1. **Identificação de Tokens**
   - Palavras-chave como `main`, `print`, `if`, `else`, etc.
   - Literais inteiros, float e caracteres.
   - Operadores e símbolos: `+`, `-`, `*`, `(`, `)`, `{`, `}`, etc.
   - Identificadores e tipos.
   - Arrays.

2. **Erros Léxicos**
   - Identifica e sinaliza caracteres inválidos na entrada.

3. **Gerenciamento de Arrays**
   - Reconhece arrays no formato `[n1, n2, ..., nn]`.

---

## 🚀 **Como Executar**

### Pré-requisitos
- **Java** instalado.
- **JFlex** configurado no sistema.

### Passos

1. **Compilar o código Java:**
   ```bash
   make 
   ```

3. **Executar o analisador:**
   ```bash
   java Main <arquivo_de_teste>
   ```

   Substitua `<arquivo_de_teste>` pelo caminho do arquivo fonte em "lang" a ser analisado.

4. **Limpar os arquivos temporários:**
   ```bash
   make clean
   ```

---

## 🔍 **Exemplo de Uso**

### Entrada
```lang
main {
  print("Hello, World!");
  if (true) {
    return 42;
  }
}
```

### Saída
```plaintext
(1,0) TK: MAIN
(1,5) TK: LBRACE
(2,2) TK: PRINT  val: "Hello, World!"
(3,2) TK: IF
(3,5) TK: TRUE
(3,10) TK: LBRACE
(4,4) TK: RETURN val: 42
(4,11) TK: PV
(5,2) TK: RBRACE
(6,0) TK: RBRACE
```

---

## 🧪 **Testes**

1. **Arquivo de exemplo:**
   Crie um arquivo chamado `exemplo.lang` com o seguinte conteúdo:
   ```lang
   main {
       print("Teste");
       return 5 + 3;
   }
   ```

2. **Comando:**
   ```bash
   java Main exemplo.lang
   ```

3. **Saída esperada:**
   ```
   (1,0) TK: MAIN
   (1,5) TK: LBRACE
   (2,2) TK: PRINT val: "Teste"
   (3,2) TK: RETURN
   (3,9) TK: INT val: 5
   (3,11) TK: PLUS
   (3,13) TK: INT val: 3
   (3,14) TK: PV
   (4,0) TK: RBRACE
   ```

---

## 📚 **Estrutura dos Tokens**

Cada token possui as seguintes informações:
- **Tipo:** Indicado pelo enum `TK`.
- **Linha e Coluna:** Localização no arquivo fonte.
- **Valor:** Opcional, presente em literais e identificadores.

---
