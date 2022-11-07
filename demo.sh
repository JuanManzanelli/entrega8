 # CRUD 


 ## Create (C)

db.coll.insertOne ({ documento })

db.coll.insertMany([
    {documento1},
    {documento2}
])


## Read (R)

db.coll.findOne({clave : valor})   # devuelve un documento

db.coll.find({
    clave:{
        $operador:valor
    }
}) # devuelve un cursor

# sort - limit - skip

#filtra
db.coll.find().sort()

#limita ej los 3 primeros 
db.coll.find().limit()

#skip omite ej saltar al primer documento
db.coll.find().skip()


#3
db.coll.find().sort({ edad: 1}).limit(1)
# devuelve el de menor edad y solo limita a mostrarnos el 1 document. 


#borrar un usuario desde el id
db.usuarios.deleteOne({id: })


use ecomerce


db.createCollection('mensajes')
db.createCollection('productos')



# 1  2 
db.mensajes.insertMany ([
    {email:"user1@gmail.com", text:"Hola Mundo", time:ISODate()},
    {email:"user2@gmail.com", text:"Mañana nos vemos", time:ISODate()},
    {email:"user1@gmail.com", text:"Que tal?", time:ISODate()},
    {email:"user3@gmail.com", text:"Como es tu nombre?", time:ISODate()},
    {email:"user2@gmail.com", text:"Gracias por tu visita!", time:ISODate()},
    {email:"user1@gmail.com", text:"Cuanto cuesta?", time:ISODate()},
    {email:"user3@gmail.com", text:"Productos en oferta", time:ISODate()},
    {email:"user1@gmail.com", text:"Cuando salen las ofertas?", time:ISODate()},
    {email:"user2@gmail.com", text:"Espero su respuesta", time:ISODate()},
    {email:"user3@gmail.com", text:"Mañana estaran disponibles?", time:ISODate()},

])

db.productos.insertMany ([
  {name:'river', price: 5000 },
  {name:'talleres', price: 3500  },
  {name:'boca', price: 4900 },
  {name:'estudiantes', price: 4500 },
  {name:'gimnasia', price: 4000 },
  {name:'belgrano', price: 3400 },
  {name:'racing', price: 4700 },
  {name:'independiente', price: 4700  },
  {name:'almagro', price: 500 },
  {name:'colon', price: 2000  },
  {name:'union', price: 1000 },
])

# 3 
db.productos.find()
db.mensajes.find()

#4 cantidad de documentos dentro de los productos
db.productos.estimatedDocumentCount()


#5 CRUD en los productos

# inse
db.productos.insertOne({name:'lanus', price:2600})


#listar productos menos a 3000
db.productos.find({'price':{$lt: 3000}})

#listar desde 100 a 2000 
db.productos.find({$and:[{'price':{$gt : 100}},{'price':{$lt: 2000}}]})

#listar mayor a 3000
db.productos.find({"price":{$gt: 3000}})

#solo traer el tercer de menor precio
db.productos.find().sort({"price":1}).limit(1).skip(2)

#actualizar stock de todos los productos 
db.productos.updateMany({},{$set:{"Stock": 100}})

#cambiar a cero el stock con el precio mayor a 4000
db.productos.updateMany({"price":{$gt:4000}},{$set:{"Stock": 0}})

#borrar productos menor a 1000 
 db.productos.deleteMany({"price":{$lt:1000} })

 #crear usuario

 use admin
    db.createUser({
        user:"pepe",
        pwd:"asd456",
        roles:[
            {role:"read",
            db:"ecommerce"}
        ]
    })

    #mongod --auth --dbpath "C:\Program Files\MongoDB\Server\6.0\data"
    entro a mongosh: mongosh -u pepe -p asd456

    
