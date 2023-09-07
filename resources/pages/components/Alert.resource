*** Settings ***
Documentation     Ações e elementos do componente de mensagem de alertas
Library           Browser

*** Keywords *** 

Alert should be      
  [Arguments]            ${expetected_text}         
  Wait For Elements State    css=.alert-error >> text=${expetected_text} 
  Wait For Elements State    css=.alert-error >> text=${expetected_text} 
  Wait For Elements State    css=.alert-error >> text=${expetected_text} 