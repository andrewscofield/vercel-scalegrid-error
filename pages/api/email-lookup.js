import prisma from '../../lib/prisma';

const findUserByEmail = async (email) => {

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

  const user = await prisma.user.findUnique({
    where: {
      email: email,
    },
    include: {
      profile: true
    }
  });

  return user;
}

export default (req, res) => {
  if (req.method === 'POST') {
    const {email} = req.body;
    
    try {
      const user = findUserByEmail(email).then((results) => {
        if(results) {
          res.json({success: true})
        }
        else {
          res.status(401).send({success: false, error: 'no user found'});
        }  
      });
    }
    catch (error) {
      res.status(401).send({success: false, error: error.message});
    }
  }
  else {
    res.status(404).send('not found');
  }
}