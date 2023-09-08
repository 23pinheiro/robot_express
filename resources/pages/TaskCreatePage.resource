*** Settings ***
Documentation  Ações e elementos da pagina de cadastro de tarefas 
Library           Browser 

*** Keywords *** 


Submit task form 
  [Arguments]    ${tasks}
  Fill Text      css=input[placeholder="Nome da tarefa"]        ${tasks}[name]
  Click          css=button >> text=Cadastrar 
