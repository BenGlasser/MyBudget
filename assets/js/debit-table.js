import React from 'react';
import axios from "axios/index"
import PropTypes from 'prop-types';
import { withStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Paper from '@material-ui/core/Paper';
import DeleteForeverIcon from '@material-ui/icons/DeleteForever';
import IconButton from '@material-ui/core/IconButton';

const styles = theme => ({
    root: {
        color: theme.palette.text.primary,
        width: '100%',
        marginTop: theme.spacing.unit * 3,
        overflowX: 'auto',
    },
    table: {
        minWidth: 700,
    },
    cell: {
        fontSize: '1em'
    },
    icon: {
        margin: theme.spacing.unit,
        fontSize: 24,
    },
    button: {
        margin: theme.spacing.unit,
        padding: 0,
    },
});



function DebitTable(props) {
    const { classes } = props;
    function deleteHandler() {
        alert('delete')
    }

    return (
        <Paper className={classes.root}>
            <Table className={classes.table}>
                <TableHead>
                    <TableRow className={classes.cell}>
                        <TableCell className={classes.cell}>Item</TableCell>
                        <TableCell className={classes.cell} >Category</TableCell>
                        <TableCell className={classes.cell} numeric>Amount $</TableCell>
                    </TableRow>
                </TableHead>
                <TableBody>
                    {props.data.map(row => {
                        return (
                            <TableRow key={row[0]}>
                                <TableCell className={classes.cell}>{row[1]}</TableCell>
                                <TableCell className={classes.cell}>{row[2]}</TableCell>
                                <TableCell className={classes.cell} numeric>{row[3]}</TableCell>
                                <TableCell className={classes.cell} numeric>
                                    <IconButton className={classes.button}
                                                aria-label="Delete"
                                                onClick={() => {
                                                    alert('are you sure you want to delete "' + row[1] + '"')
                                                    axios.delete('http://localhost:4000/json/debits/' + row[0])
                                                }}>
                                        <DeleteForeverIcon className={classes.icon} />
                                    </IconButton>
                                </TableCell>
                            </TableRow>
                        );
                    })}
                </TableBody>
            </Table>
        </Paper>
    );
}

DebitTable.propTypes = {
    classes: PropTypes.object.isRequired,
};

export default withStyles(styles)(DebitTable);