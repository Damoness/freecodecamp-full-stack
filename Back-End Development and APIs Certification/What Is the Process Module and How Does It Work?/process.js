// Gets all environment variables available to the current Node.js process
console.log(process.env)

// Gets the current Node.js environment mode (like 'development' or 'production')
console.log(process.env.NODE_ENV) // development

// Gets the path of the shell program running the Node.js process
console.log(process.env.SHELL) // /bin/bash

// Gets the system PATH variable where executables are searched for
console.log(process.env.PATH) // /usr/local/bin:/usr/bin:/bin

// Gets the present working directory from where the process was started
console.log(process.env.PWD) //

// Gets the username of the user running the current process
console.log(process.env.USER) //

console.log(process.argv)

process.on('exit', (code) => {
  console.log(`Process exiting with code: ${code}`)
})

process.on('uncaughtException', (err) => {
  console.error('Uncaught error:', err.message)
})

process.on('warning', (warning) => {
  console.warn('Warning name:', warning.name)
  console.warn('Warning message:', warning.message)
})

process.emitWarning('This is a custom warning message', 'CustomWarning')
