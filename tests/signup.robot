*** Settings ***
Library   Browser
Library   FakerLibrary
Resource  ../resources/base.robot


*** Test Cases ***
Deve poder cadastrar um novo usuario
  #Os commentarios abaixo é para gerar name fakers.
  # ${name}        FakerLibrary.Name
  # ${email}       FakerLibrary.Free Email
  ${password}    Set Variable       pwd123
  ${name}        Set Variable       Fernando Papito
  ${email}       Set Variable       papito@hotmail.com
  
  #Keyword gerada 
  Remove user from database        ${email}
  Start Session
  Go to           http://localhost:3000/signup 
  #checkpoint  
  Wait For Elements State      css=h1     visible       5  
  Get Text                     css=h1    equal        Faça seu cadastro

  Fill Text      id=name          ${name}     
  Fill Text      id=email         ${email}
  Fill Text      id=password       ${password}

  Click          id=buttonSignup  
  
  Wait For Elements State      css=.notice p    visible       5  
  Get Text                     css=.notice p      equal       Boas vindas ao Mark85, o seu gerenciador de tarefas.


Nao deve permitir cadastros duplicado
  [Tags]            dup
  ${password}    Set Variable       pwd123
  ${name}        Set Variable       Fernando Papito
  ${email}       Set Variable       papito@hotmail.com

  Remove user from database        ${email}
  Insert user from database        ${name}          ${email}    ${password}

  Start Session
  Go to           http://localhost:3000/signup 
  #checkpoint  
  Wait For Elements State      css=h1     visible       5  
  Get Text                     css=h1    equal        Faça seu cadastro

  Fill Text      id=name          ${name}     
  Fill Text      id=email         ${email}
  Fill Text      id=password      ${password}

  Click          id=buttonSignup   
  
  Wait For Elements State      css=.notice p    visible       5  
  Get Text                     css=.notice p      equal       Oops! Já existe uma conta com o e-mail informado.
  Sleep  5


