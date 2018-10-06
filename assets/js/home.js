import axios from "axios/index";
import React, { Component } from "react"
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import DebitTable from './debit-table'
import DebitChart from './debit-chart'
import DebitForm from './debit-form'
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';

const styles = theme => ({
    root: {
        flexGrow: 1,
    },
    paper: {
        padding: theme.spacing.unit * 2,
        textAlign: 'center',
        color: theme.palette.text.secondary,
    },
});

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
                    <Grid container aspacing={24}>
                        <Grid item xs={12}>
                            <DebitForm/>
                        </Grid>
                        <Grid item xs={12} sm={6}>
                            <DebitTable data={ this.state.data }/>
                        </Grid>
                        <Grid item xs={12} sm={6}>
                            <DebitChart data={ this.state.data }/>
                        </Grid>

                    </Grid>
                </div>
            </div>
        )
    }
}

export default Home