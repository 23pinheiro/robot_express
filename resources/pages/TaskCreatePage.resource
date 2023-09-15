*** Settings ***
Documentation  Ações e elementos da pagina de cadastro de tarefas 
Library           Browser 

*** Keywords *** 


Submit task form 
  [Arguments]        ${tasks}
  Fill Text      css=input[placeholder="Nome da tarefa"]        ${tasks}[name]

  ${tags_elements}   Set Variable        css=input[name=tags] 
  FOR    ${tags}    IN    @${tasks}[tags]
    Fill Text        ${tags_elements}      ${tags}
    Sleep           1s
    Press Keys       ${tags_elements}       Enter
  END
  
  
  
  
  Click          css=button >> text=Cadastrar 
