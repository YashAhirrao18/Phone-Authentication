// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'app_styles.dart';

class LanguageDropdown extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String?>? onChanged;

  const LanguageDropdown(
      {Key? key, required this.selectedLanguage, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedLanguage,
            items: ['English', 'Hindi', 'Marathi'].map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(
                  language,
                  style: AppStyles.dropdownTextStyle,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            hint: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                'Select...',
                style: AppStyles.dropdownTextStyle,
              ),
            ),
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
