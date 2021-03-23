import prisma from '../../lib/prisma';

const findUserByEmail = async (email) => {
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