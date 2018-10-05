import React, { Component } from "react"

class DebitChart extends Component {
    constructor() {
        super()
        this.state = {
            data: []
        }
    }

    render() {
        return (
            <div id="chart"></div>
        )
    }

    renderChart(){
        d3.select("#pie-chart").remove()
        var chart = d3.selectAll("#chart")
        chart.append("svg")
            .attr("id", "pie-chart")

        var svg = chart.select("#pie-chart"),
            width = 900,
            height = 500,
            radius = Math.min(width, height) / 2,
            g = svg.append("g").attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

        svg.attr("height", height)
        svg.attr("width", width)

        let color = ["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"],
            pie = d3.pie()
                .sort(null)
                .value(function (d) {
                    return d[1];
            }),
            data = {}

        this.props.data.forEach(datum => {
            if (datum[2] in data) {
                data[datum[2]] += datum[3]
            }
            else {
                data[datum[2]] = datum[3]
            }

        })
        data = Object.keys(data).map(key => [key, data[key]])

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
            .attr("fill", function () {
                return color[colorCount++ % 7]
            });

        arc.append("text")
            .attr("transform", function (d) {
                return "translate(" + label.centroid(d) + ")";
            })
            .attr("dy", "0.35em")
            .text(function (d) {
                return d.data[0];
            });
    }
    componentDidMount() {
        this.renderChart()
    }
    componentDidUpdate() {
        this.renderChart()
    }
}


export default DebitChart