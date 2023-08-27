*** Settings *** 
Library     Browser
Library     libs/database.py


*** Keywords *** 

Start Session 
  New Browser         browser=chromium  headless=false
  New Page            http://localhost:3000 