import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/account.dart';
import 'package:air_booking/screens/booking.dart';
import 'package:air_booking/screens/home.dart';
import 'package:air_booking/screens/save_screen.dart';
import 'package:air_booking/screens/test.dart';
import 'package:air_booking/screens/wallet_screen.dart';
import 'package:air_booking/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  late FlightSearch fsearch;

  // Screen list for tab navigation
  final List<Widget> pages = [
    HomeScreen(),
     SaveScreen(),
     Booking(),
     WalletScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final cardBg = CustomColors.getCardColor(context);
    final subTextColor = CustomColors.getSubTextColor(context);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: cardBg,
        selectedItemColor: CustomColors.primaryColor,
        unselectedItemColor: subTextColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_rounded),
            activeIcon: Icon(Icons.add_home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add_rounded),
            activeIcon: Icon(Icons.bookmark_add_rounded),
            label: "Save",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            activeIcon: Icon(CupertinoIcons.book),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet_outlined),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}