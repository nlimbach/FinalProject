var mysql = require('mysql');
var dbconfig = require('../config/database');
const charge = require('../config/charge');
const dotenv = require('dotenv');
const nodemailer = require('nodemailer');

var connection = mysql.createConnection(dbconfig.connection, function(err){
    if(err)throw err;
});


connection.query('USE ' + dbconfig.database);

module.exports = function(app, passport) {




//routes to render pages
    app.get('/', function(req, res) {
        res.render('about'); // load the home page
    });

    app.get('/about', function(req,res){
        res.render('about', {
            user : req.user // get the user out of session and pass to template
        });
    });

    app.get('/forgotPassword', function(req,res){
        res.render('forgotPW');
    });

    app.get('/checkauth', function(req, res){
        res.render('checkauth', {
            user : req.user // get the user out of session and pass to template
        });
    });

    // LOGIN ===============================
    // show the login form
    app.get('/login', function(req, res) {
        // render the page, pass in user object, and pass in any flash data if it exists
        res.render('login', { user : req.user, message: req.flash('loginMessage') });
    });

    // process the login form.
    app.post('/login', passport.authenticate('local-login', {
            successRedirect : '/profile', // redirect to the secure profile section
            failureRedirect : '/login', // redirect back to the signup page if there is an error
            failureFlash : true // allow flash messages
        })
        // function(req, res) {
        //     console.log("hello");
        //
        //     if (req.body.remember) {
        //         req.session.cookie.maxAge = 30 * 24 * 60 * 60 * 1000; //cookie expires after 30 days
        //     } else {
        //         req.session.cookie.expires = false;
        //     }
        //     res.redirect('/about');
         );

    // SIGNUP
    // show the signup form
    app.get('/signup', function(req, res) {
        // render the page and pass in any flash data if it exists
        res.render('signup', { layout: 'main.handlebars', action: 'Sign up', message: req.flash('signupMessage')});
    });

    // process the signup form
    app.post('/signup', passport.authenticate('local-signup', {
        successRedirect : '/profile', // redirect to the secure profile section
        failureRedirect : '/signup', // redirect back to the signup page if there is an error
        failureFlash : true // allow flash messages
    }));

    // PROFILE AND PLACEORDER PAGES =========================
    // we will want these to be protected so you have to be logged in to visit
    // we will use route middleware to verify this (the isAuthenticated function)

    //routes to authenticate profile and placeorder pages

    //Display all purchased items in profile
    app.get('/profile', isAuthenticated, function(req, res) {
        connection.query("SELECT * FROM finalprojectorders WHERE username = ? AND status = 'purchased'",[req.user.username], function(err, data) {
            console.log(err);
            if (err) {
                return res.status(500).end();
            }

            console.log(data.RowDataPacket);
            res.render("profile", { orders : data, user: req.user });
        });
    });





//Display items in shopping cart after they are added to cart
    app.get('/placeorder', isAuthenticated, function(req, res) {
        connection.query("SELECT * FROM finalprojectorders WHERE username = ? AND status = 'cart'",[req.user.username], function(err, data) {
            console.log(err);
            if (err) {
                return res.status(500).end();
            }

            res.render("placeorder", { cartOrders : data, user: req.user });
            console.log("data that is retreived from get: " + data)
        });
    });


//delete orders from table if deleted out of shopping carts
    app.delete("/order/:id", function(req, res) {
        connection.query("DELETE FROM finalprojectorders WHERE id = ?", [req.params.id], function(err, result) {
            if (err) {
                // If an error occurred, send a generic server faliure
                return res.status(500).end();
            } else if (result.affectedRows == 0) {
                // If no rows were changed, then the ID must not exist, so 404
                return res.status(404).end();
            } else {
                res.status(200).end();
            }
        });
    });


// Initiate Charge stripe functinoality then render survey page
    app.post('/charge', (req, res, next) => {

        console.log("Stripe Data: ", req.body);
        const token = req.body.stripeToken;

        charge(token).then(data => {


        //nodemailer

            // console.log("email: " + req.body.stripeEmail);
            // var sendEmail = req.body.stripeEmail;
            //
            // var transporter = nodemailer.createTransport({
            //     service: 'gmail',
            //     auth: {
            //         user: 'screenprinterbootcamp@gmail.com',
            //         pass: 'W0rkday!'
            //     }
            // });
            // var mailOptions = {
            //     from: 'screenprinterbootcamp@gmail.com',
            //     to: sendEmail,
            //     subject: "Order Confirmation - Chuck's Tees",
            //     text: 'testing email'
            // };
            // transporter.sendMail(mailOptions, function (error, info) {
            //     if (error) {
            //         console.log(error);
            //     } else {
            //         console.log('Email sent: ' + info.response);
            //     }
            // });


            // Update Inventory table here here


            var OrderData = req.body.my_data;
            console.log("orderdata array length:" + OrderData.length)



                 for (var i = 0; i < OrderData.length; i++) {


                     var item = OrderData[i].split(',');
                     //
                     var id = item[0];
                     var size = item[1];
                     var type = item[2];
                     var color = item[3];
                     var quantityOrder = parseInt(item[4]);
                     var price = item[5];
                     var notes = item[6];
                     //
                         console.log(id + "," + size + ","+ type +  "," + color + "," + quantityOrder + "," + price + "," + notes)




                     connection.query("UPDATE inventory SET quantity = quantity - ? WHERE color = ? AND size = ? AND type_of_shirt = ?",[quantityOrder, color, size, type], function(err, data) {


                          if (err) {
                              return res.status(500).end();
                          }

                          console.log("Rows updated:" + data.changedRows);

                      })

                 }


            /// End update inventory here

            // Update orders to purchased status so they move from card to purchased orders
                connection.query("UPDATE finalprojectorders SET status = 'purchased' WHERE username = ? AND status = 'cart'",[req.user.username], function(err, data) {


                    if (err) {
                        return res.status(500).end();
                    }

                    console.log("Rows updated:" + res.changedRows);

                })

            res.render("confirmation")

        }).catch(error => {
            res.json({error: "it does not work", error});
        });

    });


    //On Survey page render react component
    app.get("/survey", isAuthenticated, function(req, res) {

            res.render("survey");
     });

    //inserts new order to order table
    app.post("/newOrder", isAuthenticated, function(req,res){
        var newUserProps = [req.body.username,req.body.size, req.body.price, req.body.shirt_type, req.body.color, req.body.quantity, req.body.notes, req.body.status];

             connection.query("INSERT INTO finalprojectorders (username,size,price,shirt_type,color,quantity,notes, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", newUserProps, function(err, data) {

            res.json(data);
        });
    });

    //UPDATE INVENTORY TO RESPOND TO ORDERS
    app.get("/newOrder", isAdmin, function(req, res){
       var quantity = [req.body.quantity];
       connection.query("INSERT INTO inventory (quantity) VALUES (?)", quantity, function(err, data){
           res.json(data);
       })
    });

    //Admin users and inventory logic
    app.get('/inventory', isAdmin, function(req, res) {
        connection.query("SELECT * FROM inventory", function(err, data) {
            console.log(err);
            if (err) {
                return res.status(500).end();
            }
            res.render("inventory", { inventory : data });
        });
    });


    app.get('/users', isAdmin, function(req,res){
       connection.query("SELECT * FROM users", function(err, data){
           if(err){
               return res.status(500).end();
           }
           res.render("users", {users: data, user: req.user})
       })
    });


    // LOGOUT ==============================
    app.get('/logout', function(req, res) {
        req.logout();
        res.redirect('/');
    });

    app.get('/adminLanding', isAdmin, function(req,res){
        res.render('AdminLanding.handlebars', {
            user: req.user
        });
    });
};



function isAuthenticated(req,res,next){
    if(req.user)
        return next();
    else
        return res.status(401).json({
            error: 'User not authenticated'
        })

}
//for testing
//username - ZachLowe password-LowePost

function isAdmin(req,res,next){
    console.log(req.user.username);
    if(req.user.username === "ZachLowe" || req.user.username === "nlimbach") {
        return next();

    }
        else {
            return res.status(401).json({
                error: "user does not have access"
            });

    }

}