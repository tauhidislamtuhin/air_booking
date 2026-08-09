import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class BookingStepper extends StatelessWidget {
  final int currentStep;

  const BookingStepper({
    super.key,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepCircle(step: 1, label: "Book"),
        _buildLine(isActive: currentStep > 1),
        _buildStepCircle(step: 2, label: "Pay"),
        _buildLine(isActive: currentStep > 2),
        _buildStepCircle(step: 3, label: "E-Ticket"),
      ],
    );
  }

  // Step circle indicator builder
  Widget _buildStepCircle({
    required int step,
    required String label,
  }) {
    bool isCompleted = currentStep > step;
    bool isCurrent = currentStep == step;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCurrent
                ? Colors.white
                : (isCompleted ? Colors.white : Colors.white.withAlpha(50)),
          ),
          child: Center(
            child: isCompleted
                ? Icon(
              Icons.check,
              size: 16,
              color: CustomColors.primaryColor,
            )
                : Text(
              "$step",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: isCurrent
                    ? CustomColors.primaryColor
                    : Colors.white.withAlpha(180),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: (isCurrent || isCompleted) ? Colors.white : Colors.white60,
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // Connecting line between step circles
  Widget _buildLine({required bool isActive}) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.only(bottom: 16, left: 4, right: 4),
      color: isActive ? Colors.white : Colors.white38,
    );
  }
}