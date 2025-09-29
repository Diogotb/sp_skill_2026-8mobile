import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_trackr/auth/auth_provider.dart';
import 'package:fit_trackr/core/themes/app_colors.dart';
import 'package:fit_trackr/models/goal_model.dart';
import 'package:fit_trackr/presentation/screens/add_activity_screen.dart';
import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/daily_steps_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final UserGoals currentMock = UserGoals(
    dailySteps: 3500,
    dailyCaloriesBurn: 200,
    dailyCaloriesConsume: 1300,
  );

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).currentUser;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(label: "Dashboard"),
            const SizedBox(height: 24),
            Text(
              "Olá, ${user?.name}!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            (CarouselSlider(
              items: [
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
                                value:
                                    currentMock.dailySteps /
                                    user!.goals.dailySteps,
                                strokeWidth: 7.5,
                                color: Theme.of(context).colorScheme.secondary,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary.withOpacity(0.3),
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
                                "${currentMock.dailySteps} / ${user!.goals.dailySteps} Passos",
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
                                value:
                                currentMock.dailyCaloriesConsume /
                                    user!.goals.dailyCaloriesConsume,
                                strokeWidth: 7.5,
                                color: Theme.of(context).colorScheme.secondary,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary.withOpacity(0.3),
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
                                "${currentMock.dailyCaloriesConsume} / ${user!.goals.dailyCaloriesConsume} Calorias Consumidas",
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

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
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
                                value:
                                currentMock.dailyCaloriesBurn /
                                    user.goals.dailyCaloriesBurn,
                                strokeWidth: 7.5,
                                color: AppColors.accent,
                                backgroundColor: AppColors.accent.withOpacity(0.3),
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
                                "${currentMock.dailyCaloriesBurn} / ${user.goals.dailyCaloriesBurn} Calorias queimadas",
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
              ],
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
            )),
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
