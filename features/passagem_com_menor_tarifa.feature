#language: pt

Funcionalidade: Passagem com menor tarifa
    Selecionar menor tarifa do dia 
    dentro do perdiodo de 2 meses

    Cenario: Buscar passagem volta definida
        Dado que é acessado a pagina de pesquisa
        Quando preenche os campos para Buscar 
        E clicar em Compre Aqui
        Então é retornado a lista com passagem para o periodo

        # Exemplos:
        # | origem | destino | ida         | volta        | pessoas |
        # | SDU    | GRU     | 15/02/2020  | 16/04/2010   | 2       |
        
         