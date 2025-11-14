import 'package:flutter/material.dart';
import 'package:uac/models/regions_model.dart';
import 'package:uac/services/regions_service.dart';

class RegionalPrevalenceRate extends StatefulWidget {
  @override
  _RegionalPrevalenceRateState createState() => _RegionalPrevalenceRateState();
}

class _RegionalPrevalenceRateState extends State<RegionalPrevalenceRate> {
  final RegionService _service = RegionService();
  late Future<List<Datum>> _regionsData;

  @override
  void initState() {
    super.initState();
    _regionsData = _service.getRegions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Regional HIV Prevalence'),
        elevation: 2,
      ),
      body: FutureBuilder<List<Datum>>(
        future: _regionsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingState();
          }

          if (snapshot.hasError) {
            return _buildErrorState(snapshot.error.toString());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmptyState();
          }

          final regions = snapshot.data!;
          return _buildRegionsView(regions);
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(
            'Loading prevalence data...',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
            const SizedBox(height: 16),
            const Text(
              'Failed to load prevalence data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _regionsData = _service.getRegions();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No prevalence data available',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionsView(List<Datum> regions) {
    // Sort regions by prevalence (highest first)
    final sortedRegions = List<Datum>.from(regions)
      ..sort(
        (a, b) => b.attributes.prevalence.compareTo(a.attributes.prevalence),
      );

    // Calculate statistics
    final totalRegions = sortedRegions.length;
    final averagePrevalence =
        sortedRegions
            .map((r) => r.attributes.prevalence)
            .reduce((a, b) => a + b) /
        totalRegions;
    final highestPrevalence = sortedRegions.first.attributes.prevalence;
    final lowestPrevalence = sortedRegions.last.attributes.prevalence;

    return Column(
      children: [
        // Statistics Header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).primaryColor.withValues(alpha: 0.1),
                Theme.of(context).primaryColor.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Regional Statistics',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Total Regions',
                      totalRegions.toString(),
                      Icons.location_on_outlined,
                      Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Average',
                      '${averagePrevalence.toStringAsFixed(1)}%',
                      Icons.analytics_outlined,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Highest',
                      '${highestPrevalence.toStringAsFixed(1)}%',
                      Icons.trending_up,
                      Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'Lowest',
                      '${lowestPrevalence.toStringAsFixed(1)}%',
                      Icons.trending_down,
                      Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Regions List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: sortedRegions.length,
            itemBuilder: (context, index) {
              final region = sortedRegions[index];
              return _buildRegionCard(region, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegionCard(Datum region, int index) {
    final prevalence = region.attributes.prevalence;
    final color = _getColorForPrevalence(prevalence);
    final rank = index + 1;

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            // Navigate to region details if needed
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Rank badge
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '#$rank',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Region info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        region.attributes.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.update, size: 14, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text(
                            'Updated ${_formatDate(region.attributes.updatedAt)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Prevalence indicator
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${prevalence.toStringAsFixed(1)}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getPrevalenceLabel(prevalence),
                      style: TextStyle(
                        fontSize: 11,
                        color: color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForPrevalence(double prevalence) {
    if (prevalence < 3.0) return Colors.green;
    if (prevalence < 5.0) return Colors.orange;
    if (prevalence < 7.0) return Colors.deepOrange;
    return Colors.red;
  }

  String _getPrevalenceLabel(double prevalence) {
    if (prevalence < 3.0) return 'Low';
    if (prevalence < 5.0) return 'Moderate';
    if (prevalence < 7.0) return 'High';
    return 'Very High';
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
