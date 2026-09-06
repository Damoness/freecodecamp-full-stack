const express = require('express')
const app = express()
const port = 3000

// Importing the user routes
const userRoutes = require('./userRoutes')

// Using the userRoutes router for /users path
app.use('/users', userRoutes)

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`)
})
