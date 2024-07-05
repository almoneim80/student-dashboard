import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartModel {
  String year;
  int financial;
  final charts.Color color;

  BarChartModel({
    required this.year,
    required this.financial,
    required this.color,
  });
}

class Attendance extends StatelessWidget {
  Attendance({Key? key}) : super(key: key);
  final List<BarChartModel> data = [
    BarChartModel(
      year: "Jan",
      financial: 730,
      color: charts.Color.fromHex(code: '#1C2C3C'),
    ),
    BarChartModel(
      year: "Feb",
      financial: 600,
      color: charts.Color.fromHex(code: '#D2BE6A'),
    ),
    BarChartModel(
      year: "Mar",
      financial: 800,
      color: charts.Color.fromHex(code: '#1C2C3C'),
    ),
    BarChartModel(
      year: "Apr",
      financial: 700,
      color: charts.Color.fromHex(code: '#6A4E01'),
    ),
    BarChartModel(
      year: "May",
      financial: 640,
      color: charts.Color.fromHex(code: '#1C2C3C'),
    ),
    BarChartModel(
      year: "Jun",
      financial: 650,
      color: charts.Color.fromHex(code: '#6A4E01'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.financial,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0.0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.black, size: 30,),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: Colors.white10,
          title: const Text(
            'Hudurk',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: const Icon(Icons.settings, color: Colors.black, size: 30,),
        ),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                const SizedBox(width: 20,),
                SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset('assets/logoStudent.jpeg'),
                ),
                const SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Nawal Dafer', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Text('444337@gmail.com', style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Check your Attendance.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 300, // Adjust height as needed
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: charts.BarChart(
                  series,
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(),
                  domainAxis: const charts.OrdinalAxisSpec(),
                ),
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildCircularChart(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(top: 40.0, right: 16.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Classes:', style: TextStyle(fontSize: 14)),
                              Text('120', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Payment days:', style: TextStyle(fontSize: 14)),
                              Text('80', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Absent days:', style: TextStyle(fontSize: 14)),
                              Text('20', style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Keep Up the Good Work!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularChart() {
    return Container(
      height: 150, // Reduced height
      margin: const EdgeInsets.only(top: 20.0), // Shifted down
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (FlTouchEvent event, PieTouchResponse? pieTouchResponse) {
              // Handle touch interactions here
            },
          ),
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          centerSpaceRadius: 40, // Adjusted radius
          sections: [
            PieChartSectionData(
              color: Color.fromRGBO(107, 76, 0, 1),
              value: 75, // Adjust the value as needed
              radius: 30, // Adjusted radius
              titleStyle: TextStyle(
                fontSize: 14, // Adjusted font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              titlePositionPercentageOffset: 0.55,
              showTitle: false, // Hides the number inside the section
            ),
            PieChartSectionData(
              color: Color.fromRGBO(210, 188, 118, 1),
              value: 25, // Adjust the value as needed
              radius: 30, // Adjusted radius
              titleStyle: TextStyle(
                fontSize: 14, // Adjusted font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              titlePositionPercentageOffset: 0.55,
              showTitle: false, // Hides the number inside the section
            ),
          ],
        ),
      ),
    );
  }
}