import 'dart:convert';
import 'package:adabfest/presentation/home_screen/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/app_export.dart';
import '../../../data/models/GlobalEvents/EventsModals.dart';
import '../../../data/models/bookamrtmodel.dart';

/// A provider class for the BookmarkScreen.
///
/// This provider manages the state of the BookmarkScreen, including the
/// current bookmarkModelObj

// ignore_for_file: must_be_immutable
class BookmarkProvider extends ChangeNotifier {
  static const String wishlistKey = 'wishlist';
   bool? bookmark = true;
  Future<List<Events>> getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? wishlistString = prefs.getString(wishlistKey);

    if (wishlistString != null) {
      List<dynamic> wishlistJson = jsonDecode(wishlistString);
      List<Events> wishlist = wishlistJson.map((e) => Events.fromJson(e)).toList();
      return wishlist;
    } else {
      return [];
    }
  }

  Future<void> addToWishlist(Events event) async {
    List<Events> wishlist = await getWishlist();
    wishlist.add(event);
    saveWishlist(wishlist);
  }

  Future<void> removeFromWishlist(Events event) async {
    List<Events> wishlist = await getWishlist();
    wishlist.removeWhere((e) => e.name == event.name);
    saveWishlist(wishlist);
  }

  Future<void> saveWishlist(List<Events> wishlist) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String wishlistString = jsonEncode(wishlist.map((e) => e.toJson()).toList());
    prefs.setString(wishlistKey, wishlistString);
  }

  var items = {'Items': []};
  bool show = false;

  @override
  void initState() {
  }



}
