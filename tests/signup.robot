*** Settings ***
Library   Browser
Library   FakerLibrary
Resource  ../resources/base.resource

Test Setup     Start Session
Test Teardown  Take Screenshot

*** Test Cases ***
Deve poder cadastrar um novo usuario
  #Os commentarios abaixo é para gerar nomes fakes.
  # ${name}        FakerLibrary.Name
  # ${email}       FakerLibrary.Free Email

  # Esta é uma forma individual de criar as variaveis, utilizadas nos inicio da automação 
  # ${password}    Set Variable       pwd123
  # ${name}        Set Variable       Fernando Papito
  # ${email}       Set Variable       papito@hotmail.com
  
  #A melhor forma pra melhor organizazação é criar dicionarios conforme abaixo 
  ${user}    Create Dictionary      
  ...            password=pwd123   
  ...            name=Fernando Papito
  ...            email=papito@hotmail.com
  #Keyword gerada 
  Remove user from database        ${user}[email]

  Go to signup page       
  Submit signup form                ${user}
  Notice Should be                  Boas vindas ao Mark85, o seu gerenciador de tarefas.

Nao deve permitir cadastros duplicado
  [Tags]            dup

  # Forma preliminar 
  # ${password}    Set Variable       pwd123
  # ${name}        Set Variable       Fernando Papito
  # ${email}       Set Variable       papito@hotmail.com

# Implantando a nova forma com dicionario 
  ${user}    Create Dictionary      
  ...        password=pwd123   
  ...        name=Fernando Papito
  ...        email=papito@hotmail.com


#forma antiga de se conectar
  # Remove user from database        ${email}
  # Insert user from database        ${name}          ${email}    ${password}
  #Nova forma passar os parametros
  Remove user from database        ${user}[email]
  Insert user from database        ${user}
 
  Go to signup page      
  Submit signup form        ${user}
  Notice should be        Oops! Já existe uma conta com o e-mail informado.
  #Sempre recomendado usar css selector    (abaixo esta antes do page object)
  # Fill Text      css=input[name="name"]            ${user}[name]     
  # Fill Text      css=input[name=email]             ${user}[email]
  # Fill Text      css=input[name=password]           ${user}[password]

  # Click          css=button[type=submit] >> text=Cadastrar  
  
  # Wait For Elements State      css=.notice p    visible       5  
  # Get Text                     css=.notice p      equal       Oops! Já existe uma conta com o e-mail informado.
 

Campos obrigatorios 
  ${user}        Create Dictionary
  ...              name=${EMPTY}
  ...              email=${EMPTY}
  ...              password=${EMPTY}
  Go to signup page    
  Submit signup form      ${user} 

  Alert should be           Informe seu nome completo
  Alert should be          Informe seu e-email
  Alert should be          Informe uma senha com pelo menos 6 digitos

Não deve cadastrar um email incorreto 
  [Tags]    inv_email
  ${user}    Create Dictionary
  ...        name=Charles Xaiver
  ...        email=xavier.com.br
  ...        password=123456 
  
  Go to signup page
  Submit signup form     ${user} 
  Alert Should be        Digite um e-mail válido
# Exemplo de como testar com o
Não deve cadastrar senha curta 
  [Tags]            short_pass
  @{password_list}   Create List  1    12     123     1234    12345
  FOR    ${password}    IN    @{password_list}
    ${user}        Create Dictionary
    ...              name=Fernando Papito
    ...              email=fernando.papito@msn.com.br
    ...              password=${password}
    Go to signup page    
    Submit signup form          ${user} 
    Alert should be          Informe uma senha com pelo menos 6 digito    
    # Log To Console   ${password}
      
  END
