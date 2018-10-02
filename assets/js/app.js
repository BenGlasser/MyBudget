// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import axios from 'axios'
import React, { Component } from "react"
import ReactDOM from "react-dom"
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'

const EXPENSES = {
    source: 0,
    category: 1,
    amount: 2
}

class HelloReact extends Component {
    render() {
        return (
            <Router>
                <div>
                <Route exact path="/" component={Home}/>
            <Route path="/login" component={Login}/>
            </div>
            </Router>
        )
    }
}

class Home extends Component {
    constructor() {
        super()
        this.state = {
            data: []

        }
    }

    render() {
        return (
            <div>
                <h1>Hello React!</h1>
                    {this.state.data}
                <Link to="/login">Login</Link>
            </div>
    )
    }

    componentDidMount() {
        axios.get('http://localhost:4000/credits')
            .then(response => {
                this.setState((prev, props) => ({
                    data: response.data.data.map(
                        data => [data.source, data.category, data.amount])
                }))
                console.log("state", this.state)
            }).catch(error => console.log(error))

    }

}
class Login extends Component {
    render() {
        return (
            <div>
            <h1>Hello Boring Login Page!</h1>
        <Link to="/">Home</Link>
            </div>
    )
    }
}

ReactDOM.render(
<HelloReact/>,
    document.getElementById("hello-react")
)