*** Settings *** 

Documentation      Cenários de tentaiva de cadastro com senha curta 
Test Setup         Start Session
Test Teardown      Take Screenshot
Resource           ../resources/base.resource

Test Template        Short password 

*** Keywords *** 
Short password 
  [Arguments]    ${short_pass}
  ${user}        Create Dictionary
  ...              name=Fernando Papito
  ...              email=fernando.papito@msn.com.br
  ...              password=${short_pass}
  Go to signup page    
  Submit signup form          ${user} 
  Alert should be          Informe uma senha com pelo menos 6 digito

# *** Test Cases ***        
# Nao deve cadastrar senha com 1 digito

# Nao deve cadastrar senha com 2 digitos

# Nao deve cadastrar senha com 3 digitos

# Nao deve cadastrar senha com 4 digitos

# Nao deve cadastrar senha com 5 digitos

# Nao deve cadastrar senha com 1 digito
#   [Tags]            short_pass
#   [Template]
#   Short password       1

# Nao deve cadastrar senha com 2 digitos
#   [Tags]        short_pass
#   [Template]
#   Short password       12

# Nao deve cadastrar senha com 3 digitos
#   [Tags]        short_pass
#   [Template]
#   Short password       123
# Nao deve cadastrar senha com 4 digitos
#   [Tags]        short_pass
#   [Template]
#   Short password      1234

# Nao deve cadastrar senha com 5 digitos
#   [Tags]        short_pass
#   [Template]
#   Short password   1234