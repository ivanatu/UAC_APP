import 'package:uac/extensions/double_extension.dart';

import '/apis/api_helper.dart';
import '/models/testing_cascade_response.dart';
import '/exports/exports.dart';

class TestingCascadeService {
  ApiHelper apiHelper = ApiHelper();
  Future<List<TestingCascade>> getTestingCascade() async {
    var response = await apiHelper.get("hiv-testing-and-treatment-cascades");
    return TestingCascadeResponse.fromJson(response).data;
  }
}

class HIVTestingAndTreatmentCascade extends StatefulWidget {
  const HIVTestingAndTreatmentCascade({super.key});

  @override
  State<HIVTestingAndTreatmentCascade> createState() =>
      _HIVTestingAndTreatmentCascadeState();
}

class _HIVTestingAndTreatmentCascadeState
    extends State<HIVTestingAndTreatmentCascade> {
  final TestingCascadeService _service = TestingCascadeService();
  List<TestingCascade> _cascadeData = [];
  bool _isLoading = true;
  String? _errorMessage;

  // Professional color palette for each bar
  final List<Color> _barColors = [
    Color(0xFF6366F1), // Indigo
    Color(0xFF8B5CF6), // Purple
    Color(0xFFEC4899), // Pink
    Color(0xFFF59E0B), // Amber
    Color(0xFF10B981), // Emerald
    Color(0xFF3B82F6), // Blue
    Color(0xFF14B8A6), // Teal
    Color(0xFFEF4444), // Red
    Color(0xFFF97316), // Orange
    Color(0xFF06B6D4), // Cyan
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await _service.getTestingCascade();
      setState(() {
        _cascadeData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load data: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "HIV Testing and Treatment\n Cascade",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.apply(fontWeightDelta: 4, fontSizeFactor: 1.1),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          _isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.orange))
              : _errorMessage != null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, color: Colors.red, size: 48),
                        SizedBox(height: 16),
                        Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                              _errorMessage = null;
                            });
                            _loadData();
                          },
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(15, 40, 15, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 16),
                      // Bar Chart
                      Container(
                        height: 400,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: _buildBarChart(),
                      ),
                      SizedBox(height: 24),
                      // Legend
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Legend',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 12),
                            ..._buildLegendItems(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    if (_cascadeData.isEmpty) {
      return Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    // Parse values and find max for scaling
    final values = _cascadeData.map((item) {
      return double.tryParse(item.attributes.value) ?? 0.0;
    }).toList();

    final maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue * 1.2, // Add 20% padding to top
        minY: 0,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.black87,
            tooltipPadding: EdgeInsets.all(8),
            tooltipMargin: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${_cascadeData[groupIndex].attributes.title}\n',
                TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                children: [
                  TextSpan(
                    text: '${rod.toY.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 60,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < _cascadeData.length) {
                  final title = _cascadeData[value.toInt()].attributes.title;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.formatThousandKMB.toUpperCase(),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxValue / 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(color: Colors.grey.shade400, width: 1),
            bottom: BorderSide(color: Colors.grey.shade400, width: 1),
          ),
        ),
        barGroups: _cascadeData.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final value = double.tryParse(item.attributes.value) ?? 0.0;
          final color = _barColors[index % _barColors.length];

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: value,
                color: color,
                width: 20,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY: maxValue * 1.2,
                  color: Colors.grey.shade100,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  List<Widget> _buildLegendItems() {
    return _cascadeData.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final color = _barColors[index % _barColors.length];
      final value = double.tryParse(item.attributes.value)?.formatThousand;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                item.attributes.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              value ?? 'N/A',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
