*** Settings ***
Resource   ../resources/base.robot

*** Test Cases ***
Webapp deve estar online
  Start Session
  Get Title       equal   23Pinheiro by QAx