Dado("que é acessado a pagina de pesquisa") do
  visit "https://www.voegol.com.br/pt"
end

Quando("preenche os campos para Buscar") do
  def tomorrow
    ::Date.current.tomorrow
  end

  # Select Origem
  find(".division-input-origin").click
  find("input[name=header-chosen-origin]").set "SDU"
  find(".active-result").click

  # Select Destino

  find(".chosen-placeholder-destiny").click
  find("input[name=header-chosen-destiny]").set "GRU"
  find(".active-result").click

  # Preencha a data de ida com as barras, no formato
  # DDMMAAAA, depois pressione ENTER.
  # A data atual já esta selecionada,
  # caso deseje inserir outra data, apague a atual.

  # Select data atual+1

  data_ida = Date.today.strftime("%d-%m-%Y")

  find("#datepickerGo").send_keys [:control, "a"], :space #limpa o campo
  find("#datepickerGo").send_keys data_ida, :enter
  sleep 5

  # Select volta definida
  find("#datepickerBack").send_keys [:control, "a"], :space #limpa o campo
  find("#datepickerBack").send_keys("15082020", :enter)

  #Selecionando passageiros
  find("#number-adults").send_keys [:control, "a"], :space #limpa o campo
  find("#number-adults").send_keys("2", :enter)
end

Quando("clicar em Compre Aqui") do
  click_button "Compre aqui"
  sleep 6
end

Então("é retornado a lista com passagem para o periodo") do
  expect(page).to have_content "Agora as nossas tarifas incluem o valor da taxa de embarque."
  sleep 5
end
