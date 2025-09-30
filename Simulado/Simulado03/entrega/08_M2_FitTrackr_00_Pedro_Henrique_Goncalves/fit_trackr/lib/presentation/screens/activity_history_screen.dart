import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/exercise_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activities_provider.dart';
import 'add_activity_screen.dart';

class ActivityHistoryScreen extends StatefulWidget {
  const ActivityHistoryScreen({super.key});

  @override
  State<ActivityHistoryScreen> createState() => _ActivityHistoryScreenState();

}

class _ActivityHistoryScreenState extends State<ActivityHistoryScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ActivitiesProvider>(context, listen: false).fetchActivities()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child:
          Provider.of<ActivitiesProvider>(context).isLoading ?
              CircularProgressIndicator() :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomHeader(label: "Atividades"),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Expanded(child: ExerciseListView()),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
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
