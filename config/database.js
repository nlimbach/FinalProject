module.exports = {
    'connection': {
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'port':'3306'
    },
    'database': 'screen_printer',
    'users_table': 'users',
    'orders_table': 'finalprojectorders',
    'inventory_table': 'inventory',

};
//--------------------------------
//--------------------------------
// var mysql = require('mysql');
// var connection;
//
// if(process.env.JAWSDB_URL){
//     connection = mysql.createConnection(process.env.JAWSDB_URL)
// } else{
//     connection = mysql.createConnection({
//         'host': 'localhost',
//         'user': 'root',
//         'password': ''
//     });
// }
//
// connection.connect();

// module.exports = connection;