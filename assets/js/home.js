import axios from "axios/index";
import React, { Component } from "react"
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import DebitTable from './debit-table'
import DebitChart from './debit-chart'
import DebitForm from './debit-form'

class Home extends Component {

    constructor(){
        super()
        this.state = {
            data: []
        }
    }

    componentDidMount() {
        let setDebits = () => {
            axios.get('http://localhost:4000/json/debits')
                .then(response => {
                    this.setState((prev, props) => ({
                        data: response.data.data.map(
                            data => [data.id, data.item, data.category, data.amount])
                    }))
                    console.log("state", this.state)
                }).catch(error => console.log(error))
        }
        setDebits()
        setInterval(setDebits,5000)

    }

    render() {
        return (
            <div>
                <AppBar position="static" color="primary">
                    <Toolbar>
                        <Typography variant="title">
                            My Budget
                        </Typography>
                    </Toolbar>
                </AppBar>
                <div className={"container"}>
                    <DebitForm/>
                    <DebitTable data={ this.state.data }/>
                    <DebitChart data={ this.state.data }/>
                </div>
            </div>
        )
    }
}

export default Home