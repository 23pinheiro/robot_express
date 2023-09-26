*** Settings *** 
Documentation    Cenários de teste de atualização de tarefa
Resource             ../../resources/base.resource
Library              JSONLibrary
Test Setup         Start Session
Test Teardown      Take Screenshot

*** Test Cases ***
Deve poder marcar uma tarefa como concluida

  ${data}    Get Fixture              tasks     done
  Clean user from database        ${data}[user][email] 
  Insert user from database       ${data}[user]

  Post a user session             ${data}[user] 
  Post a new task                 ${data}[tasks]    
  
  Submit login form               ${data}[user]
  User should be logged in        ${data}[user][name]
  Mark task as completed          ${data}[tasks][name]    
  # Task should be complete         ${data}[tasks][name]  
