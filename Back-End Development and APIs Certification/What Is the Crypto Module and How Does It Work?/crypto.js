//https://www.freecodecamp.org/learn/back-end-development-and-apis-v9/lecture-working-with-node-core-modules/what-is-the-crypto-module-and-how-does-it-work

const crypto = require('crypto')

const hashedPassword = crypto
  .createHash('sha256')
  .update('myStrongPassword')
  .digest('hex')

console.log('createHash result:', hashedPassword)
//createHash result: f92c9cfa0ead1bcec05ca75888a4074ba994ad237e5e2a8c7cc6a620378c061d

const hashedMessage = crypto
  .createHmac('sha256', 'secretkey')
  .update('important-secret-message')
  .digest('hex')

console.log('createHmac result:', hashedMessage)
//createHmac result: da48d6f026b6036286b1fb872c63264130d5cc4271f3a213bb6ddca5a023e77e

// A key must match the algorithm length. Here AES-256 is 32 bytes
const key = Buffer.from('12345678901234567890123456789012')
console.log('key:', key)
console.log('key hex:', key.toString('hex'))

// 字符	十进制ASCII	十六进制
// 0	48	0x30
// 1	49	0x31
// 2	50	0x32
// 3	51	0x33
// 4	52	0x34
// 5	53	0x35
// 6	54	0x36
// 7	55	0x37
// 8	56	0x38
// 9	57	0x39

// A fixed IV, 16 bytes for AES
const iv = Buffer.from('1234567890123456')

const cipher = crypto.createCipheriv('aes-256-cbc', key, iv)

let encrypted = cipher.update('Hello campers!', 'utf8', 'hex')
encrypted += cipher.final('hex')

console.log('Encrypted data:', encrypted)
// Encrypted data: 4ee93aa398ab44e3540e4a67ca96bc8c

// Decrypt the "Hello campers!" message
const decipher = crypto.createDecipheriv('aes-256-cbc', key, iv)
let decrypted = decipher.update(encrypted, 'hex', 'utf8')
decrypted += decipher.final('utf8')

console.log('Decrypted data:', decrypted)
// Decrypted data: Hello campers!

const secret = crypto.createSecretKey(crypto.randomBytes(32))
console.log(secret) // SecretKeyObject [KeyObject] { [Symbol(kKeyType)]: 'secret' }

console.log(secret.export().toString('hex'))
