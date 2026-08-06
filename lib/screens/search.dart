import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/details.dart';
import 'package:air_booking/widgets/flight_card.dart';
import 'package:air_booking/widgets/search_header.dart';

import 'package:flutter/material.dart';

import '../models/flight.dart';
import '../widgets/sort_filter_bar.dart';

class SearchScreen extends StatelessWidget {
  final FlightSearch search;

  const SearchScreen({
    super.key,
    required this.search,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SearchHeader(search: search),

              Expanded(
                child: ListView.builder(
                  // Floating Bar-এর নিচে যাতে কার্ড না ঢেকে যায় সেজন্য নিচে bottom padding দেওয়া হলো
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 100,
                  ),
                  itemCount: Flight.flights.length,
                  itemBuilder: (context, index) {
                    final flight = Flight.flights[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: FlightCard(
                        flight: flight,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                flight: flight,
                                search: search,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SortFilterBar(
              onSort: () {},
              onFilter: () {},
            ),
          ),
        ],
      ),
    );
  }
}