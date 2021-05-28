import { PrismaClient } from "@prisma/client";

const fs = require('fs')
const path = '/tmp'

try {
  if (fs.existsSync(`${path}/ca.pem`)) {
    // ca file exists

    // do nothing

  } else {
    // ca file not exists

    // creates ca.pem file from ENV

    fs.mkdirSync(path, { recursive: true })
    
    fs.writeFileSync(`${path}/ca.pem`, process.env.CA_PEM)
  }
} catch(err) {
  console.error(err)
}


const prisma = new PrismaClient();
export default prisma;