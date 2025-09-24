import 'package:fit_trackr/presentation/screens/add_activity_screen.dart';
import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/daily_steps_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(label: "Dasboard"),
            const SizedBox(height: 24),
            Text(
              "Olá, João!",
              style: Theme.of(context).textTheme.titleLarge,
            ), // TODO: Nome do usuário,
            const SizedBox(height: 24),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            value: 0.8,
                            strokeWidth: 7.5,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "7500 / 10000 Passos ",
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: const Color(0xFFFFFFFF)),
                          ),
                          Text(
                            "Continue assim!",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: const Color(0xFFFFFFFF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text("Meus passos", style: Theme.of(context).textTheme.titleLarge),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Expanded(child: DailyStepsChart()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddActivityScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
