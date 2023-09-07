*** Settings *** 
Documentation    Cenários de cadastro de tarefas
Resource         ../../resources/base.resource
Library          JSONLibrary

*** Test Cases ***
Deve poder cadastrar uma nova tarefa 
  ${data}    Get Fixture     tasks    create
  
  Log      ${data}