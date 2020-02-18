Dado("que usuário possa acessar a tela de pesquisa") do
  visit "https://www.voegol.com.br/pt"

  @data_ida = Date.today.succ.strftime("%d-%m-%Y")
  @data_volta = Date.today.succ.next_month(2).strftime("%d-%m-%Y")

  def busca_ida
    # Select Origem
    find(".division-input-origin").click
    find("input[name=header-chosen-origin]").set "SDU"
    find(".active-result").click

    # Select Destino
    find(".chosen-placeholder-destiny").click
    find("input[name=header-chosen-destiny]").set "GRU"
    find(".active-result").click

    # A data atual já esta selecionada,
    # caso deseje inserir outra data, apague a atual.

    # Select data atual+1
    find("#datepickerGo").send_keys [:control, "a"], :space #limpa o campo
    find("#datepickerGo").send_keys @data_ida, :enter
  end

  def passageiros
    #Selecionando passageiros
    find("#number-adults").send_keys [:control, "a"], :space #limpa o campo
    find("#number-adults").send_keys("2", :enter)
  end
end

Quando("preenche os campos para Busca") do
  puts busca_ida

  # Select volta definida
  find("#datepickerBack").send_keys [:control, "a"], :space #limpa o campo
  find("#datepickerBack").send_keys("15082020", :enter)

  puts passageiros
end

Quando("preenche os campos com volta prevista em dois meses") do
  puts busca_ida
  # Select volta definida para 2 meses a partir da ida
  find("#datepickerBack").send_keys [:control, "a"], :space #limpa o campo
  find("#datepickerBack").send_keys(@data_volta, :enter)
  puts passageiros
end

Quando("clicar em Compre Aqui") do
  click_button "Compre aqui"
end

Quando("escolhe passagem de ida mais barata do dia de volta mais barata do dia") do
  click_button "COMPRAR"
end

Então("é retornado a lista com passagem para o periodo") do
  expect(page).to have_content "Agora as nossas tarifas incluem o valor da taxa de embarque."
end
