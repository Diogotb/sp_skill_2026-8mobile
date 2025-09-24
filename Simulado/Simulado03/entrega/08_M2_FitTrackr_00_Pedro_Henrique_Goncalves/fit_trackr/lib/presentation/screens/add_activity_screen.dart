import 'package:fit_trackr/presentation/widgets/activity_selector.dart';
import 'package:fit_trackr/presentation/widgets/bottom_navigation_bar.dart';
import 'package:fit_trackr/presentation/widgets/custom_button.dart';
import 'package:fit_trackr/presentation/widgets/custom_header.dart';
import 'package:fit_trackr/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddActivityScreen extends StatefulWidget {
  const AddActivityScreen({super.key});

  @override
  State<AddActivityScreen> createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  final _durationController = TextEditingController();
  final _caloriesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16), child: Column(
        children: [
          CustomHeader(label: "Adicionar"),

          SizedBox(height: 48,),
          ActivitySelector(),
          SizedBox(height: 48,),
          CustomTextFormField(controller: _durationController, label: "Duração"),
          SizedBox(height: 48,),
          CustomTextFormField(controller: _caloriesController, label: "Calorias Queimadas"),
          SizedBox(height: 84,),
          CustomButton(onPressed: () {
            // TODO: Implemnetar lógica, por enquanto só envia para dashboard
            Navigator.pushReplacementNamed(context, '/dashboard');
          }, label: "Salvar")
        ],
      ),),
      
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }
}
