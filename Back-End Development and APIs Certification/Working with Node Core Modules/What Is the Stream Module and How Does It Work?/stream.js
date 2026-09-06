const fs = require('fs')
const path = require('path')

const inputFilePath = path.join(__dirname, 'input.txt')
const outputFilePath = path.join(__dirname, 'output.txt')

// Readable stream
const readInputFileStream = fs.createReadStream(inputFilePath)

readInputFileStream.on('data', (chunk) => {
  console.log(`Received ${chunk.length} bytes of data`)
  console.log('Received data:', chunk)
})

// Create the write stream
const writeOutputFileStream = fs.createWriteStream(outputFilePath)

readInputFileStream.pipe(writeOutputFileStream)

writeOutputFileStream.on('finish', () => {
  console.log('All data has been written to the file')
})

writeOutputFileStream.on('error', (err) => {
  console.error('Error writing to file:', err)
})
