import 'package:flutter/material.dart';
import 'package:mvvm/repository/components/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: loading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: AppColors.whitecolor),
                  ),
          )),
    );
  }
}
