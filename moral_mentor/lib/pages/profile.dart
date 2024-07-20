import 'package:flutter/material.dart';
import 'package:moral_mentor/widgets/appbar.dart';
import 'package:moral_mentor/widgets/appdrawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveAppBar(
        userName: 'UHV',
        profilePicUrl: 'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
      ),
      drawer: const AppDrawer(
        userName: 'Mentor',
        profilePicUrl: 'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg',
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileHeader(context),
                  const SizedBox(height: 24),
                  _buildStatistics(context, constraints),
                  const SizedBox(height: 24),
                  _buildRecentActivity(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue.shade100,
          child: Icon(Icons.person, size: 50, color: Colors.blue.shade700),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mentor',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Ethical Thinker Level: Advanced',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatistics(BuildContext context, BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Ethics Performance',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        constraints.maxWidth > 600
            ? Row(
          children: [
            Expanded(child: _buildChart()),
            const SizedBox(width: 16),
            Expanded(child: _buildStatsGrid(context)),
          ],
        )
            : Column(
          children: [
            _buildChart(),
            const SizedBox(height: 16),
            _buildStatsGrid(context),
          ],
        ),
      ],
    );
  }

  Widget _buildChart() {
    final List<ChartData> chartData = [
      ChartData('Utilitarian', 80),
      ChartData('Deontological', 65),
      ChartData('Virtue Ethics', 75),
      ChartData('Care Ethics', 85),
    ];

    return SizedBox(
      height: 300,
      child: SfCircularChart(
        series: <CircularSeries>[
          RadialBarSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            maximumValue: 100,
          )
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final stats = [
      {'label': 'Scenarios Completed', 'value': '42'},
      {'label': 'Ethical Dilemmas Solved', 'value': '156'},
      {'label': 'Consistency Score', 'value': '89%'},
      {'label': 'Empathy Rating', 'value': '92%'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stats[index]['value']!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  stats[index]['label']!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    final activities = [
      'Completed "The Trolley Problem" scenario',
      'Achieved "Consistency Master" badge',
      'Solved 5 ethical dilemmas in a row',
      'Reached Advanced Ethical Thinker level',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text(activities[index]),
            );
          },
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

class QuizResultPieChart extends StatelessWidget {
  final Map<String, double> data;

  const QuizResultPieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<MapEntry<String, double>, String>(
            dataSource: data.entries.toList(),
            xValueMapper: (MapEntry<String, double> entry, _) => entry.key,
            yValueMapper: (MapEntry<String, double> entry, _) => entry.value,
            dataLabelMapper: (MapEntry<String, double> entry, _) =>
            '${entry.key}: ${entry.value.toStringAsFixed(1)}%',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }
}

double calculateDeviation(List<int> userResponses, List<int> idealResponses) {
  int total = idealResponses.length;
  double deviation = 0.0;

  for (int i = 0; i < total; i++) {
    deviation += (userResponses[i] - idealResponses[i]).abs();
  }

  return (deviation / total) * 100; // Percentage deviation
}





class QuizDashboard extends StatelessWidget {
  final Map<String, double> quizResults;
  final List<int> userResponses;
  final List<int> idealResponses;

  const QuizDashboard({super.key,
    required this.quizResults,
    required this.userResponses,
    required this.idealResponses,
  });

  @override
  Widget build(BuildContext context) {
    double deviation = calculateDeviation(userResponses, idealResponses);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quiz Results',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            QuizResultPieChart(data: quizResults),
            const SizedBox(height: 20),
            Text(
              'Overall Deviation: ${deviation.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}




