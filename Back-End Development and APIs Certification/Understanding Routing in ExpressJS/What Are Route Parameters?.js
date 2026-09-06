const express = require('express')
const app = express()
const port = 3000

// Route with a parameter in the path
app.get('/post/:postId', (req, res) => {
  const postId = req.params.postId
  res.send(`Viewing post with ID: ${postId}`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
