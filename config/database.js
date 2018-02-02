// module.exports = {
//     'connection': {
//         'host': 'localhost',
//         'user': 'root',
//         'password': '',
//         'port':'3306',
//         'database':'screen_printer'
//     },
//     'database': 'screen_printer',
//     'users_table': 'users',
//     'orders_table': 'finalprojectorders',
//     'inventory_table': 'inventory',
//
// };
//--------------------------------
//--------------------------------
let mysql = require('mysql');
let connection;

if(process.env.JAWSDB_URL){
    connection = mysql.createConnection(process.env.JAWSDB_URL)
} else{
    connection = mysql.createConnection({
        'host': 'localhost',
        'user': 'root',
        'password': '',
        'database': 'screen_printer',
        'port':'3000',
        'users_table': 'users',
        'orders_table': 'finalprojectorders',
        'inventory_table': 'inventory'
    });
}

// connection.connect();
connection.connect(function(err) {
    if(err){
        console.log("MySQL Error");
    } else{
        console.log("Everything works fine!");
    }
});

module.exports = connection;

// module.exports = {
//     'connection': {
//         'host': 'localhost',
//         'user': 'root',
//         'password': ''
//     },
//     'database': 'screen_printer',
//     'users_table': 'users',
//     'orders_table': 'finalprojectorders',
//     'inventory_table': 'inventory',
//
// };
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
//         'password': '',
//         'database': 'screen_printer',
//         'users_table': 'users',
//         'orders_table': 'finalprojectorders',
//         'inventory_table': 'inventory'
//     })
// }
//
// connection.connect();
// module.exports = connection;


