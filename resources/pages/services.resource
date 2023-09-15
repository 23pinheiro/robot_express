*** Settings *** 
Library         RequestsLibrary
Documentation   Consumindo a API Rest do Sistema

*** Keywords *** 

Post a user session    
  [Arguments]        ${user}
  ${payload}    Create Dictionary
  ...         email=${user}[email]
  ...         password=${user}[password]
    
  ${resp}     Post         
  ...          url=http://localhost:3333/sessions
  ...          json=${payload}
  ...          expected_status=200
  ${token}     Set Variable     ${resp.json()}[token]
  Log         ${token} 
  Set Test Variable    ${token} 
  
  
Post a new task     
  [Arguments]        ${payload}
  ${headers}   Create dictionary
  ...        Authorization=${token} 

  Post         url=http://localhost:3333/tasks
  ...         json=${payload}
  ...         expected_status=201
  ...         headers=${headers}  
