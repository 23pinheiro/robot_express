*** Settings ***
Library   Browser
Library   FakerLibrary
Resource  ../resources/base.robot


*** Test Cases ***
Deve poder cadastrar um novo usuario
  #Os commentarios abaixo é para gerar name fakers.
  # ${name}        FakerLibrary.Name
  # ${email}       FakerLibrary.Free Email

  # Esta é uma forma individual de criar as variaveis, utilizadas nos inicio da automação 
  # ${password}    Set Variable       pwd123
  # ${name}        Set Variable       Fernando Papito
  # ${email}       Set Variable       papito@hotmail.com
  
  #a melhor forma pra melhor organizazação é criar dicionarios conforme abaixo 
  ${user}    Create Dictionary      
  ...        password=pwd123   
  ...        name=Fernando Papito
  ...        email=papito@hotmail.com


  #Keyword gerada 
  Remove user from database        ${user}[email]
  Start Session
  Go to           http://localhost:3000/signup 
  #checkpoint  
  Wait For Elements State      css=h1     visible       5  
  Get Text                     css=h1    equal        Faça seu cadastro

  Fill Text      id=name           ${user}[name]     
  Fill Text      id=email          ${user}[email]
  Fill Text      id=password       ${user}[password]

  Click          id=buttonSignup  
  
  Wait For Elements State      css=.notice p    visible       5  
  Get Text                     css=.notice p      equal       Boas vindas ao Mark85, o seu gerenciador de tarefas.


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

  Start Session
  Go to           http://localhost:3000/signup 
  #checkpoint  
  Wait For Elements State      css=h1     visible       5  
  Get Text                     css=h1    equal        Faça seu cadastro

  Fill Text      id=name           ${user}[name]     
  Fill Text      id=email          ${user}[email]
  Fill Text      id=password       ${user}[password]

  Click          id=buttonSignup   
  
  Wait For Elements State      css=.notice p    visible       5  
  Get Text                     css=.notice p      equal       Oops! Já existe uma conta com o e-mail informado.
  # Sleep  5


