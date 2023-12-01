const Connection = require('tedious').connection

const config = {
    server: '',
    authentication;
}

const connection = new Connection(config);

connection.connect();