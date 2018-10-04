import axios from "axios/index"
import React, { Component } from "react"
import Button from '@material-ui/core/Button'

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

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label>
                    Item:
                    <input type="text" value={this.state.item} onChange={this.handleItemChange} />
                </label>
                <label>
                    Category:
                    <input type="text" value={this.state.category} onChange={this.handleCategoryChange} />
                </label>
                <label>
                    Amount:
                    <input type="text" pattern="[0-9]*|[0-9]*\.[0-9]+" value={this.state.amount} onChange={this.handleAmountChange} />
                </label>
                <input type="submit" value="Submit" />
                <Button variant="contained" color="primary">
                    Hello World
                </Button>
            </form>
        );
    }
}

export default DebitForm