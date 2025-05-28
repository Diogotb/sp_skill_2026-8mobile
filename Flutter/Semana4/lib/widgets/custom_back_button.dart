import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Widget? page;
  const CustomBackButton({this.page,super.key});



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      width: 105,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        onPressed: () {
          page != null ? Navigator.push(context, MaterialPageRoute(builder: (context) => page!)) :
          Navigator.pop(context);
        },
        child: Text(
          "Voltar",
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
