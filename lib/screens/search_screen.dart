import 'package:air_booking/models/flight_search.dart';
import 'package:air_booking/screens/details_screen.dart';
import 'package:air_booking/utils/custom_colors.dart';
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
      backgroundColor: CustomColors.getBackgroundColor(context),
      body: Stack(
        children: [
          Column(
            children: [
              // Search header with route info & date selector
              SearchHeader(search: search),

              // Available flight list
              Expanded(
                child: ListView.builder(
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

          // sort and filter
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