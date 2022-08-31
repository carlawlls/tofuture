import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scores"
export default class extends Controller {
  static targets = ["num"];

  connect() {
    this.element.textContent = "";
    anychart.onDocumentReady(function () {
      anychart.data.loadCsvFile("/AAPL.csv", function (data) {
        // create data table on loaded data
        var dataTable = anychart.data.table();
        dataTable.addData(data);

        // map loaded data for the candlestick series
        var mapping = dataTable.mapAs({
          open: 1,
          high: 2,
          low: 3,
          close: 4,
        });
        var chart = anychart.stock();

        // create first plot on the chart
        var plot = chart.plot(0);

        // set grid settings
        plot.yGrid(true).xGrid(true).yMinorGrid(true).xMinorGrid(true);
        var series = plot.candlestick(mapping).name("");

        series.legendItem().iconType("rising-falling");

        // create scroller series with mapped data
        chart.scroller().candlestick(mapping);

        // set chart selected date/time range
        chart.selectRange("2019-11-27", "2022-08-23");

        // create range picker
        var rangePicker = anychart.ui.rangePicker();

        // init range picker
        rangePicker.render(chart);

        // create range selector
        var rangeSelector = anychart.ui.rangeSelector();

        // init range selector
        rangeSelector.render(chart);

        // sets the title of the chart
        chart.title("");

        // set container id for the chart
        chart.container("container");

        // initiate chart drawing
        chart.draw();
      });
    });
    console.log("");
  }
}
