import 'package:flutter/material.dart';
import '../models/airport.dart';
import '../utils/custom_colors.dart';

class AirportTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final Airport? airport;
  final ValueChanged<Airport> onSelected;

  const AirportTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.airport,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);
    final borderColor = CustomColors.getBorderColor(context);

    return Autocomplete<Airport>(
      initialValue: TextEditingValue(
        text: airport == null ? "" : "${airport!.city} (${airport!.code})",
      ),

      // Filter airport list based on input
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return Airport.airports;
        }

        return Airport.airports.where((airport) {
          final query = textEditingValue.text.toLowerCase();
          return airport.city.toLowerCase().contains(query) ||
              airport.code.toLowerCase().contains(query) ||
              airport.name.toLowerCase().contains(query);
        });
      },

      displayStringForOption: (airport) =>
      "${airport.city} (${airport.code})",

      onSelected: onSelected,

      // Input field
      fieldViewBuilder: (
          context,
          controller,
          focusNode,
          onFieldSubmitted,
          ) {
        controller.text = airport == null
            ? ""
            : "${airport!.city} (${airport!.code})";

        return TextField(
          controller: controller,
          focusNode: focusNode,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: TextStyle(color: subTextColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(icon, color: textColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: CustomColors.primaryColor,
                width: 1.5,
              ),
            ),
          ),
        );
      },

      // Dropdown menu
      optionsViewBuilder: (context, onAutoCompleteSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            color: cardBg,
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    title: Text(
                      "${option.city} (${option.code})",
                      style: TextStyle(color: textColor),
                    ),
                    subtitle: Text(
                      option.name,
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () => onAutoCompleteSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}