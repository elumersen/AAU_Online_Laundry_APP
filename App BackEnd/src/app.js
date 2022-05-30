require('dotenv').config()
let express = require('express')
let conncet =require('./config/db')
let userRoute = require('./routes/user')
let orderRoute = require('./routes/order')
let errorHandler= require('./middlewares/errorHandler')


let app = express()
conncet(app)
app.use(express.json())
app.use('/user',userRoute)
app.use('/order',orderRoute)
app.use(errorHandler)