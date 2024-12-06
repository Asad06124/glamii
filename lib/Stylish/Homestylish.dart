import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProviderHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          height: 50,
          width: 150,
          // color: Colors.white,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/6.png"),fit: BoxFit.cover)
          ),
        ),
        centerTitle: true,

        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Provider Dashboard',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
              SizedBox(height: 10,),

              const Text(
                'Hello, Micheal!', // Greeting text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Summary Cards Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard('Monthly Income', '\$5000'),
                  _buildSummaryCard('Services', '15'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard('Bookings', '20'),
                  _buildSummaryCard('Daily Income', '\$200'),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                'Monthly Income',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              // Income Graph
              _buildIncomeGraph(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value) {
    return Expanded(
      child: Card(
        color: const Color(0xff75140c),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeGraph() {
    final List<_IncomeData> data = [
      _IncomeData('Jan', 1000),
      _IncomeData('Feb', 2000),
      _IncomeData('Mar', 1500),
      _IncomeData('Apr', 2500),
      _IncomeData('May', 3000),
      _IncomeData('Jun', 3500),
      _IncomeData('Jul', 4000),
      _IncomeData('Aug', 4500),
      _IncomeData('Sep', 3000),
      _IncomeData('Oct', 4000),
      _IncomeData('Nov', 4500),
      _IncomeData('Dec', 5000),
    ];

    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          axisLine: const AxisLine(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white),
        ),
        primaryYAxis: NumericAxis(
          axisLine: const AxisLine(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white),
          interval: 1000,
          numberFormat: NumberFormat.compact(),
        ),
        series: <CartesianSeries<_IncomeData, String>>[
          LineSeries<_IncomeData, String>(
            dataSource: data,
            xValueMapper: (_IncomeData income, _) => income.month,
            yValueMapper: (_IncomeData income, _) => income.income,
            color: const Color(0xff75140c),
            width: 2,
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
        borderWidth: 0,
        plotAreaBorderWidth: 0,
      ),
    );
  }
}

class _IncomeData {
  final String month;
  final int income;

  _IncomeData(this.month, this.income);
}
