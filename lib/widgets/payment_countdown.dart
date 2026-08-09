import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class PaymentCountdown extends StatefulWidget {
  final int totalSeconds;
  final VoidCallback? onTimerFinished;

  const PaymentCountdown({
    super.key,
    this.totalSeconds = 7200,
    this.onTimerFinished,
  });

  @override
  State<PaymentCountdown> createState() => _PaymentCountdownState();
}

class _PaymentCountdownState extends State<PaymentCountdown> {
  Timer? _timer;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.totalSeconds;
    _startTimer();
  }

  // Start 1-second timer
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        if (widget.onTimerFinished != null) {
          widget.onTimerFinished!();
        }
      }
    });
  }

  // Formating
  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSecs = seconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSecs.toString().padLeft(2, '0');

    return "$hoursStr : $minutesStr : $secondsStr";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time_rounded,
          color: CustomColors.secondaryColor,
          size: 16,
        ),
        const SizedBox(width: 6),
        RichText(
          text: TextSpan(
            style: TextStyle(color: CustomColors.secondaryColor, fontSize: 13),
            children: [
              TextSpan(
                text: "Complete payment in  ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: CustomColors.secondaryColor,
                ),
              ),
              TextSpan(
                text: _formatTime(_remainingSeconds),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: CustomColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}