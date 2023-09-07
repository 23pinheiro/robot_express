*** Settings *** 
Library         Browser
Library         String
Documentation   Ações da pagina de login 

*** Keywords ***
Submit login form 
  [Arguments]     ${user}  
  Fill Text       css=input[name=email]                ${user}[email]
  Fill Text       css=input[placeholder=Senha]         ${user}[password]

  Click            id=buttonLogin   



