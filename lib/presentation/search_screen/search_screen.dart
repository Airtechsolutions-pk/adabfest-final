import 'package:adabfest/presentation/search_screen/provider/search_provder.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/utils/navigator_service.dart';
import '../../data/models/GlobalEvents/EventsModals.dart';
import '../../routes/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SearchProvider(), child: SearchScreen());
  }
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<EventsModels> allEvents = [];
  List<EventsModels> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchProvider>(context, listen: false).callevents(
        onSuccess: () {
          setState(() {
            allEvents =
                Provider.of<SearchProvider>(context, listen: false).getevents;
            filteredEvents = allEvents;
          });
        },
        onError: () {},
      );
    });
  }

  void _searchEvents(String query) {
    List<EventsModels> updatedList = allEvents
        .where((event) =>
    event.eventcategories != null &&
        event.eventcategories!.any((category) =>
        category.events != null &&
            category.events!.any((e) =>
            e.name != null &&
                e.name!.toLowerCase().contains(query.toLowerCase()))))
        .toList();

    setState(() {
      filteredEvents = updatedList;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _searchEvents,
          decoration: InputDecoration(
            hintText: 'Search events by name...',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredEvents.isNotEmpty ? filteredEvents.length : 0,
        itemBuilder: (context, eventIndex) {
          EventsModels eventModel = filteredEvents[eventIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: eventModel.eventcategories?.length ?? 0,
                itemBuilder: (context, categoryIndex) {
                  Eventcategories category = eventModel.eventcategories![categoryIndex];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: category.events?.length ?? 0,
                        itemBuilder: (context, eventIndex) {
                          Events event = category.events![eventIndex];
                          return ListTile(
                            onTap: (){
                              NavigatorService.pushNamed(
                                AppRoutes.eventDetailsScreen,
                                arguments: category.events![eventIndex],
                              );
                            },
                            title: Text(event.name ?? ''),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
