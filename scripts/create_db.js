var mysql = require('mysql');
var dbconfig = require('../config/database.js');

var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE DATABASE ' + dbconfig.database);

connection.query('\
CREATE TABLE IF NOT EXISTS`' + dbconfig.database + '`.`' + dbconfig.users_table + '` ( \
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT, \
    `username` VARCHAR(20) NOT NULL, \
    `password` CHAR(60) NOT NULL, \
    `user_first_name` VARCHAR(255) NOT NULL, \
    `user_last_name` VARCHAR(255) NOT NULL, \
    `user_number` INT(15) NOT NULL, \
    `user_email` VARCHAR(255) NOT NULL, \
        PRIMARY KEY (`id`), \
    UNIQUE INDEX `id_UNIQUE` (`id` ASC), \
    UNIQUE INDEX `username_UNIQUE` (`username` ASC) \
)');

connection.query('\
CREATE TABLE IF NOT EXISTS`' + dbconfig.database + '`.`' + dbconfig.orders_table + '` (\
    `id` NOT NULL AUTO_INCREMENT, \
    `username` VARCHAR(20), \
    `quantity` INT, \
    `price` INT, \
    `shirt_type` VARCHAR(255), \
    `color` VARCHAR(255) NOT NULL, \
    `notes` VARCHAR(500) NOT NULL, \
    `size` VARCHAR(100), \
    `status` VARCHAR(150), \
     PRIMARY KEY (id), \
)');

connection.query('\
CREATE TABLE IF NOT EXISTS`' + dbconfig.database + '`.`' + dbconfig.inventory_table + '` (\
    `id` NOT NULL AUTO_INCREMENT, \
    `type_of_shirt` VARCHAR(255), \
    `size` VARCHAR(255), \
    `color` VARCHAR(255), \
    `material` VARCHAR(255), \
    `quantity` INT NOT NULL, \
    `cost` INT NOT NULL, \
    `price` INT, \
     PRIMARY KEY (id), \
)');

console.log('Success: Database Created!');

connection.end();
