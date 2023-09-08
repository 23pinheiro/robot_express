*** Settings *** 
Documentation    Cenários de cadastro de tarefas
Resource         ../../resources/base.resource
Library          JSONLibrary
Test Setup         Start Session
Test Teardown      Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa 
  ${data}    Get Fixture          tasks        create
  Clean user from database        ${data}[user][email] 
  Remove user from database       ${data}[user][email]  
  Insert user from database       ${data}[user]
  Submit login form               ${data}[user]
  User should be logged in        ${data}[user][name]
  Go to task form 
  Submit task form                ${data}[tasks]       

  Log      ${data}