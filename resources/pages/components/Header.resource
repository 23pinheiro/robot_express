*** Settings ***
Documentation     Ações e elementos do compo
Library           Browser
Library           String



*** Keywords ***
User should be logged in 
  [Arguments]            ${name}
  #Importando a biblioteca String, para quebrar o que sera criado dentro da massa de teste, neste caso de Fernando Papito, para apenas Fernando. 
  @{splited_name}     Split String     ${name}
  Log To Console       @{splited_name}  
  ${element}        Set Variable          css=header .right small

  Wait For Elements State    ${element}      visible         5 
  
  Get Text    ${element}     equal     Olá, ${splited_name}[0]

Go to task form 
  Click      css=.button-add