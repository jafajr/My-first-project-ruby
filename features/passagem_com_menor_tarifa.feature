#language: pt

Funcionalidade: Passagem com menor tarifa
    Selecionar menor tarifa do dia 
    dentro do perdiodo de 2 meses


    Contexto: possibilidade de realizar consulta de passagens
        Dado que usuário possa acessar a tela de pesquisa

   
     Cenario: Buscar passagem volta definida
        Quando preenche os campos para Busca
        E clicar em Compre Aqui
        Então é retornado a lista com passagem para o periodo

        #Exemplos:
        # | origem | destino | ida         | volta        | pessoas |
        # | SDU    | GRU     | 19/02/2020  | 15/08/2010   | 2       |
    @testes
    Cenario: Buscar passagem volta em dois meses
        Quando preenche os campos com volta prevista em dois meses
        E clicar em Compre Aqui
        Então é retornado a lista com passagem para o periodo

        #Exemplos:
        # | origem | destino | ida         | volta        | pessoas |
        # | SDU    | GRU     | 19/02/2020  | 19/04/2010   | 2       |

        