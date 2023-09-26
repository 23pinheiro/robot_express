*** Settings *** 
Documentation    Cenários de cadastro de tarefas
Resource             ../../resources/base.resource
Resource            ../../resources/pages/components/TasksPage.resource
Library              JSONLibrary
Test Setup             Start Session
Test Teardown          Take Screenshot

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
  #Verificacao se a tarefa foi realizada com sucesso. 
  Task should be registered       ${data}[tasks][name]
  Log      ${data}

Não deve cadastrar tarefa com nome duplicada
  [Tags]      dup 
#Utilizando o novo dado de json com dados duplicados
  ${data}    Get Fixture          tasks            duplicate 
  Clean user from database        ${data}[user][email] 
  Insert user from database       ${data}[user]

  Post a user session             ${data}[user] 
  Post a new task                 ${data}[task]                       

  Submit login form               ${data}[user]
  User should be logged in        ${data}[user][name]

  Go to task form 
  Submit task form                ${data}[task]     

  Notice Should be                Oops! Tarefa duplicada.

Não deve cadastrar tarefa que atinge o limite de tags
  [Tags]      dup 
#Utilizando o novo dado de json com dados duplicados
  ${data}    Get Fixture          tasks            tags_limit
  Clean user from database        ${data}[user][email] 
  Insert user from database       ${data}[user]

  Submit login form               ${data}[user]
  User should be logged in        ${data}[user][name]

  Go to task form 
  Submit task form                ${data}[tasks]     

  Notice Should be                Oops! Limite de tags atingido.
