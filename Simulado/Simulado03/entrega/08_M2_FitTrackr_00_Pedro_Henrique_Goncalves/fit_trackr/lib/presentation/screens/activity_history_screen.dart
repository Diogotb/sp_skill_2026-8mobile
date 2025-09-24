import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/exercise_list_view.dart';
import 'package:flutter/material.dart';

import 'add_activity_screen.dart';

class ActivityHistoryScreen extends StatefulWidget {
  const ActivityHistoryScreen({super.key});

  @override
  State<ActivityHistoryScreen> createState() => _ActivityHistoryScreenState();
}

class _ActivityHistoryScreenState extends State<ActivityHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
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
