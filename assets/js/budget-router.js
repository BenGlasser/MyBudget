import React, { Component } from "react"
import { BrowserRouter as Router, Route, Link } from 'react-router-dom'
import Home from './home'

class BudgetRouter extends Component {
    render() {
        return (
            <Router>
                <div>
                    <Route exact path="/" component={Home}/>
                </div>
            </Router>
        )
    }
}

export default BudgetRouter