import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CharView extends StatefulWidget {
  const CharView({Key? key}) : super(key: key);

  @override
  State<CharView> createState() => _CharViewState();
}

class _CharViewState extends State<CharView> {
  List<_ChartData>? chartData;

  TooltipBehavior? _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);
    chartData = <_ChartData>[
      _ChartData('P.Tesi', 25, 25, 40, 10),
      _ChartData('Sali', 80, 75, 70, 60),
      _ChartData('Csb', 35, 45, 55, 52),
      _ChartData('Prsmb', 65, 50, 70, 65),
      _ChartData('Cuma', 65, 50, 70, 65),
      _ChartData('C.Tesi', 65, 50, 70, 65),
      _ChartData('Pazar', 65, 50, 70, 65),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SfCartesianChart(
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
            enablePanning: true,
            enableDoubleTapZooming: true,
            enableSelectionZooming: true,
            enableMouseWheelZooming: true,
          ),
          plotAreaBorderWidth: 0,
          title: ChartTitle(
            text: 'Chart title',
          ),
          legend: Legend(
            isVisible: true,
            overflowMode: LegendItemOverflowMode.wrap,
          ),
          // title: ChartTitle(
          //     text: isCardView ? '' : 'Quarterly wise sales of products'),
          // legend: Legend(
          //     isVisible: !isCardView, overflowMode: LegendItemOverflowMode.wrap),
          primaryXAxis: const CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
          ),
          primaryYAxis: const NumericAxis(
              rangePadding: ChartRangePadding.none,
              axisLine: AxisLine(width: 0),
              majorTickLines: MajorTickLines(size: 0)),
          series: _getStackedColumnSeries(),
          tooltipBehavior: _tooltipBehavior,
        ));
  }

  List<CartesianSeries<_ChartData, String>> _getStackedColumnSeries() {
    return <CartesianSeries<_ChartData, String>>[
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y1,
          name: 'Mutluluk'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          name: 'Uzuntu'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y3,
          name: 'Kaygi'),
      StackedColumn100Series<_ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y4,
          name: 'Ofke')
    ];
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class _ChartData {
  _ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final num y1;
  final num y2;
  final num y3;
  final num y4;
}
