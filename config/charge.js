require('dotenv').config();
const stripe = require('stripe')(process.env.STRIPE_KEY);

module.exports = (token) => {

    // const token = req.body.stripeToken;


    return stripe.charges.create({
        // ensures we send a number, and not a string
        amount: 2000,
        currency: "USD",
        source: token,
        description: 'All Shirt Orders',
        metadata: {},
    });
};