const path = require('path')

console.log(__filename) // is the absolute path of the current file

console.log(__dirname) // is the absolute path of the directory containing the current file.

console.log(path.basename(__filename)) //The basename() method shows the last part of the file, that is, the filename

console.log(path.dirname(__dirname)) // dirname() returns the directory name of a path

console.log(path.extname(__filename)) // extname() returns the extension of the current file

const wrongPath = path.join('/src//', 'assets', 'text-files')
console.log(wrongPath) // /src/assets/text-files

const absolutePath = path.resolve('assets', 'src', 'text-files')
console.log(absolutePath)

// parse() takes a directory or file and returns an object that contains the breakdown of its parts, such as the system root, its directory, extension, and the filename
const parsedFile = path.parse(__filename)

console.log(parsedFile)

// format(), on the other hand, builds a path from an object containing directory, name, and extension
const formattedDirectory = path.format({
  dir: '/users/johndoe/docs',
  name: 'file',
  ext: '.txt'
})

console.log(formattedDirectory) // /users/johndoe/docs/file.txt
