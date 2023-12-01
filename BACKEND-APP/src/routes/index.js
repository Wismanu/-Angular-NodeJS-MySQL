const { Router } = require('express');
const router = Router();

const { getUsers, createUser, getUserById, deleteUser, updateUser } = require('../controllers/index.controller');

router.get('/users', getUsers);
router.get('/users/:id', getUserById);
router.put('/users/:id',updateUser);
router.delete('/users/:id',deleteUser);
router.post('/users', createUser);                 //no improta que tengan el mismo nombre ya que trabajan con metodos HTTP distintos
  

module.exports = router;