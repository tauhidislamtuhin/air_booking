import 'package:flutter/material.dart';
import '../models/airport.dart';
import '../utils/custom_colors.dart';

class AirportTextField extends StatefulWidget {
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
  State<AirportTextField> createState() => _AirportTextFieldState();
}

class _AirportTextFieldState extends State<AirportTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // airport nul check
    _controller = TextEditingController(
      text: widget.airport == null
          ? ""
          : "${widget.airport!.city} (${widget.airport!.code})",
    );
  }

  @override
  void didUpdateWidget(covariant AirportTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Swap
    if (oldWidget.airport != widget.airport) {
      _controller.text = widget.airport == null
          ? ""
          : "${widget.airport!.city} (${widget.airport!.code})";
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final textColor = CustomColors.getTextColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);
    final borderColor = CustomColors.getBorderColor(context);

    return Autocomplete<Airport>(
      initialValue: TextEditingValue(
        text: widget.airport == null
            ? ""
            : "${widget.airport!.city} (${widget.airport!.code})",
      ),

      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return Airport.airports;
        }

        return Airport.airports.where((a) {
          final query = textEditingValue.text.toLowerCase();
          return a.city.toLowerCase().contains(query) ||
              a.code.toLowerCase().contains(query) ||
              a.name.toLowerCase().contains(query);
        });
      },

      displayStringForOption: (option) =>
      "${option.city} (${option.code})",

      onSelected: (selectedAirport) {
        widget.onSelected(selectedAirport);
        _controller.text =
        "${selectedAirport.city} (${selectedAirport.code})";
      },

      fieldViewBuilder: (
          context,
          fieldController,
          focusNode,
          onFieldSubmitted,
          ) {
        if (fieldController.text != _controller.text) {
          fieldController.text = _controller.text;
        }

        return TextField(
          controller: fieldController,
          focusNode: focusNode,
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: widget.title,
            hintText: "Select ${widget.title} Airport",
            hintStyle: TextStyle(
              color: subTextColor.withAlpha(150),
              fontSize: 14,
            ),
            labelStyle: TextStyle(color: subTextColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            prefixIcon: Icon(widget.icon, color: textColor),
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

      // auto fillip
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