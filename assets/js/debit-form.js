import axios from "axios/index"
import React, { Component } from "react"
import Button from '@material-ui/core/Button'
import InputAdornment from '@material-ui/core/InputAdornment';
import TextField from '@material-ui/core/TextField';
import classNames from 'classnames';
import { withStyles } from '@material-ui/core/styles';

const styles = theme => ({
    root: {
        display: 'flex',
        flexWrap: 'wrap',
    },
    margin: {
        margin: theme.spacing.unit,
    },
    textField: {
        flexBasis: 200,
        fontSize: 1.5
    },
    button: {
        marginTop: 12
    }
});

class DebitForm extends Component {
    constructor(props) {
        super(props);
        this.state = {
            amount: '',
            item: '',
            category: ''
        };

        this.handleItemChange = this.handleItemChange.bind(this);
        this.handleAmountChange = this.handleAmountChange.bind(this);
        this.handleCategoryChange = this.handleCategoryChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleItemChange(event) {
        self = this
        this.setState(((prev, props) => {
            return {
                amount: self.state.amount,
                item: event.target.value,
                category: self.state.category
            }})());
    }
    handleCategoryChange(event) {
        self = this
        this.setState(((prev, props) => {
            return {
                amount: self.state.amount,
                item: self.state.item,
                category: event.target.value
            }})());
    }
    handleAmountChange(event) {
        self = this
        this.setState(((prev, props) => {
            let value = event.target.value
            return {
                amount:  event.target.value,
                item: self.state.item,
                category: self.state.category
            }})());
    }

    handleSubmit(event) {
        let data = {
                amount: parseFloat(this.state.amount),
                category: this.state.category,
                item: this.state.item
            },
            self = this


        axios.post('http://localhost:4000/json/debits',
            {debit: data},
            {headers: {'Content-Type': 'application/json'}})
            .then(function (response) {
                self.setState((prev, props) => ({
                    amount: '',
                    item: '',
                    category: ''
                }))
                console.log(response);
            })
            .catch(function (error) {
                console.log(error);
            });
        event.preventDefault();
    }
    handleChange(event){}

    render() {
        const { classes } = this.props
        return (
            <form onSubmit={this.handleSubmit}>
                <TextField
                    id="outlined-adornment-item"
                    className={classNames(classes.margin, classes.textField)}
                    variant="outlined"
                    label="Item"
                    value={this.state.item}
                    onChange={this.handleItemChange}
                />
                <TextField
                    id="outlined-adornment-category"
                    className={classNames(classes.margin, classes.textField)}
                    variant="outlined"
                    label="Category"
                    value={this.state.category}
                    onChange={this.handleCategoryChange}
                />
                <TextField
                    id="outlined-adornment-amount"
                    className={classNames(classes.margin, classes.textField)}
                    variant="outlined"
                    label="Amount"
                    value={this.state.amount}
                    onChange={this.handleAmountChange}
                    pattern="[0-9]*|[0-9]*\.[0-9]{2}"
                    InputProps={{
                        startAdornment: <InputAdornment position="start">$</InputAdornment>,
                    }}

                />
                <Button
                    variant="contained"
                    color="primary"
                    type='submit'
                    className={classes.button}>
                    Submit
                </Button>
            </form>
        );
    }
}

export default withStyles(styles)(DebitForm)