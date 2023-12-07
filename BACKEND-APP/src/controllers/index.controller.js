const { response } = require('express');
const {Pool} = require('pg'); //Requerimos (pool) del modulo pg

const pool = new Pool ({
    host: 'localhost',
    user: 'postgres',
    password: '12345',
    database: 'snap_pos',
    port: '5432'
});
 
const getUsers = async(req, res) => {
    const response = await pool.query('SELECT * FROM snap_pos.acceso');
    res.status(200).json(response.rows)
};

const getUserById = async(req,res) => {
    const id = req.params.id;
    const response = await pool.query('SELECT * FROM users WHERE id = $1 ', [id])
    res.json(response.rows);
};

const updateUser = async (req,res) =>{
    const id = req.params.id;
    const {name,email} = req.body;
    pool.query('UPDATE users SET name=$1, email=$2 where id=$3',[
        name,
        email,
        id
    ]);

    console.log(response);
    res.json('User Updated succesfully');
};

const deleteUser = async(req,res) => {
    const id = req.params.id
    const response = await pool.query('DELETE FROM users WHERE id = $1',[id])
    console.log(response);
    res.json(`User ${id} deleted succesfully`); // Comilla simple de JS tilde invertida (`)

};

const createUser = async (req,res) =>{
    //console.log(req.body);    //req.body son los datos que recibe del cliente
    const {name, email} = req.body;

    const response = await pool.query('INSERT INTO users (name, email) values ($1,$2)',[name,email]);
    console.log(response)
    res.json({
        message:'User Added Succesfully',
        body:{
            user:{name,email}
        }
    });
    console.log(response);
};


module.exports = {      //Se ingresa lo que deseamos exportar
    getUsers,
    getUserById,
    updateUser,
    deleteUser,
    createUser
} 