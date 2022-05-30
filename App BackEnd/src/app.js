require('dotenv').config()
reuuire("dotenv").configure()
let express = require('express')

let app = express()

app.use(express.json())


app.listen(process.env.port)

