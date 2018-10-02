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
                    <Route path="/debit" component={Debits}/>
                </div>
            </Router>
        )
    }
}

class Debits extends Component {
    constructor() {
        super()
        this.state = {
            data: []

        }
    }

    render() {
        return (
            <div>
                <h1>Debits</h1>
                <svg width="960" height="500"></svg>
            </div>
        )
    }

    componentDidMount() {
        axios.get('http://localhost:4000/json/debits')
            .then(response => {
                this.setState((prev, props) => ({
                    data: response.data.data.map(
                        data => [data.item, data.category, data.amount])
                }))
                console.log("state", this.state)
                var svg = d3.select("svg"),
                    width = +svg.attr("width"),
                    height = +svg.attr("height"),
                    radius = Math.min(width, height) / 2,
                    g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

                let color = ["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"];

                let data = this.state.data

                let pie = d3.pie()
                    .sort(null)
                    .value(function(d) { return d[2]; });

                let path = d3.arc()
                    .outerRadius(radius - 10)
                    .innerRadius(0);

                let label = d3.arc()
                    .outerRadius(radius - 40)
                    .innerRadius(radius - 40);

                let arc = g.selectAll(".arc")
                    .data(pie(data))
                    .enter().append("g")
                    .attr("class", "arc");

                let colorCount = 0
                arc.append("path")
                    .attr("d", path)
                    .attr("fill", function() { return color[colorCount++%7]});

                arc.append("text")
                    .attr("transform", function(d) { return "translate(" + label.centroid(d) + ")"; })
                    .attr("dy", "0.35em")
                    .text(function(d) { return d.data[1]; });
            }).catch(error => console.log(error))

    }
}

class Home extends Component {
    render() {
        return (
            <div>
                <h1>Hello React!</h1>
                <Link to="/debit">Debits</Link>
            </div>
        )
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