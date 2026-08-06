import 'dart:async';
import 'package:flutter/material.dart';

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
        const Icon(
          Icons.access_time_rounded,
          color: Colors.white70,
          size: 16,
        ),
        const SizedBox(width: 6),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white, fontSize: 13),
            children: [
              const TextSpan(
                text: "Complete payment in  ",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: _formatTime(_remainingSeconds),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}