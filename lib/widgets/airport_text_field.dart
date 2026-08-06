import 'package:flutter/material.dart';
import '../models/airport.dart';

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
    return Autocomplete<Airport>(
      initialValue: TextEditingValue(
        text: airport == null
            ? ""
            : "${airport!.city} (${airport!.code})",
      ),

      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return Airport.airports;
        }

        return Airport.airports.where((airport) {
          return airport.city
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase()) ||
              airport.code
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase()) ||
              airport.name
                  .toLowerCase()
                  .contains(textEditingValue.text.toLowerCase());
        });
      },

      displayStringForOption: (airport) =>
      "${airport.city} (${airport.code})",

      onSelected: onSelected,

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
          decoration: InputDecoration(
            labelText: title,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(
              icon,
              color: Colors.black87,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.black45
              )
            ),
          ),
        );
      },
    );
  }
}