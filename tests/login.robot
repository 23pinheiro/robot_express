*** Settings ***
Documentation      Cenários de autenticação do usuário 
Resource           ../resources/base.resource
Resource           ../resources/pages/LoginPage.resource
Library            Collection 
      
Test Setup         Start Session
Test Teardown      Take Screenshot

Library    Collections

*** Test Cases ***

Deve poder logar com um usuario pre-cadastrado 
  ${user}    Create dictionary
  ...         name=Fernando Papito 
  ...         email=papito@msn.com 
  ...         password=123456
  Remove user from database    ${user}[email]
  Insert user from database    ${user} 
  Submit login form            ${user}
  Sleep       2s 
  #Validando um usuario logado. 
  User should be logged in     ${user}[name]

Nao deve logar com senha invalida
  ${user}    Create dictionary
  ...         name=Steve Woz
  ...         email=woz@apple.com 
  ...         password=123456
  Remove user from database    ${user}[email]
  Insert user from database    ${user} 
  #Aqui esta sendo importada a library Collection e mudando a coleção acima afim de provar o erro com o novo usuario
  Set To Dictionary       ${user}        password=abc123
  Submit login form       ${user}
  Notice Should be        Ocorreu um erro ao fazer login, verifique suas credenciais.