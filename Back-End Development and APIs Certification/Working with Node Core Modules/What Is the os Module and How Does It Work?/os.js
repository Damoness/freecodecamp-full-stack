const os = require('os')
console.log(os.platform()) // darwin

console.log(os.arch()) // arm64

console.log(os.type()) // Darwin

console.log(os.release()) // 25.6.0

console.log(os.version()) // Darwin Kernel Version 25.6.0: Fri Jul 31 19:11:03 PDT 2026; root:xnu-12377.161.14~5/RELEASE_ARM64_T8132

console.log(os.cpus())

//uptime() shows the time since the system was booted up. It can help determine how long servers have been running:
console.log(os.uptime())

console.log(os.totalmem()) // show the total amount of system memory in bytes
console.log(os.freemem()) // show the free system memory in bytes

console.log(os.userInfo()) // returns an object containing information about the current system user

console.log(os.networkInterfaces()) // returns an object containing only network interfaces that have been assigned a network address.
