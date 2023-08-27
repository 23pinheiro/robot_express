from robot.api.deco   import keyword
from pymongo import MongoClient
#Abre a conexão
client= MongoClient('mongodb+srv://qa:experience@cluster0.mxhmsmu.mongodb.net/?retryWrites=true&w=majority')
#copiar a string de conexão. 
#preencher com os dados necessários 

#acessa o banco especifico 
db = client['markdb']

#a biblioteca deco ser para criar palavras chave, para chamar a função em forma de keyword, conforme abaixo. Nota, sempre iniciar por @ 
@keyword ('Remove user from database')
def remove_user(email):
  users=db['users']
  users.delete_many({'email':email})
  print('removing user by' + email)

@keyword ('Insert user from database')
def insert_user(name, email, password): 
  doc= {
    'name': name,
    'email': email,
    'password': password,
  }
  users=db['users']
  users.insert_one(doc)
  print(doc)
  
