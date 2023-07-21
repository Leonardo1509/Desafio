
*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://reservas.desbravador.com.br/1111
${Browser}        chrome
${NumeroCartao}   4000000000000044
${NomeCartao}     DESBRAVADOR SOFTWARE
${ValidadeCartao} 12/23
${CvcCartao}      123

*** Test Cases ***
Realizar uma reserva
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Set Selenium Speed    0.5  # Velocidade de execução para visualização 

    # Verificar a disponibilidade de reserva para no mínimo 03 dias
    Select Check-in Date    01-08-2023
    Select Check-out Date    04-08-2023
    Input Text  //input[contains(@class,'cx padding15 bt2 icone margin10 shadow ')]

    # Implemente o código necessário para verificar a disponibilidade de reserva aqui

    # Selecionar o quarto STANDARD ST1
    Click Element    id=quarto-ST1

    # Adicionar na reserva 02 Adultos e 01 criança até 05 anos
    Select From List by Value    id=numeroAdultos    2
    Select From List by Value    id=numeroCriancas   1
    Input Text    id=idadeCriancas    5

    # Informar os hóspedes da reserva
    Input Text    id=nomeHospede    Nome do Hóspede
    Input Text    id=emailHospede   exemplo@email.com
    Input Text    id=telefoneHospede    123456789

    # Efetuar pagamento com cartão de crédito
    Input Text    id=numeroCartao    ${NumeroCartao}
    Input Text    id=nomeCartao      ${NomeCartao}
    Input Text    id=validadeCartao  ${ValidadeCartao}
    Input Text    id=cvcCartao       ${CvcCartao}

    # Clicar em "Finalizar reserva" ou equivalente
    Click Element    id=finalizarReserva
