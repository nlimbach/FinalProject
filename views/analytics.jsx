import React from 'react';
//import '/views/analytics';
// import "style.css";
import ChartistGraph from "react-chartist";


class Chart extends React.Component{
    constructor(props){
        super(props);

    }
    render(){
        return(
            <div className="login-image z-depth-5">
                <head>
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"/>
                    <link href="https://fonts.googleapis.com/css?family=Inconsolata|Raleway|Ubuntu" rel="stylesheet"/>
                        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
                            <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
                                <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
                    <link rel="stylesheet" href="./css/style.css"/>
                    <script src="https://code.jquery.com/jquery.js"/>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"/>
                </head>
                <nav>
                    <ul>
                        <li className="btn red brandLogo border"><a href="/about">Chuck's Tees</a></li>
                        <li className="border"><a href="/placeorder">Shop</a></li>
                        <li className="border"><a href="/profile">Profile</a></li>
                        <li className="border"><a href="/login">Login</a></li>
                        <li className="border"><a href="/signup">Sign Up</a></li>
                    </ul>
                </nav>
                <div className="card z-depth-4" id="aboutCard">
                    <p>Hello {this.props.user.username}, please visit <a href="https://dashboard.stripe.com/test/payments">Stripe</a> for information regarding customer purchases.
                    </p>
                </div>

            </div>
        )
    }
}
export default Chart;







