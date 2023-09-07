*** Settings *** 
Library     Browser
Library     libs/database.py
Library     JSONLibrary
Resource    env.resource
Resource    pages/SignupPage.resource
Resource    pages/LoginPage.resource
Resource    pages/components/Notice.resource
Resource    pages/components/Alert.resource
Resource    pages/components/Header.resource



*** Keywords *** 

Start Session 
  New Browser         browser=chromium  headless=false
  New Page            ${BASE_URL}

Short password 
  [Arguments]    ${short_pass}
  ${user}        Create Dictionary
  ...              name=Fernando Papito
  ...              email=fernando.papito@msn.com.br
  ...              password=${short_pass}
  Go to signup page    
  Submit signup form          ${user} 
  Alert should be          Informe uma senha com pelo menos 6 digito

#Helpers 

Get Fixture
#Uma nova forma de estruturar sem utilizar a criação de dicionario 

  [Arguments]           ${file_name}            ${scenario} 
  ${data}     Load Json from file    
  ...    ../../Resources/fixtures/${file_name}.json
  ...    encoding=utf-8
  
  [Return]        ${data}[${scenario}]
  Log               ${data}[create][user]  